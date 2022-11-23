package com.reservation.knpr2211.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.repository.UserRepository;
import com.reservation.knpr2211.service.UserService;

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
	@RequestMapping("shelterInfo")
	public String selterInfo() {
		return  "serviceGuide/shelterInfo";
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
	@Autowired UserService userservice;
	@Autowired private HttpSession session;
	@PostMapping(value =  "loginproc")
	public String loginproc(String id, String pw) {
	userservice.login(id, pw);	
	System.out.println(userservice.login(id, pw));
	String msg= userservice.login(id, pw);
	
	if(msg.equals("로그인 성공")) {
		
	return "login/index";}
	
	
	return "login/login";
	}
		
	//회원가입
	@RequestMapping("register")
	public String register() {
				
			
	return  "login/register";
	}
	//회원가입 버튼 
	@RequestMapping ("RegisterProc")
	public String RegisterProc(String id, String pw, String PwCon, String name, String email, String mobile,String member ,Model model) {
		
		
		String msg = userservice.register(id,pw ,PwCon, name, email, mobile, member);
		System.out.println(msg);
		if(msg.equals("회원가입 성공")) {
		System.out.println("회원가입 성공");
		return "redirect:login";
		}
		System.out.println("회원가입 실패");
		return "redirect:register";
	}
	//회원가입 버튼 
		@RequestMapping ("UserModifyProc")
		public String UserModifyProc(String id,String pw, String PwCon, String name, String email, String mobile,String member ,Model model) {
			
			

			
			String msg = userservice.UserModify(id, pw ,PwCon, name, email, mobile, member);
			System.out.println(msg);
			if(msg.equals("회원정보 수정 성공")) {
			System.out.println("회원정보수정 성공");
			return "redirect:index";
			}
			System.out.println("회원정보수정 실패");
			return "redirect:register";
		}
	
	
	@PostMapping(value = "IdConfirm" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String IdConfirm(@RequestBody(required = false) String id) {
		
		String msg = userservice.IdConfirm(id);
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

	@RequestMapping("UserModify")
	public String UserModity() {
		
		
		return "login/UserModify";
	}
	

}
