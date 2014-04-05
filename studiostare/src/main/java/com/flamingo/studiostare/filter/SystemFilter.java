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
 * �жϹ���ҳ���Ƿ���Ҫ��½�������Ҫ�����ж��Ƿ��Ѿ���½�����δ��½������ת����½ҳ
 * @author liuqiang
 *
 */
public class SystemFilter implements Filter {

	private static String encoding = "UTF-8";

	private static final String[] checkPages = { "admin" };

	/**
	 * ���ܼ�¼��־��servletPath
	 */
	public static final String[] cannotLogServletPaths = { "/login!logout.action" };

	@Override
	public void destroy() { }

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
			ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		httpRequest.setCharacterEncoding(encoding);

		// ���Ự���ڣ�ת����¼ҳ
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
	 * �жϵ�ǰ�����Ƿ���Ч��
	 * trueΪ��Ч��falseΪ��Ч
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
	 * ����ժҪ���ж��Ƿ���Ҫ�ж�session����. ����˵����. 1��. 2��.
	 * 
	 * @param httpRequest
	 * @return trueΪ��Ҫ��falseΪ����Ҫ
	 */
	private boolean isCheck(HttpServletRequest httpRequest) {
		boolean ret = false;
		String uri = httpRequest.getRequestURI();
		if (uri.charAt(0) != '/') {
			uri = "/" + uri;
		}

		for (int i = 0; i < checkPages.length; i++) {

			// ����ǵ�½ҳ������Ҫ��֤ 
			if (uri.indexOf("admin-login") != -1) 
				return false;
			
			// ������������ҳ�棬����Ҫ������֤
			if (uri.indexOf(checkPages[i]) != -1) {
				ret = true;
				break;
			}
		}
		return ret;
	}

}