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
public class LoginController {

	//로그인
		
	@RequestMapping("login")
	public String login() {
		
	session.removeAttribute("msg");	
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
		session.removeAttribute("msg");			
			
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
		session.setAttribute("msg", msg);
		return "login/register";
	}
	//회원정보 수정버튼 
		@RequestMapping ("UserModifyProc")
		public String UserModifyProc(String id,String pw, String PwCon, String name, String email, String mobile,String member ,Model model) {
			
			

			
			String msg = userservice.UserModify(id, pw ,PwCon, name, email, mobile, member);
			System.out.println(msg);
			if(msg.equals("회원정보 수정 성공")) {
			System.out.println("회원정보수정 성공");
			return "redirect:index";
			}
			System.out.println("회원정보수정 실패");
			return "redirect:UserModify";
		}
	
	//아이디중복확인 
	@PostMapping(value = "IdConfirm" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String IdConfirm(@RequestBody(required = false) String id) {
		
		String msg = userservice.IdConfirm(id);
		System.out.println(msg);
		return msg;
	}	
	//로그아웃	
	@RequestMapping("logout")
	public String logout() {
		String accessToken = (String)session.getAttribute("accessToken");
		session.invalidate();
		if(accessToken != null) {
			kakaoService.unlink(accessToken);
			System.out.println("카카오 로그아웃 성공");
		}
		return "redirect:login";
	} 
	//메인
	@RequestMapping("index")
	public String index() {
		
		return "login/index";
	}
	//회원정보 수정 페이지 
	
	@RequestMapping("UserModify")
	public String UserModity() {
		session.setAttribute("msg", "");
	String id = (String)session.getAttribute("id");
	System.out.println((String)session.getAttribute("id"));
	String IdCheck = id.substring(0,5);
	System.out.println("카카오 :"+IdCheck);
	session.setAttribute("Idcheck", IdCheck);
	
		if(IdCheck.equals("kakao")) {
			
			
			
			return "login/index";
		}
			
		
		
		return "login/UserModify";
	}
	
	//카카오 로그인
	@Autowired KakaoService kakaoService;
	@GetMapping("KakaoLogin")
	public String KakaoLogin(String code) {
		System.out.println("인가 코드 : " + code);
		String accessToken = kakaoService.getAccessToken(code);
		HashMap<String, String> userInfo = kakaoService.getUserInfo(accessToken);
		
		String id = "kakao_" + userInfo.get("nickname") ;
		String pw = "kakao";
		String name = userInfo.get("nickname");
		String email = userInfo.get("email");
		String mobile = "kakao";
		String member = "normal";
		
	
		userservice.kakaoRegister(id, pw, name, email , mobile, member);
		
		System.out.println("카카오로 접속한 아이디"+id);
		session.setAttribute("accessToken", accessToken);
		session.setAttribute("id", id);
		session.setAttribute("name", userInfo.get("nickname"));
		session.setAttribute("email", userInfo.get("email"));
		session.setAttribute("mobile", mobile);
		return "login/index";
	}
	
	//아이디 찾기
	@RequestMapping("IdFind")
	public String IdFind(String email) {
		
		session.setAttribute("msg", "");
			
	return  "login/IdFind";
	}
	//아이디 찾기 결과
	@RequestMapping("IdFindResult")
	public String IdFindResult() {
		
		session.setAttribute("msg", "");
			
	return  "login/IdFindResult";
	}
	
	//아이디 찾기 버튼
	@RequestMapping ("IdFindProc")
	public String IdFindProc(String email,String mailnumber ,Model model) {
		System.out.println(session.getAttribute("authStatus"));
		if(email.equals("") || email== null) {
			session.setAttribute("msg", "이메일을 입력해 주세요");
			return "redirect:IdFind";
		}
		if(mailnumber.equals("") || mailnumber== null) {
			session.setAttribute("msg","인증번호를 확인해 주세요");
			return "redirect:IdFind";
		}
		String status = (String)session.getAttribute("IdauthStatus");
		
		if(status == null) {
			
			session.setAttribute("msg", "이메일을 인증해주세요.");
		}
		else if(session.getAttribute("IdauthStatus").toString().equals("true")) {
			
			String id = userservice.FindById(email);	
			System.out.println("아이디 :" + id);
			session.setAttribute("IdResult", id);
			session.setAttribute("msg", "");
			return"redirect:IdFindResult";
		};

		session.setAttribute("msg", "인증번호를 확인하세요");
		return "redirect:IdFind";
	}
	
	//비밀번호 찾기
	@RequestMapping("PwFind")
	public String PwFind() {
		
		session.setAttribute("msg", "");
			
	return  "login/PwFind";
	}
	
	//비밀번호 찾기
	@RequestMapping("PwFind2")
	public String PwFind2() {
		
		session.setAttribute("msg", "");
			
	return  "login/PwFind2";
	}
	
	@RequestMapping("PwFindIdProc")
	public String PwFindIdProc(String id) {
		
		//String Email = userservice.FindByEmail(id);
		
		session.setAttribute("FindPwId", id);
		
		String msg = userservice.IdFind(id);
		
		if(msg=="등록되지 않은 사용자입니다." ||msg=="아이디를 입력해주세요.") {
			
		session.setAttribute("msg", msg);
		return"login/PwFind";
		}
		
		session.setAttribute("msg", "");
		return "redirect:PwFind2";
		
		
	}
	@RequestMapping("PwChange")
	public String PwChange() {
		
		session.setAttribute("msg", "");
	
	return  "login/PwChange";
	}
	
	
	@RequestMapping("PwChangeProc")
	public String PwChangeProc(String email, String id, String mailnumber) {
		
		if(email == "" || email == null) {
			session.setAttribute("msg", "이메일을 입력해 주세요");
			return "redirect:PwFind2";
		}
		if(mailnumber== "" || mailnumber == null) {
			
			session.setAttribute("msg", "이메일을 인증해 주시기 바랍니다.");
			return "redirect:PwFind2";
		}
		boolean check = session.getAttribute("PwFindauthStatus").toString().equals("true");
	if(check == false) {
		
		session.setAttribute("msg", "이메일을 인증해 주시기 바랍니다.");
		
		return "redirect:PwFind2";
	}
		
	else
		session.setAttribute("msg", "");
		return "redirect:PwChange";
	}
	
	@RequestMapping("PwChangeSuccess")
	public String PwChangeSuccess(String email, String id, String pw, String PwCon, String mobile, String member, String name) {
		session.setAttribute("msg", "");
	if(pw == ""||pw ==null) {
			
			session.setAttribute("msg", "비밀번호를 입력해주세요.");
			
			return "redirect:PwChange";
		}
	if(PwCon == ""||PwCon ==null) {
		
		session.setAttribute("msg", "비밀번호를 입력해주세요.");
		
		return "redirect:PwChange";
		}
		if(pw.equals(PwCon)==false) {
			
			session.setAttribute("msg", "비밀번호가 다릅니다.");
			
			return "redirect:PwChange";
		}
		
		userservice.idFindPwChange(id, pw ,PwCon, name, email, mobile, member);
		
		session.setAttribute("msg", "");
		return "redirect:login";
	}
}
