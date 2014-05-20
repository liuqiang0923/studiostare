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
		// ����ǹ���IP����������ڷ�����
		if (LocationUtils.isChina(remoteHost)) {
			// ���ڷ�����������ַ
			//request.getRequestDispatcher("/ch").forward(request,response);
			response.sendRedirect("http://www.baidu.com");
		}
		// ������ʹ��������
		else {
			// ���������������ַ
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
