package com.reservation.knpr2211.information.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.Repository.UserRepository;
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
		
	@RequestMapping("login")
	public String login() {
			return  "login/login";
		}
		
	//로그인 버튼
	@Autowired UserRepository user;	
	@Autowired userService userservice;
	@Autowired private HttpSession session;
	@PostMapping(value =  "loginproc")
	public String loginproc(String id, String pw) {
	userservice.login(id, pw);	
	System.out.println(userservice.login(id, pw));
	String msg= userservice.login(id, pw);
	
	if(msg.equals("아이디를 입력하세요")) {
		
	return "login/login";}
	
	
	return "login/login";
	}
		
	//회원가입
	@RequestMapping("register")
	public String register() {
				
			
	return  "login/register";
	}
	//회원가입 버튼 
	@RequestMapping ("RegisterProc")
	public String RegisterProc(String id, String pw, String pwcon, String name, String email, String mobile,String member ,Model model) {
		
		
		userservice.register(id, pw,pwcon, name, email, mobile, member);
		String msg = userservice.register(id,pw ,pwcon, name, email, mobile, member);
		
		if(msg.equals("회원가입 성공")) {
		System.out.println("회원가입 성공");
		return "login/login";
		}
		System.out.println("회원가입 실패");
		return msg;
	}
	
	@PostMapping(value = "IdConfirm" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String IdConfirm(@RequestBody(required = false) String id) {
		
		String msg = userservice.IdConfirm(id);
		System.out.println(msg);
		return msg;
	}	
		
	@PostMapping(value = "PwConfirm" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String PwConfirm(@RequestBody(required = false) String pw, String PwCon) {
		System.out.println("비밀번호 확인: "+PwCon);
		String msg = userservice.PwConfirm(pw, PwCon);
		System.out.println(msg);
		return msg;
	}	
	
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "redirect:login";
	} 
	
	@RequestMapping("index")
	public String index() {
		
		return "login/index";
	}
	
}
