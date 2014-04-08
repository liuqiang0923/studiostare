package com.flamingo.studiostare.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.util.Streams;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.flamingo.studiostare.common.FileUtils;
import com.flamingo.studiostare.common.StringUtils;

@Controller
public class FileAction {
	
	@RequestMapping(value="down", method=RequestMethod.GET)
	public String login(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String url = StringUtils.trim(request.getParameter("url"));
		if (url.length() > 1) {
			File file = new File(FileUtils.getFileRoot() + "/" + url);
			if (!file.exists()) {
				return null;
			}
			// view为1时表示查看图片，否则下载文件
			String view = StringUtils.trim(request.getParameter("view"));
			if (!"1".equals(view) ) {
				response.addHeader("Content-Disposition", "attachment;filename=" + FileUtils.getFileName(file.getName()));
			}
			
			try {
				Streams.copy(new FileInputStream(file), response.getOutputStream(), true);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}

		return null;
	}
	
}
