package com.flamingo.studiostare.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import twitter4j.MediaEntity;
import twitter4j.Paging;
import twitter4j.ResponseList;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

import com.flamingo.studiostare.common.ConfigUtils;
import com.flamingo.studiostare.common.FileUtils;
import com.flamingo.studiostare.entity.NewsEntity;
import com.flamingo.studiostare.service.INewsService;

/**
 * 定时获取Twitter信息
 * @author liuqiang
 */
public class TwitterJob extends QuartzJobBean {
	
	private INewsService newsService;
	private static Long sinceTwitterId=0l;
	private static boolean isInit = false;
	private static boolean isExecuting = false;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		try {
			if (isExecuting) return;
			isExecuting = true;
			checkInit();
			ResponseList<Status> userTimeline = getTwitterList(1, 1000, sinceTwitterId);
			if (userTimeline == null || userTimeline.size() == 0) return;
			for (Status status : userTimeline) {
				saveTwitter(status);
				sinceTwitterId = status.getId();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			isExecuting = false;
		}
	}
	
	/**
	 * 保存推文信息
	 * @param status
	 */
	private void saveTwitter(Status status) {
		NewsEntity news = new NewsEntity();
		String twitterContent = status.getText();
		// 截取6个字符为标题
		news.setTitle(twitterContent.substring(0, twitterContent.length() > 6 ? 6 : twitterContent.length()));
		news.setContent(twitterContent);
		news.setTwitterId(status.getId());
		if (status.getMediaEntities().length > 0) {
			MediaEntity mediaEntity = status.getMediaEntities()[0];
			news.setPhotoPath(FileUtils.saveFile(mediaEntity.getMediaURL()));
		}
		newsService.add(news);
	}
	
	/**
	 * 第一次加载sinceTwitterId
	 */
	private void checkInit() {
		if (!isInit) {
			initConfig();
			setSinceTwitterId();
			isInit = true;
		}
	}
	
	private static TwitterFactory tf = null;
	
	private void initConfig() {
		ConfigurationBuilder cb = new ConfigurationBuilder();
		cb.setDebugEnabled(true)
		  .setOAuthConsumerKey(ConfigUtils.get("oauth.consumerKey", "4U8S7dTMYM2RGWT1RbXSF7zh6"))
		  .setOAuthConsumerSecret(ConfigUtils.get("oauth.consumerSecret", "M5yxGIe4SUiHfUPpDsXeDmAkcP7Jn0hzJhzPBGauDWBfAdGod2"))
		  .setOAuthAccessToken(ConfigUtils.get("oauth.accessToken", "187217848-vDKCuq5v5uEXlTNmbTVx1XFmqmE160DbyNW3mZjk"))
		  .setOAuthAccessTokenSecret(ConfigUtils.get("oauth.accessTokenSecret", "pqrLDzpWjdhFBkxcyXaxzQhVMN1V6imSGhgdSoobVxo6B"));
		tf = new TwitterFactory(cb.build());
	}
	
	/**
	 * 从Twitter服务器中拉取Twitter信息
	 * @param page
	 * @param pageSize
	 * @param sinceId
	 * @return
	 */
	private ResponseList<Status> getTwitterList(int page, int pageSize, long sinceId) {
		try {
			if (tf == null) return null;
			Twitter twitter = tf.getInstance();//TwitterFactory.getSingleton();
			Paging paging = new Paging(page, pageSize);
			if (sinceId > 0) paging.sinceId(sinceId);
			ResponseList<Status> userTimeline = twitter.getUserTimeline(paging);
			return userTimeline;
		} catch (TwitterException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取最后一条twitterID
	 * @return
	 */
	private void setSinceTwitterId() {
		if (sinceTwitterId == null || sinceTwitterId == 0l) {
			sinceTwitterId = getSinceTwitterIdFromDb();
			if (sinceTwitterId == null || sinceTwitterId == 0l) 
				sinceTwitterId = getSinceTwitterIdFromTwitter();
		}
	}
	
	private long getSinceTwitterIdFromDb() {
//		return newsService.getMaxTwitterId();
		return 0;
	}
	
	/**
	 * 获取最后一条Twitter信息ID
	 * @return
	 */
	private long getSinceTwitterIdFromTwitter() {
		ResponseList<Status> twitterList = getTwitterList(1, 1, 0);
		if (twitterList != null && twitterList.size() > 0) {
			Status status = twitterList.get(0);
			System.out.println(status.getId());
			//return status.getId();
		}
		return 0;
	}

	public INewsService getNewsService() {
		return newsService;
	}
	public void setNewsService(INewsService newsService) {
		this.newsService = newsService;
	}

	
}
