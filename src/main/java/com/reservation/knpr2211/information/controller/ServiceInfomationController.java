package com.reservation.knpr2211.information.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.service.userService;

@Controller
public class ServiceInfomationController {

	@RequestMapping("test")
	public String test() {
		return "test";
	}
	//야영장
	@RequestMapping("campsiteInfo")
	public String campsiteInfo() {
		return  "serviceGuide/campsiteInfo";
	}
	//대피소
	@RequestMapping("selterInfo")
	public String selterInfo() {
		return  "serviceGuide/selterInfo";
	}
	//생태탐방원
	@RequestMapping("ecologyInfo")
	public String ecologyInfo() {
		return  "serviceGuide/ecologyInfo";
	}
	//민박촌
	@RequestMapping("cottageInfo")
	public String cottageInfo() {
		return  "serviceGuide/cottageInfo";
	}
	//로그인
		@Autowired userService userservice;
		@RequestMapping("login")
		public String login(String id, String pw, Model model) {
			
		userservice.login(id, pw);	
		
			return  "login/login";
		}
		
	//회원가입
		@RequestMapping("register")
		public String register(String id, String pw, String pwcon, String name, String email, String mobile,String member ,Model model) {
			
			
		userservice.register(id, pw, name, email, mobile, member);	
			
			
			return  "login/register";
				}	
}
