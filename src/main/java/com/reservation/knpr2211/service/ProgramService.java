package com.reservation.knpr2211.service;

import java.io.File;
import java.io.FilenameFilter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.entity.Program;
import com.reservation.knpr2211.repository.ProgramRepository;

@Service
public class ProgramService implements IProgramService{
	@Autowired ProgramRepository pr;
	@Autowired HttpSession session;
	@Autowired MountainCodeService mcs;
	// (시작)작성자:공주원 ==============================================
	public String setProgram(String parkId, String type) {
		
		List<Program> programs = pr.findByPlace(parkId);
		session.setAttribute("programs", programs);
		
		for(Program p : programs) {
			System.out.println(p.getTitle());
			System.out.println(p.getPlace());
		}
		return mcs.findCategory(parkId);
	}
	@Override
	public String imageFile(String seq) {
		seq=seq.substring(0, seq.length()-1);
		String location = FILE_LOCATION+"p_"+seq;
		String nameLike = "p"+seq+"_";
		System.out.println(location+" : "+nameLike);
		File dir = new File(location);
		FilenameFilter filter = new FilenameFilter() {
		    public boolean accept(File f, String name) {
		        return name.startsWith(nameLike);
		    }
		};
		File files[] = dir.listFiles(filter);
		int i = 0;
		for (i = 0; i < files.length; i++) {
		System.out.println("file: " + files[i]);
		}String str = Integer.toString(i);
		return "4";
		//return str;
	}
	// (끝)작성자:공주원 ==============================================
}
