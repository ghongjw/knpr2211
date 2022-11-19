package com.reservation.knpr2211.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProgramController {
	@RequestMapping(value="programInfo")
	public String programInfo(Model model) {
		return "programInfo/programView";
	}
	
}
