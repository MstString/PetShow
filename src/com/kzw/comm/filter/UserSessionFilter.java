package com.kzw.comm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.kzw.petshow.entity.Admin;
import com.kzw.petshow.entity.Editor;
import com.kzw.petshow.entity.User;

/**
 * 判断用户Session是否过期
 * */
public class UserSessionFilter implements Filter {
	
	private static String[] exclude_path = { "/css/", "/img/", "/fonts/", "/js/", "/ajax/", "/user/login", "/editor/login", 
		"/admin/login", "/attachFiles", "/login.jsp"};
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		String url = request.getServletPath();
		if (StringUtils.startsWithAny(url, exclude_path)) { 
			chain.doFilter(req, resp);
			return;
		}
		
		User user = (User) request.getSession().getAttribute("USER");
		Editor editor = (Editor) request.getSession().getAttribute("EDITOR");
		Admin admin = (Admin) request.getSession().getAttribute("ADMIN");

		if (user == null && editor == null && admin == null) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		} else {
			chain.doFilter(req, resp);
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
