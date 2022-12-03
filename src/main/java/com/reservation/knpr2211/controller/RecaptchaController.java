package com.reservation.knpr2211.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.service.VerifyRecaptchaService;

@Controller
@RequestMapping("/pro")
public class RecaptchaController{
	@ResponseBody
	@RequestMapping(value = "/VerifyRecaptcha", method = RequestMethod.POST)
	public int VerifyRecaptcha(HttpServletRequest request) {
		//구글 리캡차 비밀키 입력하기
		 VerifyRecaptchaService.setSecretKey("6Lckc0QjAAAAAJ3dfyCfuAZJZLe9Vk6Sbm3Id7Ir");
		    String gRecaptchaResponse = request.getParameter("recaptcha");
		    try {
		       if(VerifyRecaptchaService.verify(gRecaptchaResponse))
		          return 0; // 성공
		       else return 1; // 실패
		    } catch (Exception e) {
		        e.printStackTrace();
		        return -1; //에러
		    }
	}
}