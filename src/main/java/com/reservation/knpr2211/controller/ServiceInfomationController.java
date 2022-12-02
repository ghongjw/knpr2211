 package com.reservation.knpr2211.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.repository.UserRepository;
import com.reservation.knpr2211.service.KakaoService;
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


	
}
