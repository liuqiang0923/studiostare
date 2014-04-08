package com.flamingo.studiostare.web.controller;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class JsonAction {
	
	protected void output(HttpServletResponse response, String result) {
		try {
			response.setContentType("application/json; charset=UTF-8");
			// 需要设定编码，否则可能导致客户端解析出来的数据不完整
			response.setContentLength(((String) result).getBytes("UTF-8").length);
			OutputStream out = response.getOutputStream();
			out.write(result.getBytes("UTF-8"));
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
