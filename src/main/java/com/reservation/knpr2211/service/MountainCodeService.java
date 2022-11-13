package com.reservation.knpr2211.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public class MountainCodeService {
	public String Category1(String parkId) {
		char cat=parkId.charAt(0);
		String category = "";
		if(cat == 'A') {
			 category = "야영장";
		 } else if(cat == 'B') {
			 category = "대피소";
		 }else if(cat == 'C') {
			 category = "생태탐방원";
		 }else{
			 category = "민박촌";
		 }
		return category;
	}
	
	public String Category2(String parkId) {
		
		String category1 = parkId.substring(0,1);
		String category2 = parkId.substring(1,3);
		
		int intcat2 = Integer.parseInt(category2)-1;
		
		String cat2 = "";
		
		ArrayList<String> parkA = new ArrayList<String>();
		parkA.add("가야산"); parkA.add("계룡산"); parkA.add("내장산"); parkA.add("다도해해상"); parkA.add("덕유산"); 
		parkA.add("무등산"); parkA.add("변산반도");	 parkA.add("설악산"); parkA.add("소백산"); parkA.add("오대산"); 
		parkA.add("월악산"); parkA.add("월출산"); parkA.add("주왕산"); parkA.add("지리산"); parkA.add("치악산");	 
		parkA.add("태백산"); parkA.add("태안해안"); parkA.add("한려해상");
		
		ArrayList<String> parkB = new ArrayList<String>();
		parkB.add("덕유산"); parkB.add("설악산"); parkB.add("소백산"); parkB.add("지리산");
		
		ArrayList<String> parkC = new ArrayList<String>();
		parkC.add("가야산"); parkC.add("내장산"); parkC.add("무등산"); parkC.add("설악산"); parkC.add("소백산"); parkC.add("지리산");
		parkC.add("한려해상"); parkC.add("북한산");
		
		ArrayList<String> parkD = new ArrayList<String>();
		parkD.add("태백산");
		
		if(category1.equals("A")) {
			cat2 = parkA.get(intcat2);
		}
		else if(category1.equals("B")) {
			cat2 = parkB.get(intcat2);
		}
		else if(category1.equals("C")) {
			cat2 = parkC.get(intcat2);
		}
		else if(category1.equals("D")) {
			cat2 = parkD.get(intcat2);
		}
		return cat2;
	}
	public String Category3(String parkId) {
		if(parkId.length()==3) {
			parkId += "01";
		}
		String category = parkId.substring(0,1);
		String category1 = parkId.substring(1,3);
		String category2 = parkId.substring(3,5);
		
		int intcat = Integer.parseInt(category2)-1;
		ArrayList<String> list = new ArrayList<>();
		
		switch (category1) {
		//야영장
		case "A01": list.add("삼정"); list.add("치인"); list.add("백운동"); 
			break;
			
		case "A02": list.add("동학사"); 
			break;
			
		case "A03": list.add("가인"); list.add("내장"); 
			break;
			
		case "A04": list.add("팔영상"); list.add("염포"); list.add("구계동"); 
			break;
			
		case "A05": list.add("덕유대 체류형 숙박시설"); list.add("덕유대 야영장");
			break;
			
		case "A06": list.add("도원"); 
			break;
			
		case "A07": list.add("고사포"); 
			break;
			
		case "A08": list.add("설악"); 
			break;
			
		case "A09": list.add("삼가"); list.add("남천"); 
			break;
			
		case "A10": list.add("소금강"); 
			break;
			
        case "A11": list.add("닷돈재 풀옵션"); list.add("닷돈재 자동차"); list.add("덕주"); list.add("송계"); 
        	list.add("용하"); list.add("하선암");
			break;

		case "A12": list.add("천황");
			break;

		case "A13": list.add("상의");
			break;

		case "A14": list.add("학천카라반"); list.add("덕동"); list.add("달궁힐링"); list.add("달궁자동차"); 
			list.add("뱅사골자동차"); list.add("뱅사골힐링"); list.add("소막골"); list.add("내원"); list.add("백무동");
			break;

		case "A15": list.add("동학사");
			break;

		case "A16": list.add("동학사");
			break;

		case "A17": list.add("동학사");
			break;

		case "A18": list.add("동학사");
			break;
			
		case "A19": list.add("동학사");
			break;

		case "A20": list.add("동학사");
			break;

		//대피소
		case "B01": list.add("삼정"); list.add("치인"); list.add("백운동"); 
			break;	
		
		case "B02": list.add("동학사"); 
			break;
		
		case "B03": list.add("가인"); list.add("내장"); 
			break;
		
		case "B04": list.add("팔영상"); list.add("염포"); list.add("구계동"); 
			break;

		default:
			break;
		}
		
		if(category.equals("C")) {
			list.add("A타입(4인실)"); list.add("B타입(6인실)"); list.add("C타입(8인실)");
		}else if(category.equals("D")) {
			list.add("온돌"); list.add("침대"); list.add("15평"); list.add("18평"); list.add("32평");
		}
		
		return list.get(intcat);
		
	}
}
