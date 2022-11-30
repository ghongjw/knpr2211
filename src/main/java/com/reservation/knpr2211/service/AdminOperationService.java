package com.reservation.knpr2211.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.repository.PlaceRepository;

@Service
public class AdminOperationService {
	@Autowired PlaceRepository pr;
	@Autowired MountainCodeService mcs;
	
	//category2 이름 가져오기
	public void findCategory2(String category1) {
		
		List<String> category2 = pr.findDistintCategory2(category1);
		List<String> nameCategory2 = new ArrayList<String>();
		
		for(String code : category2) {
			mcs.findCategory(code);
			nameCategory2.add(code);
		}
		String select2 = "";
		
		for(int i = 0; i<category2.size(); i++) {
			select2="<option value = \""+category2.get(i)+"\">
		}
		
	}
	
	

}
