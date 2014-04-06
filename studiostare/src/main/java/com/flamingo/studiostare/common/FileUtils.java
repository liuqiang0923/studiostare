package com.flamingo.studiostare.common;

import java.io.File;
import java.io.IOException;

/**
 * 文件读写
 * @author liuqiang
 */
public class FileUtils {

	/**
	 * 保存文件
	 * @param filename
	 * @param filebytes
	 */
	public static String saveFile(String filename, byte[] filebytes) {
		String absPath = createFileName(filename);
		try {
			File file = new File(getFileRoot()+"/"+absPath);
			org.apache.commons.io.FileUtils.writeByteArrayToFile(file, filebytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return absPath;
	}
	
	/**
	 * 提取原文件名
	 * @param filename 原文件名_毫秒数.文件格式
	 * @return
	 */
	public static String getFileName(String filename) {
		int i = filename.lastIndexOf("_");
		int j = filename.lastIndexOf(".");
		return filename.substring(0, i)+filename.substring(j);
	}
	
	/**
	 * 创建唯一文件名 : 原文件名_毫秒数.文件格式
	 * @param filename 原文件名
	 * @return
	 */
	public static String createFileName(String filename) {
		String prefix = filename.substring(0, filename.lastIndexOf("."));
		String suffix = filename.substring(filename.lastIndexOf("."));
		return prefix+"_"+System.currentTimeMillis()+suffix;
	}
	
	/**
	 * 获取文件存放根目录
	 * @return
	 */
	public static String getFileRoot() {
		return ConfigUtils.get("data.root.path", "/data/files/");
	}
	
	public static void main(String[] args) {
		System.out.println(createFileName("abc.txt"));
		System.out.println(getFileName("abc_234231423.txt"));
	}
	
}
