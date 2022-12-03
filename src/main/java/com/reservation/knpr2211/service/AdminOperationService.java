package com.reservation.knpr2211.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.repository.PlaceRepository;

@Service
public class AdminOperationService {
	@Autowired PlaceRepository pr;
	@Autowired MountainCodeService mcs;

	
	//category2 이름 가져오기
	public String findCategory2(String category1) {
		category1=category1.substring(0, category1.length()-1);
		ArrayList<String> category2 = pr.findDistintCategory2(category1);
		ArrayList<String> nameCategory2 = new ArrayList<String>();
		
		for(String code : category2) {
			code = mcs.findCategory(code);
			nameCategory2.add(code);
		}
		String select2 = "<option>선택하세요</option>";
		
		for(int i = 0; i<category2.size(); i++) {
		select2 = select2+"<option value = \""+category2.get(i)+"\">"+nameCategory2.get(i)+"</option>";
		}
		return select2;
	}

	public String findCategory3(String category2) {
		
		category2=category2.substring(0, category2.length()-1);
		ArrayList<String> category3 = pr.findDistintCategory3(category2);
		ArrayList<String> nameCategory3 = new ArrayList<String>();
		
		for(String code : category3) {
			code = mcs.findCategory(code);
			nameCategory3.add(code);
		}
		String select2 = "<option>선택하세요</option>";
		
		for(int i = 0; i<category3.size(); i++) {
		select2 = select2+"<option value = \""+category3.get(i)+"\">"+nameCategory3.get(i)+"</option>";
		}
		return select2;
	}
	public String findCategory4(String category3) {
		
		category3=category3.substring(0, category3.length()-1);
		ArrayList<String> category4 = pr.findDistintCategory4(category3);
		ArrayList<String> nameCategory4 = new ArrayList<String>();
		
		for(String code : category4) {
			code = mcs.findCategory(code);
			nameCategory4.add(code);
		}
		String select2 = "<option>선택하세요</option>";
		
		for(int i = 0; i<category4.size(); i++) {
		select2 = select2+"<option value = \""+category4.get(i)+"\">"+nameCategory4.get(i)+"</option>";
		}
		return select2;
	}
	public String findRoom(String category4) {
		String category3 = category4.substring(0, 5);
		category4 = category4.substring(0, category4.length()-1);
		
		ArrayList<String> category4s = pr.findDistintCategory4(category3);
		ArrayList<String> nameCategory4 = new ArrayList<String>();
		
		ArrayList<String> room = pr.findDistintRoom(category4);
		ArrayList<String> nameRoom = new ArrayList<String>();
		
		for(String code : category4s) {
			code = mcs.findCategory(code);
			nameCategory4.add(code);
		}
		
			for(int i = 1; i<=room.size(); i++) {
				String tmp = nameCategory4.get(0) + " - " + i;
				nameRoom.add(tmp);
			}
		
		
		String select2 = "";
		
		for(int i = 0; i <nameRoom.size(); i++) {
		select2 = select2+"<input class='opeRadio' style = 'display:none;' type='radio' id='opeRadio"+i+"' name='room' value ='"
							+nameRoom.get(i)+"'><label for='opeRadio"+i+"'>"+nameRoom.get(i)+"</label>";
		}
		return select2;
	}

	
}
