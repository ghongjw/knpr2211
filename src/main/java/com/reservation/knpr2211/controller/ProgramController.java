package com.reservation.knpr2211.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.entity.Program;
import com.reservation.knpr2211.service.ProgramService;

@Controller
public class ProgramController {
	@Autowired ProgramService ps;
	
	@RequestMapping(value="programInfo")
	public String programInfo(Model model, String parkId) {
		model.addAttribute("parkId", ps.setProgram(parkId));
		return "programInfo/programView";
	}
	
}
