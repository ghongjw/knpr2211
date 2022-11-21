package com.reservation.knpr2211.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.entity.Program;
import com.reservation.knpr2211.repository.ProgramRepository;

@Service
public class ProgramService {
	@Autowired ProgramRepository pr;
	@Autowired HttpSession session;
	@Autowired MountainCodeService mcs;
	
	public String setProgram(String parkId) {
		
		System.out.println(parkId);
		List<Program> programs = pr.findByPlace(parkId);
		session.setAttribute("programs", programs);
		System.out.println(programs);
		return mcs.findCategory(parkId);
	}

}
