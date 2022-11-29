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
		user = (User)session.getAttribute("member");
		if(user == null) {
			System.out.println("여기는 오니???1");	
			response.sendRedirect("index");
			return false;
		}
		String isAdmin = user.getMember();
		if("normal".equals(isAdmin)) {
			System.out.println("여기는 오니???2");
			response.sendRedirect("index");

			return false;
		}else {
			System.out.println(">>>>interceptor>>>>>");
			return true;
		}
		
	}
}
