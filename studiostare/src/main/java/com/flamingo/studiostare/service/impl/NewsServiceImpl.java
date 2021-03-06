package com.flamingo.studiostare.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.flamingo.studiostare.common.FileUtils;
import com.flamingo.studiostare.dao.INewsDao;
import com.flamingo.studiostare.entity.NewsEntity;
import com.flamingo.studiostare.service.INewsService;

@Service("newsService")
public class NewsServiceImpl implements INewsService {

	@Autowired
	private INewsDao newsDao;

	@Override
	public NewsEntity getById(int id) {
		return newsDao.selectNewsById(id);
	}

	public List<NewsEntity> findNews(NewsEntity news) {
		return newsDao.selectNews(news);
	}

	public void delete(int id) {
		newsDao.deleteNewsById(id);
	}

	public void add(NewsEntity news) {
		newsDao.insertNews(news);
	}

	public void save(NewsEntity news, MultipartFile newsimg,
			MultipartFile newsvideomp4, MultipartFile newsvideowebm,
			MultipartFile newsvideoogg) throws IOException {
		if (news.getId() == 0) {
			news.setUpdateTime(new Date());
			news.setPhotoPath(saveFile(newsimg));
			news.setVideoPathMp4(saveFile(newsvideomp4));
			news.setVideoPathWebm(saveFile(newsvideowebm));
			news.setVideoPathOgg(saveFile(newsvideoogg));
			newsDao.insertNews(news);
		} else {
			NewsEntity old = getById(news.getId());
			if (old == null) {
				news.setUpdateTime(new Date());
				if (newsimg != null && newsimg.getSize() > 0)
					news.setPhotoPath(saveFile(newsimg));
				if (newsvideomp4 != null && newsvideomp4.getSize() > 0)
					news.setVideoPathMp4(saveFile(newsvideomp4));
				if (newsvideowebm != null && newsvideowebm.getSize() > 0)
					news.setVideoPathWebm(saveFile(newsvideowebm));
				if (newsvideoogg != null && newsvideoogg.getSize() > 0)
					news.setVideoPathOgg(saveFile(newsvideoogg));
				newsDao.insertNews(news);
			} else {
				old.setTitle(news.getTitle());
				old.setContent(news.getContent());
				if (old.getUpdateTime() == null)
					old.setUpdateTime(new Date());
				if (newsimg != null && newsimg.getSize() > 0)
					old.setPhotoPath(saveFile(newsimg));
				if (newsvideomp4 != null && newsvideomp4.getSize() > 0)
					old.setVideoPathMp4(saveFile(newsvideomp4));
				if (newsvideowebm != null && newsvideowebm.getSize() > 0)
					old.setVideoPathWebm(saveFile(newsvideowebm));
				if (newsvideoogg != null && newsvideoogg.getSize() > 0)
					old.setVideoPathOgg(saveFile(newsvideoogg));
				newsDao.updateNews(old);
			}
		}
	}

	/**
	 * 保存文件，返回路径
	 * 
	 * @param file
	 * @return
	 * @throws IOException
	 */
	private String saveFile(MultipartFile file) throws IOException {
		if (file == null)
			return "";
		return FileUtils.saveFile(file.getOriginalFilename(), file.getBytes());
	}

	@Override
	public long getMaxTwitterId() {
		Long maxTwitterId = newsDao.getMaxTwitterId();
		if (maxTwitterId == null)
			return 0;
		return maxTwitterId.longValue();
	}

}
