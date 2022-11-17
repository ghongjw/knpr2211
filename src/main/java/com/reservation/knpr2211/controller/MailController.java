package com.reservation.knpr2211.controller;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.service.MailService;

@Controller

public class MailController {

	
	@Autowired private HttpSession session;
	@Autowired private MailService MailService;
	
	@ResponseBody
	@PostMapping(value = "MailSend", produces = "application/json; charset=UTF-8")
	public String MailSend(@RequestBody(required = false) String email) {
		if(email != null) {
			Random random = new Random();
			String number = String.format("%06d", random.nextInt(1000000));
			System.out.println("인증번호 : " +number);
			MailService.MailSend(email, "[인증번호]", number);
			session.setAttribute("authNumber", number);
			return "인증번호 전송";
		}
		
		
		return "이메일을 입력하세요.";
	}
	
@ResponseBody
@PostMapping(value = "MailCheck" ,produces = "application/json; charset=UTF-8")
public String MailCheck(@RequestBody(required = false) Map<String, String> map) {
	
	System.out.println("고객이 입력한 인증 번호 :" + map.get("mailnumber"));

	String sessionAuthNumber = (String)session.getAttribute("mailnumber");
	String clientAuthNumber	= map.get("mailnumber");
	
	if(sessionAuthNumber == null) {
		return "인증번호를 생성하세요";
	}
	
	if(clientAuthNumber.isEmpty()) {
		return "인증번호를 입력하세요";
	}
	
	session.setAttribute("authStatus", false);
	if(sessionAuthNumber.equals(clientAuthNumber)) {
		
		session.setAttribute("authStatus", true);
		return "인증 성공";
	}
	
	
	return "인증 실패";
}
}
