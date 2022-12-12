package com.reservation.knpr2211.handlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.reservation.knpr2211.entity.User;


public class AdminInterceptor implements HandlerInterceptor {
	@Autowired User user;
	@Autowired HttpSession session;
	
	@Override
	public boolean preHandle(
			HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		session = request.getSession();
		
		String member = (String)session.getAttribute("member");
		if(member == null) {
			response.sendRedirect("index");
			return false;
		}
		
		if("normal".equals(member)) {
			
			response.sendRedirect("index");

			return false;
		}else {
			
			return true;
		}
	}
}

