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
	
	public String setProgram(String parkId, String type) {
		
		System.out.println(parkId);
		List<Program> programs = pr.findByPlaceAndType(parkId,type);
		Long cnt = pr.countByPlaceAndType(parkId,type);
		
		session.setAttribute("programs", programs);
		session.setAttribute("programs_cnt", cnt);
		
		System.out.println(programs);
		return mcs.findCategory(parkId);
	}
	

}
