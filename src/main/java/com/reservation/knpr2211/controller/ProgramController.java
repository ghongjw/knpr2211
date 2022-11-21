package com.reservation.knpr2211.controller;

import java.util.HashMap;

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
	
	@RequestMapping(value="programInfo")
	public String programInfo(Model model, String parkId) {
		//처음 페이지에 갔을때 타입을 e로 초기값을 준다.
		model.addAttribute("parkId", ps.setProgram(parkId,"e"));
		return "programInfo/programView";
	}
	
	@ResponseBody
	@PostMapping(value="programType", produces = "application/json; charset=UTF-8")
	public String programType(@RequestBody HashMap<String,String> map) {
		String parkId = map.get("parkId");
		String type = map.get("type");
		System.out.println(parkId + type);
		
		//model.addAttribute("parkId", ps.setProgram(parkId,type));
		return "programInfo/programView";
	}
	
}
