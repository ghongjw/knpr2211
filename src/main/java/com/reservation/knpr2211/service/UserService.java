package com.reservation.knpr2211.service;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.deser.DataFormatReaders.Match;
import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	@Autowired
	HttpSession session;
	
	// 회원가입
	public String register(String id, String pw, String pwcon, String name, String email, String mobile,
			String member) {
		if (id == null || id.isEmpty())
			return "아이디를 입력하세요.";

		if (pw == null || pw.isEmpty())
			return "비밀번호를 입력하세요.";
		
		if (pw.equals(pwcon)==false)
			return "비밀번호가 일치하지않습니다.";

	
		if (name == null || name.isEmpty())
			return "이름을 입력하세요.";

		if (email == null || email.isEmpty())
			return "이메일을 입력하세요.";
		
		if (mobile == null || mobile.isEmpty())
			return "연락처를 입력하세요.";

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String securePw = encoder.encode(pw);
		
		User entity = User.builder().id(id).pw(securePw).name(name).email(email).mobile(mobile).member(member).build();
		userRepository.save(entity);

		return "회원가입 성공";
	}
	
	// 회원가입
	public String kakaoRegister(String id, String pw, String name, String email, String mobile,
			String member) {
		if (id == null || id.isEmpty())
			return "아이디를 입력하세요.";

		if (pw == null || pw.isEmpty())
			return "비밀번호를 입력하세요.";
		
	
		if (name == null || name.isEmpty())
			return "이름을 입력하세요.";

		if (email == null || email.isEmpty())
			return "이메일을 입력하세요.";
		
		if (mobile == null || mobile.isEmpty())
			return "연락처를 입력하세요.";

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String securePw = encoder.encode(pw);
		
		User entity = User.builder().id(id).pw(securePw).name(name).email(email).mobile(mobile).member(member).build();
		userRepository.save(entity);

		return "회원가입 성공";
	}
	
	

	// 회원정보 수정 
		public String UserModify(String id, String pw, String pwcon, String name, String email, String mobile,
				String member) {
		
			if (pw == null || pw.isEmpty())
				return "비밀번호를 입력하세요.";
			
			if (pw.equals(pwcon)==false)
				return "비밀번호가 일치하지않습니다.";

		
			if (name == null || name.isEmpty())
				return "이름을 입력하세요.";

			if (email == null || email.isEmpty())
				return "이메일을 입력하세요.";
			
			if (mobile == null || mobile.isEmpty())
				return "연락처를 입력하세요.";

			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			String securePw = encoder.encode(pw);
			
			User entity = User.builder().id(id).pw(securePw).name(name).email(email).mobile(mobile).member(member).build();
			userRepository.save(entity);

			return "회원정보 수정 성공";
		}
	
	// 로그인
	public String login(String id, String pw) {

		if (userRepository.findByid(id) == null) {
			System.out.println("찾았다?");
			return "아이디를 입력하세요";
		}

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if (encoder.matches(pw, userRepository.findByid(id ).getPw())) {
			
			session.setAttribute("name", userRepository.findByid(id).getName());
			session.setAttribute("id", userRepository.findByid(id).getId());
			session.setAttribute("email", userRepository.findByid(id).getEmail());
			session.setAttribute("mobile", userRepository.findByid(id).getMobile());
			
			return "로그인 성공";
		}

		return "아이디 또는 비밀번호를 확인하세요.";
	}

	// 아이디 중복체크
	public String IdConfirm(String id) {

		if (userRepository.findByid(id) == null) {

			return "사용가능한 아이디입니다";
		}

		return "중복된 아이디 입니다.";
		

	}
	
	public String FindById(String email) {
		
	String id = userRepository.findByEmail(email).getId();
		
		return id;
	}
	
	public String FindByEmail(String id) {
	
		String Email = userRepository.findByid(id).getEmail();
		session.setAttribute("FindName", userRepository.findByid(id).getName());
		session.setAttribute("FindId", userRepository.findByid(id).getId());
		session.setAttribute("FindEmail", userRepository.findByid(id).getEmail());
		session.setAttribute("FindMobile", userRepository.findByid(id).getMobile());
		return Email;
	}
	
	
	
}
