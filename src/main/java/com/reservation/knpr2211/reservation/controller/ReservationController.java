package com.reservation.knpr2211.reservation.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reservation.knpr2211.place.entity.Place;
import com.reservation.knpr2211.place.service.ecoReservationService;

@Controller
public class ReservationController {
	@Autowired ecoReservationService ecoReservationService;
	// 예약(예외처리)
	@RequestMapping("reservation")
	public String reservation() {
		return "reservation/ecoReservation";
	}
	
	// 생태탐방원 예약
	@RequestMapping("ecoReservation")
	public String ecoReservation(String category, Model model) {
		System.out.println(category);
		if(category == null) {
			category = "C08";
		}
		// 룸타입 가져오기
		List<Place> roomTypeList = ecoReservationService.selectRoomType(category);
		model.addAttribute("roomTypeList", roomTypeList	);
		
		// 전체
		return "reservation/ecoReservation";
	}

	// 생태탐방원 예약
	@RequestMapping("cottageReservation")
	public String cottageReservation() {
		return "reservation/cottageReservation";
	}
}
