package com.reservation.knpr2211.controller;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.service.MailService;
import com.reservation.knpr2211.service.UserService;

@Controller

public class MailController {

	
	@Autowired private HttpSession session;
	@Autowired private MailService MailService;
	
	//회원가입 메일 보냄 
	@ResponseBody
	@PostMapping(value = "MailSend", produces = "application/json; charset=UTF-8")
	public String MailSend(@RequestBody(required = false) String email) {
		
		if(email == null) {
			
			return "이메일을 입력해주세요.";
		}
		else if(userService.Emailcheck(email)=="중복된 이메일 입니다.") {
			
			return "중복된 이메일 입니다.";
		}
		
		else {Random random = new Random();
			String number = String.format("%06d", random.nextInt(1000000));
			System.out.println("인증번호 : " +number);
			MailService.MailSend(email, "[인증번호를 발송했습니다.]","인증번호 :" + number + "를 입력해 주세요.");
			session.setAttribute("authNumber", number);
		
		return "인증번호 전송";}
	}
	//회원가입 메일 체크
	@ResponseBody
	@PostMapping(value="checkAuth", produces = "application/json; charset=UTF-8")
	public String checkAuth(@RequestBody(required = false) Map<String, String> map) {
		System.out.println("고객이 입력한 인증 번호 : " + map.get("authNumber"));
		
		// sendAuth 메소드에서 생성한 인증번호와 고객이 입력한 인증번호를 비교
		String sessionAuthNumber = (String)session.getAttribute("authNumber");
		String clientAuthNumber = map.get("authNumber");
		if(sessionAuthNumber == null ) {
			return "인증 번호를 생성하세요.";
		}
		if(clientAuthNumber.isEmpty()) {
			return "인증 번호를 입력하세요.";
		}
		
		session.setAttribute("REauthStatus", false);
		if(sessionAuthNumber.equals(clientAuthNumber)) {
			session.setAttribute("REauthStatus", true);
			return "인증 성공";
		}
		
		return "인증 실패";
	}
	//아이디찾기 메일 보내기
	@Autowired UserService us;
	@ResponseBody
	@PostMapping(value = "IdMailSend", produces = "application/json; charset=UTF-8")
	public String IdMailSend(@RequestBody(required = false) String email) {
		
		if(email == null) {
			
		return "이메일을 입력하세요.";
		}
		
		else if(us.FindByEmail2(email).equals(email)){
			
			
			Random random = new Random();
			String number = String.format("%06d", random.nextInt(1000000));
			System.out.println("인증번호 : " +number);
			MailService.MailSend(email,"[인증번호를 발송했습니다.]","인증번호 :" + number + "를 입력해 주세요.");
			session.setAttribute("authNumber", number);
			return "인증번호 전송"; 
		}
	
		
		return"	등록되지않은 이메일입니다";
	}
	
  // 아이디 찾기 메일 확인
	@ResponseBody
	@PostMapping(value="IdcheckAuth", produces = "application/json; charset=UTF-8")
	public String IdcheckAuth(@RequestBody(required = false) Map<String, String> map) {
		System.out.println("고객이 입력한 인증 번호 : " + map.get("authNumber"));
		
		// sendAuth 메소드에서 생성한 인증번호와 고객이 입력한 인증번호를 비교
		String sessionAuthNumber = (String)session.getAttribute("authNumber");
		String clientAuthNumber = map.get("authNumber");
		if(sessionAuthNumber == null ) {
			return "인증 번호를 생성하세요.";
		}
		if(clientAuthNumber.isEmpty()) {
			return "인증 번호를 입력하세요.";
		}
		
		session.setAttribute("IdauthStatus", "false");
		if(sessionAuthNumber.equals(clientAuthNumber)) {
			session.setAttribute("IdauthStatus", "true");
			return "인증 성공";
		}
		
		return "인증 실패";
	}
	
	//비밀번호 메일 보내기
	@Autowired private UserService userService;
	@ResponseBody
	@PostMapping(value = "PwFindMailSend", produces = "application/json; charset=UTF-8")
	public String PwFindMailSend(@RequestBody(required = false) String email) {
		
		String Id =(String)session.getAttribute("FindPwId");
		
		 if(userService.FindByEmail(Id).equals(email)==false) {
			 
			 return"등록된 이메일이 아닙니다.";
		 }
		if(email != null) {
			Random random = new Random();
			String number = String.format("%06d", random.nextInt(1000000));
			System.out.println("인증번호 : " +number);
			MailService.MailSend(email,"[인증번호를 발송했습니다.]","인증번호 :" + number + "를 입력해 주세요.");
			session.setAttribute("authNumber", number);
			return "인증번호 전송";
		}
		
		
		return "이메일을 입력하세요.";
	}
	// 비밀번호 찾기 메일체크
	
	@ResponseBody
	@PostMapping(value="PwFindCheckAuth", produces = "application/json; charset=UTF-8")
	public String PwFindCheckAuth(@RequestBody(required = false) Map<String, String> map) {
		System.out.println("고객이 입력한 인증 번호 : " + map.get("authNumber"));
		
		// sendAuth 메소드에서 생성한 인증번호와 고객이 입력한 인증번호를 비교
		String sessionAuthNumber = (String)session.getAttribute("authNumber");
		String clientAuthNumber = map.get("authNumber");
		if(sessionAuthNumber == null ) {
			return "인증 번호를 생성하세요.";
		}
		if(clientAuthNumber.isEmpty()) {
			return "인증 번호를 입력하세요.";
		}
		
		session.setAttribute("PwFindauthStatus", false);
		if(sessionAuthNumber.equals(clientAuthNumber)) {
			session.setAttribute("PwFindauthStatus", true);
			
			
			return "인증 성공";
		}
		
		return "인증 실패";
	}
	//회원정보 수정 메일 보내기
	@ResponseBody
	@PostMapping(value = "MoMailSend", produces = "application/json; charset=UTF-8")
	public String MoMailSend(@RequestBody(required = false) String email) {
		
		
		if(email == null) {
			return "이메일을 입력해주세요.";
		}
		
		else {
			
			Random random = new Random();
			String number = String.format("%06d", random.nextInt(1000000));
			System.out.println("인증번호 : " +number);
			MailService.MailSend(email, "[인증번호를 발송했습니다.]","인증번호 :" + number + "를 입력해 주세요.");
			session.setAttribute("authNumber", number);
			session.setAttribute("emailSame", "Insert" );
		return "인증번호 전송" ;}
		
		
	}

  // 회원정보 수정메일 체크
	@ResponseBody
	@PostMapping(value="MocheckAuth", produces = "application/json; charset=UTF-8")
	public String MocheckAuth(@RequestBody(required = false) Map<String, String> map) {
		System.out.println("고객이 입력한 인증 번호 : " + map.get("authNumber"));
		
		// sendAuth 메소드에서 생성한 인증번호와 고객이 입력한 인증번호를 비교
		String sessionAuthNumber = (String)session.getAttribute("authNumber");
		String clientAuthNumber = map.get("authNumber");
		if(sessionAuthNumber == null ) {
			return "인증 번호를 생성하세요.";
		}
		if(clientAuthNumber.isEmpty()) {
			return "인증 번호를 입력하세요.";
		}
		
		session.setAttribute("ModiAuthStatus", false);
		
		if(sessionAuthNumber.equals(clientAuthNumber)) {
			session.setAttribute("ModiAuthStatus", true);
			return "인증 성공";
		}
		
		return "인증 실패";
	}
	
}