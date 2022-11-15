package com.reservation.knpr2211.service;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.deser.DataFormatReaders.Match;
import com.reservation.knpr2211.Repository.UserRepository;
import com.reservation.knpr2211.entity.user;

@Service
	public class userService {
	
	
	@Autowired UserRepository userRepository;
	@Autowired HttpSession session;
	
	public String register(String id, String pw, String name, String email, String mobile, String member) {
		if (id == null || id.isEmpty())
			return "아이디를 입력하세요.";

		if (pw == null || pw.isEmpty())
			return "비밀번호를 입력하세요.";


		
	
		
	user entity = user.builder().id(id).pw(pw).name(name).email(email).mobile(mobile).member(member).build();
	userRepository.save(entity);	
	
		return "회원가입 성공";
	}
	
	public String login(String id,String pw) {
		
		if(userRepository.findByid(id) == null) {
			System.out.println("찾았다?");
			return "아이디를 입력하세요";
		}
			
	
		
	if(pw.equals(userRepository.findByid(id).getPw())) {
		session.setAttribute("id",userRepository.findByid(id));
		
		
		return "로그인 성공";
	}
		
		
	return "아이디 또는 비밀번호를 확인하세요.";
}
	public String IdConfirm(String id) {
	
	if(userRepository.findByid(id) == null) {
	
	return"사용가능한 아이디입니다";}
	
	return "중복된 아이디 입니다.";
}
}
