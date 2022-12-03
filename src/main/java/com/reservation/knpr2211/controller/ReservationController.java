package com.reservation.knpr2211.controller;


import java.util.ArrayList;

import java.text.ParseException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.dto.ReservationDTO;
import com.reservation.knpr2211.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	ReservationService rs;
	@Autowired
	HttpSession session;

	// 예약(예외처리)
	@RequestMapping(value = "reservation")
	public String reservation() {
		return "reservation/campsite";
	}
	// (시작)작성자: 김수정 =======================================================
	// 생태탐방원 예약
	@GetMapping(value = "ecoReservation")
	public String GetEcoReservation(String category, Model model) {
		if (category == null) {
			category = "C08";
		}
		// 제목 category1(대분류), category2(중분류) 코드 해석
		String[] result = rs.transtitleCode(category);
		model.addAttribute("category1", result[0]);
		model.addAttribute("category2", result[1]);
		// 룸타입 가져오기
		List<PlaceDTO> roomTypeList = rs.selectEcoRoomType(category);
		model.addAttribute("roomTypeList", roomTypeList);
		return "reservation/ecoReservation";
	}
	@ResponseBody
	@PostMapping(value = "ecoReservation", produces = "application/json; charset=UTF-8")
	public String PostEcoReservation(@RequestBody(required = false) String code) throws Exception {
		String result = rs.selectCategory3(code).getPriceDay();
		return result;
	}
	@RequestMapping(value = "ecoProc")
	public String ecoProc(ReservationDTO resDto, String startDt, String endDt,RedirectAttributes ra) throws Exception {
		String sessionId = (String)session.getAttribute("id");
		if (sessionId == null || sessionId.isEmpty()) {
			ra.addFlashAttribute("msg","잘못된 접근입니다. 로그인 후 이용해주세요.");
			return "login/login";
		}
		int num = 0; // 방 가능 갯수
		num = rs.roomNumCategory3(resDto, startDt, endDt);
		if(num == 0) {
			ra.addFlashAttribute("msg", "선택한 날짜에 예약 가능한 방이 없습니다. 다시 선택해주세요.");
			return "redirect:/index";
		}else {
			rs.reservation(resDto, startDt, endDt);
			return "redirect:/ecoReservation";
		}
	}

	// 민박촌 예약
	@GetMapping(value = "cottageReservation")
	public String getCottageReservation(String category, Model model) throws ParseException {
		// rs.test();
		if (category == null) {
			category = "D01";
		}
		System.out.println(category);
		// category2(중분류) 코드해석
		String[] result = rs.transtitleCode(category);
		model.addAttribute("category1", result[0]);
		model.addAttribute("category2", result[1]);
		// 룸타입 가져오기
		List<PlaceDTO> roomTypeList = rs.selectCotRoomType(category);
		model.addAttribute("roomTypeList", roomTypeList);
		return "reservation/cottageReservation";
	}
	@ResponseBody
	@PostMapping(value = "cottageReservation", produces = "application/json; charset=UTF-8")
	public HashMap<String, String> postCottageReservation(@RequestBody(required = false) HashMap<String, String> keyData)
			throws Exception {
		int minInt = rs.roomRestCategory3(keyData.get("category3"), keyData.get("diff"),keyData.get("startDate"),keyData.get("endDate"));
		String minStr = Integer.toString(minInt);
		
		String code = keyData.get("category3");
		PlaceDTO result = rs.selectCategory3(code);
		String nameCat3 = rs.transRoomType(result.getNameCategory3());
		
		keyData.put("allowRoomCount", minStr);
		keyData.put("category3", code);
		keyData.put("nameCategory3", nameCat3);
		keyData.put("price", result.getPriceDay());
		System.out.println(keyData);
		return keyData;
	}
	

	@ResponseBody
	@PostMapping(value = "cottageReservation2", produces = "application/json; charset=UTF-8")
	public HashMap<String, String> postCottageReservation2(@RequestBody(required = false) HashMap<String, String> keyData) throws Exception {
		String code = keyData.get("category3");
		String result = rs.selectCategory3(code).getPriceDay();
		//System.out.println(keyData.get("nameCategory3"));
		
		keyData.put("nameCategory3", keyData.get("nameCategory3"));
		keyData.put("addPeople", keyData.get("addPeople"));
		keyData.put("diff", keyData.get("diff"));
		keyData.put("price", result);
		return keyData;
	}
	@RequestMapping(value = "cottageProc")
	public String cottageProc(ReservationDTO resDto, String startDt, String endDt, RedirectAttributes ra) throws Exception {
		String sessionId = (String)session.getAttribute("id");
		if (sessionId == null || sessionId.isEmpty()) {
			ra.addFlashAttribute("msg","잘못된 접근입니다. 로그인 후 이용해주세요.");
			return "login/login";
		}
		int num = 0; // 방 가능 갯수
		num = rs.roomNumCategory3(resDto, startDt, endDt);
		if(num == 0) {
			ra.addFlashAttribute("msg", "선택한 날짜에 예약 가능한 방이 없습니다. 다시 선택해주세요.");
			return "redirect:/index";
		}else {
			rs.reservation(resDto, startDt, endDt);
			return "redirect:/cottageReservation";
		}
	}
	// (끝)작성자: 김수정 =======================================================
	
	

	// (시작)작성자: 최현하 (A-야영장)==============================================

	// 야영장 예약페이지 열림
	@RequestMapping("campsite")
	public String campsite() {
		return "reservation/campsite";
	}


	//야영장 산이름-지역명 클릭하면 테이블뷰 출력

	@ResponseBody
	@PostMapping(value="campsiteView")
	public Map<String, Object> campsiteView(@RequestParam Map<String, String> map) throws Exception {

		Map<String, Object> result = new HashMap<>();
		String code = map.get("code");

		
		List<PlaceDTO> list = rs.campsiteView(code);
		List<String> checkList = rs.checkBoxList(code);



		result.put("list", list);
		result.put("checkList", checkList);
		return result;
	}

	//야영장 산이름-지역명-야영장명으로 클릭하면 방 출력

	@ResponseBody
	@PostMapping(value = "roomView")
	public Map<String, Object> roomView(@RequestParam Map<String, String> map) throws Exception {

		String code = map.get("code");

		List<PlaceDTO> rooms = rs.roomView(code);

		Map<String, Object> result = new HashMap<>();
		result.put("rooms", rooms);

		return result;
	}

	
	
	//야영장 산이름-지역명-야영장명-방번호 배열로 현재 예약 현황 조회
	@ResponseBody
	@PostMapping(value = "reservationState")    
    public Map<String, Object> reservationState(@RequestParam String[] rooms) {
		Map<String, Object> map = rs.reservationState(rooms);
		
		@SuppressWarnings("unchecked")
		List<String> reservations = (List<String>) map.get("reservations");
		@SuppressWarnings("unchecked")
		List<String> roomList =  (List<String>) map.get("roomList");
		@SuppressWarnings("unchecked")
		List<String> dateList = (List<String>) map.get("dateList");
		//데이터 전송, 응답에 문제없음을 확인
		
		String roomMax = rs.campsiteCount(rooms[0]);
		
		Map<String, Object> result = new HashMap<>();
		result.put("reservations", reservations);
		result.put("roomList", roomList);
		result.put("dateList", dateList);
		result.put("roomMax", roomMax);
		
        
        return result;
    }
	
	
	//야영장 1박2일 가능한지 조회
	@ResponseBody
	@PostMapping(value = "oneNightCheck" )	
	public Map<String, Object> oneNightCheck(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> result = new HashMap<>();
		
		String room = (String)map.get("room"); 
	    String date = (String)map.get("date");
 
	    Map<String, String>dateList = rs.oneNightCheck(room, date);
	        
		result.put("dateList", dateList);
		return result;
	}
	
	
	//야영장 선택시, 예약이 가능할 경우, 선택한 장소 정보 출력
	@ResponseBody
	@PostMapping(value = "inputSelectInfo" )	
	public Map<String, Object> inputSelectInfo(@RequestParam String room) {
		
		Map<String, Object> result = new HashMap<>();
		
		Map<String, String> infoMap = rs.inputSelectInfo(room);
		
		result.put("infoMap", infoMap);
		return result;
		
	}
	
	
	//사용자 입력받은 예약 일정 service로 전달
	@ResponseBody
	@PostMapping(value = "reservationSave" )	
	public String reservationSave(@RequestParam Map<String, Object> map) {
 
	    String result = rs.reservationSave(map);
	        
		return result;
	}
	


	
	
	// (끝)작성자: 최현하 (A-야영장)==============================================
	
	
	
	// (시작)작성자: 최현하 (B-대피소)==============================================

	// 대피소 예약페이지 열림
	@RequestMapping("shelter")
	public String shelter() {
		return "reservation/shelter";
	}

	
	//대피소 산이름 클릭하면 테이블뷰 출력
	@ResponseBody
	@PostMapping(value = "shelterView")
	public Map<String, Object> shelterView(@RequestParam Map<String, String> map) throws Exception {
		
		Map<String, Object> result = new HashMap<>();
		String code1 = map.get("code1");
		String code2 = map.get("code2");
		
		Map<String, Object> datas = rs.shelterView(code1, code2);
		
		@SuppressWarnings("unchecked")
		List<PlaceDTO> list1 = (List<PlaceDTO>) datas.get("list1");
		@SuppressWarnings("unchecked")
		List<PlaceDTO> list2 = (List<PlaceDTO>) datas.get("list2");
		@SuppressWarnings("unchecked")
		List<PlaceDTO> list3 = (List<PlaceDTO>) datas.get("list3");
		//데이터 전송에 문제없음 확인

		result.put("list1", list1);
		result.put("list2", list2);
		result.put("list3", list3);
		
		return result;
	}
	
	

	// 대피소명으로 현재 예약 현황 조회
	@ResponseBody
	@PostMapping(value = "STreservationState")    
    public Map<String, Object> STreservationState(@RequestParam String[] rooms) {
		Map<String, Object> map = rs.STreservationState(rooms);
		
		@SuppressWarnings("unchecked")
		List<String> reservations = (List<String>) map.get("reservations");
		@SuppressWarnings("unchecked")
		List<String> roomList =  (List<String>) map.get("roomList");
		@SuppressWarnings("unchecked")
		List<String> dateList = (List<String>) map.get("dateList");
		//데이터 전송, 응답에 문제없음을 확인

		
		Map<String, Object> result = new HashMap<>();
		result.put("reservations", reservations);
		result.put("roomList", roomList);
		result.put("dateList", dateList);
		
        return result;
    }
	
	
	//대피소 1박2일 가능한지 조회
	@ResponseBody
	@PostMapping(value = "SToneNightCheck" )	
	public Map<String, Object> SToneNightCheck(@RequestParam Map<String, Object> map) {
		
		Map<String, Object> result = new HashMap<>();
		
		String room = (String)map.get("room"); 
	    String date = (String)map.get("date");
 
	    Map<String, String>dateList = rs.SToneNightCheck(room, date);
	        
		result.put("dateList", dateList);
		return result;
	}
	
	
	//대피소 선택시, 예약이 가능할 경우, 선택한 장소 정보 출력
	@ResponseBody
	@PostMapping(value = "STinputSelectInfo" )	
	public Map<String, Object> STinputSelectInfo(@RequestParam String room) {
		
		Map<String, Object> result = new HashMap<>();
		
		Map<String, String> infoMap = rs.STinputSelectInfo(room);
		
		result.put("infoMap", infoMap);
		return result;
		
	}
	
	
	//사용자 입력받은 예약 일정 service로 전달
	@ResponseBody
	@PostMapping(value = "STreservationSave" )	
	public String STreservationSave(@RequestParam Map<String, Object> map) {
 
	    String result = rs.STreservationSave(map);
	        
		return result;
	}
	


	
	
	// (끝)작성자: 최현하 (A-대피소)==============================================
	
	

}
