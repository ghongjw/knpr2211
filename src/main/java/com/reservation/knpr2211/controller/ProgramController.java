package com.reservation.knpr2211.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.service.ProgramService;

@Controller
public class ProgramController {
	@Autowired ProgramService ps;
	
	// (시작)작성자:공주원 ==============================================
	
	//프로그램 소개
	@RequestMapping(value="programInfo")
	public String programInfo(Model model, String parkId) {
		//처음 페이지에 갔을때 타입을 e로 초기값을 준다.
		model.addAttribute("parkId", ps.setProgram(parkId,"e"));
		return "programInfo/programView";
	}
	
	//(비동기) 이미지 파일 개수 확인 
	@ResponseBody
	@PostMapping(value="imgCount", produces = "text/html; charset=UTF-8")
	public String programType(@RequestBody String seq) {
	
		return ps.imageFile(seq);
	}
	// (끝)작성자:공주원 ==============================================
}
