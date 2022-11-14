package com.reservation.knpr2211.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.Repository.UserRepository;
import com.reservation.knpr2211.entity.user;

@Service
	public class userService {
	
	@Autowired UserRepository userRepository;
	public String register(String id, String pw, String name, String email, String mobile, String member) {
		
	user entity = user.builder().id(id).pw(pw).name(name).email(email).mobile(mobile).member(member).build();
	userRepository.save(entity);	
	
		return "회원가입 성공";
	}
	
	public String login(String id,String pw) {
		
	userRepository.findByid(id);
		
	
		
		
		return "로그인 성공";
	}
	
}
