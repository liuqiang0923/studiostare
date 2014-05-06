package com.flamingo.studiostare.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 判断管理页面是否需要登陆，如果需要，则判断是否已经登陆，如果未登陆，则跳转到登陆页
 * @author liuqiang
 *
 */
public class SystemFilter implements Filter {

	private static String encoding = "UTF-8";

	private static final String[] checkPages = { "admin", "manage/" };

	@Override
	public void destroy() { }

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		httpRequest.setCharacterEncoding(encoding);

		// 如果会话过期，转到登录页
		if (isCheck(httpRequest) && !isValid(httpRequest)) {
			HttpServletResponse httpResponse = (HttpServletResponse) response;
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/manage/admin-login.html");
			return;
		}

		try {
			chain.doFilter(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
			if (ex instanceof IOException) {
				throw (IOException) ex;
			}
			if (ex instanceof ServletException) {
				throw (ServletException) ex;
			}
		} 
	}
	
	/**
	 * 判断当前请求是否有效，
	 * true为有效；false为无效
	 * 
	 * @param httpRequest
	 * @return
	 */
	private boolean isValid(HttpServletRequest httpRequest) {
		HttpSession session = httpRequest.getSession();
		if (session.getAttribute("userid") == null) 
			return false;
		return true;
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		encoding = filterConfig.getInitParameter("encoding");

		if (encoding == null || encoding.equals("")) {
			encoding = "UTF-8";
		}
	}

	/**
	 * 内容摘要：判断是否需要判断session过期. 流程说明：. 1、. 2、.
	 * 
	 * @param httpRequest
	 * @return true为需要，false为不需要
	 */
	private boolean isCheck(HttpServletRequest httpRequest) {
		boolean ret = false;
		String uri = httpRequest.getRequestURI();
		if (uri.charAt(0) != '/') {
			uri = "/" + uri;
		}

		for (int i = 0; i < checkPages.length; i++) {

			// 如果是登陆，则不需要验证 
			if (uri.indexOf("login") != -1 || uri.indexOf("resetPassword") != -1) 
				return false;
			
			// 如果是其它管理页面，则需要进行验证
			if (uri.indexOf(checkPages[i]) != -1) {
				ret = true;
				break;
			}
		}
		return ret;
	}

}