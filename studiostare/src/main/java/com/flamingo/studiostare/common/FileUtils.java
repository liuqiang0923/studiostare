package com.flamingo.studiostare.common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.web.multipart.MultipartFile;

/**
 * 文件读写
 * 
 * @author liuqiang
 */
public class FileUtils {

	/**
	 * 保存文件
	 * 
	 * @param filename
	 * @param filebytes
	 */
	public static String saveFile(String filename, byte[] filebytes) {
		String absPath = getFileRoot() + "/" + createFileName(filename);
		try {
			File file = new File(absPath);
			org.apache.commons.io.FileUtils.writeByteArrayToFile(file, filebytes);
			return absPath;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 保存远程文件
	 * 
	 * @param url
	 * @return
	 */
	public static String saveFile(String url) {
		String absPath = getFileRoot() + "/" + createFileName(getUrlFileName(url));
		
		URL urlfile = null;
		HttpURLConnection httpUrl = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		File f = new File(absPath);
		try {
			urlfile = new URL(url);
			httpUrl = (HttpURLConnection) urlfile.openConnection();
			httpUrl.connect();
			bis = new BufferedInputStream(httpUrl.getInputStream());
			bos = new BufferedOutputStream(new FileOutputStream(f));
			int len = 2048;
			byte[] b = new byte[len];
			while ((len = bis.read(b)) != -1) {
				bos.write(b, 0, len);
			}
			bos.flush();
			bis.close();
			return absPath;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (httpUrl != null) httpUrl.disconnect();
				if (bis != null) bis.close();
				if (bos != null) bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "";
	}

	/**
	 * 从URL中截取文件名
	 * 
	 * @param url
	 * @return
	 */
	public static String getUrlFileName(String url) {
		if (url == null || "".equals(url))
			return "";
		int index = url.lastIndexOf("/") + 1;
		if (index > url.length())
			return url;
		return url.substring(index);
	}

	/**
	 * 提取原文件名
	 * 
	 * @param filename
	 *            原文件名_毫秒数.文件格式
	 * @return
	 */
	public static String getFileName(String filename) {
		if (StringUtils.isNull(filename)) return "";
		int i = filename.lastIndexOf("_");
		int j = filename.lastIndexOf(".");
		if (i == -1 || j == -1) return filename;
		return filename.substring(0, i) + filename.substring(j);
	}

	/**
	 * 创建唯一文件名 : 原文件名_毫秒数.文件格式
	 * 
	 * @param filename
	 *            原文件名
	 * @return
	 */
	public static String createFileName(String filename) {
		if (StringUtils.isNull(filename)) return "";
		String prefix = filename.substring(0, filename.lastIndexOf("."));
		String suffix = filename.substring(filename.lastIndexOf("."));
		return prefix + "_" + System.currentTimeMillis() + suffix;
	}

	/**
	 * 获取文件存放根目录
	 * 
	 * @return
	 */
	public static String getFileRoot() {
		//return "D:/temp";
		return ConfigUtils.get("data.root.path", "/resources");
	}
	
	public static String saveFile(MultipartFile file) throws IOException {
		if (file == null) return "";
		return saveFile(file.getOriginalFilename(), file.getBytes());
	}

	public static void main(String[] args) {
		// System.out.println(createFileName("abc.txt"));
		 System.out.println(getFileName("abcsadfs"));
//		System.out.println(saveFile("https://pbs.twimg.com/media/Bkn5o2fCMAAJuxF.jpg"));
	}

}
