package com.reservation.knpr2211.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.entity.Place;
import com.reservation.knpr2211.service.MountainCodeService;
import com.reservation.knpr2211.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired
	ReservationService rs;
	
	// 예약(예외처리)
	@RequestMapping( value = "reservation")
	public String reservation() {
		return "reservation/campsite";
	}

	// 생태탐방원 예약
	@GetMapping(value = "ecoReservation")
	public String GetEcoReservation(String category, Model model) {
		System.out.println(category);
		if (category == null) {
			category = "C08";
		}
		// 룸타입 가져오기
		List<PlaceDTO> roomTypeList = rs.selectRoomType(category);
		model.addAttribute("roomTypeList", roomTypeList);
		return "reservation/ecoReservation";
	}
	@ResponseBody
	@PostMapping(value="ecoReservation", produces="application/json; charset=UTF-8")
	public String PostEcoReservation(@RequestBody(required = false) String code){
		System.out.println("podst로 넘어온 code : "+code);
		//System.out.println("금액 : "+rs.selectPlace(code));
		return rs.selectPlace(code);
	}
	
	// 민박원 예약
	@RequestMapping(value = "cottageReservation")
	public String cottageReservation() {
		return "reservation/cottageReservation";
	}

	// 야영장 예약페이지 열림
	@RequestMapping("reservation/campsite")
	public String campsite() {
		System.out.println("확인1");
		return "reservation/campsite";
	}

	// 대피소 예약페이지 열림
	@RequestMapping("reservation/shelter")
	public String shelter() {
		System.out.println("확인2");
		return "reservation/shelter";
	}

	@ResponseBody
	@PostMapping(value = "reservation/selectInfo", produces = "text/html; charset=UTF-8")
	public String selectInfo(@RequestBody(required = false) String reqData) {
		String code = reqData;

		return "forward:campsite";

	}

	@ResponseBody
	@PostMapping(value = "/sendData")
	public Map<String, Object> sendData(@RequestParam Map<String, String> map) throws Exception {

		Map<String, Object> result = new HashMap<>();
		String code = map.get("code");
		System.out.println(code);

		List<PlaceDTO> list = rs.campsiteView(code);
		System.out.println(list.toString());

		result.put("list", list);
		return result;
	}
}
