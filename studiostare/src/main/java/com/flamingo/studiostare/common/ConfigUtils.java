package com.flamingo.studiostare.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigUtils {

	private static final Properties p = new Properties();
	
	static {
		loadSystemProperties();
	}
	
	private static void loadSystemProperties() {
		try {
			InputStream inputStream = ConfigUtils.class.getClassLoader().getResourceAsStream("prop/system.properties");
			p.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String get(String key, String defValue) {
		return p.getProperty(key, defValue);
	}
	
	public static void main(String[] args) {
		System.out.println(get("data.root.path", "abc"));

	}

}
