package com.reservation.knpr2211.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.reservation.knpr2211.entity.Place;

@Service
public class MountainCodeService {
	public String findCategory(String parkId) {
		
		if(parkId.length()==1) {
			return category1(parkId);
		}
		else if(parkId.length()==3) {
			return category2(parkId);
		}
		else if(parkId.length()==5) {
			return category3(parkId);
		}
		else if(parkId.length()==7) {
			return category4(parkId);
		}
		return "";
	}
	
	public String category1(String parkId) {
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
	
	public String category2(String parkId) {
		
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
	public String category3(String parkId) {
		if(parkId.length()==3) {
			parkId = parkId+"01";
		System.out.println(parkId);
		}
		String category = parkId.substring(0,1);
		String category1 = parkId.substring(1,3);
		String category2 = parkId.substring(3,5);
		
		int intcat = Integer.parseInt(category2)-1;
		ArrayList<String> list = new ArrayList<>();
		
		switch (category+category1) {
		//야영장
		case "A01": list.add("삼정"); list.add("치인"); list.add("백운동"); 
			break;
			
		case "A02": list.add("동학사"); 
			break;
			
		case "A03": list.add("가인"); list.add("내장"); 
			break;
			
		case "A04": list.add("팔영상"); list.add("염포"); list.add("구계동"); 
			break;
			
		case "A05": list.add("덕유대 체류형 숙박시설"); list.add("덕유대"); //수정
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

		case "A15": list.add("구룡"); list.add("금대");
			break;

		case "A16": list.add("소도");
			break;

		case "A17": list.add("몽산포"); list.add("학암포");
			break;

		case "A18": list.add("학동");
			break;

		//대피소
		case "B01": list.add("삿갓재");
			break;	
		
		case "B02": list.add("수렴동");  list.add("중청"); list.add("양폭");  list.add("소청");  list.add("희운각"); 
			break;
		
		case "B03": list.add("제2연화봉대피소"); list.add("제2연화봉대피소");

			break;
		
		case "B04": list.add("벽소령"); list.add("세석"); list.add("장터목"); 
		list.add("로타리"); list.add("노고단"); list.add("치밭목"); 
		list.add("연하천");
		break;
		
		//생태탐방원
		case "C01": list.add("A타입(4인실)"); list.add("B타입(6인실)"); list.add("C타입(8인실)");
		
		case "C02": list.add("A타입(4인실)"); list.add("B타입(6인실)"); list.add("C타입(8인실)"); list.add("자연의집(3인실)");
		
		case "C03": list.add("A타입(4인실)"); list.add("B타입(6인실)"); list.add("C타입(8인실)");
		
		case "C04": list.add("A타입(4인실)"); list.add("C타입(8인실)");
		
		case "C05": list.add("A타입(4인실)"); list.add("B타입(6인실)"); list.add("C타입(8인실)");
		
		case "C06": list.add("A타입(4인실)"); list.add("B타입(6인실)"); list.add("자연의집(3인실)");
		
		case "C07": list.add("A타입(4인실)"); list.add("B타입(6인실)"); list.add("자연의집(3인실)");
		
		case "C08": list.add("A타입(4인실)"); list.add("B타입(6인실)"); list.add("C타입(8인실)");
		break;

		default:
			break;
		}
		//민박촌
			if(category.equals("D")) {
			list.add("온돌"); list.add("침대"); list.add("15평"); list.add("18평"); list.add("32평");
		}
		
		return list.get(intcat);
		
	}
	public String category4(String parkId) {
		String category = parkId.substring(0,5);
		String category1 = parkId.substring(5);
		
		int intcat = Integer.parseInt(category1)-1;
		ArrayList<String> list = new ArrayList<>();
		
		if(category.equals("A0101")) {
			list.add("자동차야영장");
		}else if(category.equals("A0102")) {
			list.add("자동차야영장");
		}else if(category.equals("A0103")) {
			list.add("자동차야영장"); list.add("자연의집(솔막)");
		}else if(category.equals("A0201")) {
			list.add("자동차야영장");
		}
		else if(category.equals("A0301")) {
			list.add("자동차야영장"); 
		}
		else if(category.equals("A0302")) {
			list.add("자동차야영장"); list.add("자연의집(솔막)");
		}
		else if(category.equals("A0401")) {
			list.add("자동차야영장"); 
		}
		else if(category.equals("A0402")) {
			list.add("일반야영장"); 
		}
		else if(category.equals("A0403")) {
			list.add("일반야영장"); 
		}
		else if(category.equals("A0501")) {
			list.add("자연의집(솔막)"); list.add("카라반"); list.add("통나무집"); list.add("황토집"); 
		}
		else if(category.equals("A0502")) {
			list.add("일반야영장(1영지)"); list.add("일반야영장(2영지)"); list.add("일반야영장(3영지)"); list.add("일반야영장(4영지)"); 
			list.add("일반야영장(5영지)"); list.add("일반야영장(6영지)"); list.add("일반야영장(7영지)"); list.add("카라반 전용영지(캠핑장)"); 
		}else if(category.equals("A0601")) {
			list.add("자동차야영장"); list.add("풀옵션야영장(산막텐트)"); 
		}
		else if(category.equals("A0701")) {
			list.add("자동차야영장"); list.add("자연의집(바람체)"); 
		}
		else if(category.equals("A0801")) {
			list.add("자동차야영장(전기O)"); list.add("자동차야영장(전기X)"); list.add("카라반 전용영지(캠핑카)"); list.add("카라반(체류형)"); 
		}
		else if(category.equals("A0901")) {
			list.add("자동차야영장"); list.add("자연의집(솔막)"); list.add("풀옵션야영장(산막텐트)"); 
		}
		else if(category.equals("A0902")) {
			list.add("자동차야영장"); list.add("풀옵션야영장(산막텐트)"); list.add("풀옵션야영장(일반텐트)"); 
		}
		else if(category.equals("A1001")) {
			list.add("자동차야영장(전기O)"); list.add("자동차야영장(전기X)"); list.add("자연의집(솔막)"); 
			list.add("자연의집(특화형-4인)"); list.add("카라반 전용영지(캠핑카)"); list.add("카라반(체류형)"); 
		}
		else if(category.equals("A1101")) {
			list.add("자연의집(솔막)");
		}
		else if(category.equals("A1102")) {
			list.add("자동차야영장");
		}
		else if(category.equals("A1103")) {
			list.add("자동차야영장");
		}
		else if(category.equals("A1104")) {
			list.add("자동차야영장"); list.add("카라반 겸용영지");
		}
		else if(category.equals("A1105")) {
			list.add("자동차야영장");
		}
		else if(category.equals("A1106")) {
			list.add("자동차야영장(캠핑장)"); list.add("카라반 겸용영지");
		}
		else if(category.equals("A1201")) {
			list.add("자동차야영장"); list.add("자연의집(특화형-4인)"); list.add("자연의집(하늘채)");
		}
		else if(category.equals("A1301")) {
			list.add("자동차야영장"); list.add("카라반(체류형)");
		}
		else if(category.equals("A1401")) {
			list.add("카라반 전용영지(캠핑카)"); list.add("카라반(체류형)");
		}
		else if(category.equals("A1402")) {
			list.add("자동차야영장"); list.add("자연의집(솔막)");
		}
		else if(category.equals("A1403")) {
			list.add("일반야영장");
		}
		else if(category.equals("A1404")) {
			list.add("자동차야영장");
		}
		else if(category.equals("A1405")) {
			list.add("자동차야영장");
		}
		else if(category.equals("A1406")) {
			list.add("일반야영장");
		}else if(category.equals("A1407")) {
			list.add("일반야영장"); list.add("일반야영장(데크)");
		}
		else if(category.equals("A1408")) {
			list.add("자동차야영장"); list.add("자연의집(솔막)"); list.add("자연의집(하늘채)"); list.add("카라반 전용영지(캠핑카)"); list.add("카라반(체류형)");
		}else if(category.equals("A1409")) {
			list.add("일반야영장"); list.add("일반야영장(데크)");
		}
		else if(category.equals("A1501")) {
			list.add("자동차야영장"); list.add("자연의집(솔막)"); list.add("카라반(체류형)");
		}
		else if(category.equals("A1502")) {
			list.add("자동차야영장");
		}
		else if(category.equals("A1601")) {
			list.add(" ");
		}
		else if(category.equals("A1701")) {
			list.add("자동차야영장");
		}
		else if(category.equals("A1702")) {
			list.add("자동차야영장");	list.add("자동차야영장(캠핑카)");
		}else if(category.equals("A1801")) {
			list.add("자동차야영장");	list.add("카라반 겸용영지"); list.add("카라반(체류형)");
		}
		
		else if(category.equals("B0101")) {
			list.add("대피소");
		}
		else if(category.equals("B0201")) {
			list.add("대피소");}
		else if(category.equals("B0202")) {
			list.add("대피소");}
		else if(category.equals("B0203")) {
			list.add("대피소");}
		else if(category.equals("B0204")) {
			list.add("대피소");}
		else if(category.equals("B0205")) {
			list.add("대피소");}
		else if(category.equals("B0301")) {
			list.add("자동차야영장");}
		else if(category.equals("B0401")) {
			list.add("대피소");}
		else if(category.equals("B0402")) {
			list.add("대피소");}
		else if(category.equals("B0403")) {
			list.add("대피소");}
		else if(category.equals("B0404")) {
			list.add("대피소");}
		else if(category.equals("B0405")) {
			list.add("자동차야영장");	list.add("자동차야영장(캠핑카)");
		}else if(category.equals("B0406")) {
			list.add("자동차야영장");	list.add("카라반 겸용영지"); list.add("카라반(체류형)");
		}
		else if(category.equals("B0407")) {
			list.add(" ");}
		return list.get(intcat);
	}
	
	public ArrayList<String> category2List(String parkId){
		ArrayList<String> park = new ArrayList<String>();
		
		if(parkId.equals("A")) {
		park.add("가야산"); park.add("계룡산"); park.add("내장산"); park.add("다도해해상"); park.add("덕유산"); 
		park.add("무등산"); park.add("변산반도"); park.add("설악산"); park.add("소백산"); park.add("오대산"); 
		park.add("월악산"); park.add("월출산"); park.add("주왕산"); park.add("지리산"); park.add("치악산");	 
		park.add("태백산"); park.add("태안해안"); park.add("한려해상");
		}else if(parkId.equals("B")) {
			park.add("덕유산"); park.add("설악산"); park.add("소백산"); park.add("지리산");
		}else if(parkId.equals("C")) {
			park.add("가야산"); park.add("내장산"); park.add("무등산"); park.add("설악산"); park.add("소백산"); park.add("지리산");
			park.add("한려해상"); park.add("북한산");
		}else if(parkId.equals("D")) {
			park.add("태백산");
		}
		return park;
	}
}
