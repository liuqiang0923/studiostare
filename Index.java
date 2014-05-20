package com.alvin.test;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alvin.util.LocationUtils;

/**
 * Servlet implementation class Index
 */
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String remoteHost = request.getRemoteHost();
		System.out.println("remoteHost:"+remoteHost);
		// 如果是国内IP，则请求国内服务器
		if (LocationUtils.isChina(remoteHost)) {
			// 国内服务器域名地址
			//request.getRequestDispatcher("/ch").forward(request,response);
			response.sendRedirect("http://www.baidu.com");
		}
		// 否则访问国外服务器
		else {
			// 国外服务器域名地址
			//request.getRequestDispatcher("/en").forward(request,response);
			response.sendRedirect("http://www.google.com");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	

}
