package com.reservation.knpr2211.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReservationController {

	// 예약(예외처리)
	@RequestMapping("reservation")
	public String reservation() {
		return "reservation/ecoReservation";
	}

	// 생태탐방원 예약
	@RequestMapping("ecoReservation")
	public String ecoReservation(String category) {
		System.out.println(category);
		return "reservation/ecoReservation";
	}

	// 생태탐방원 예약
	@RequestMapping("cottageReservation")
	public String cottageReservation() {
		return "reservation/cottageReservation";
	}
}
