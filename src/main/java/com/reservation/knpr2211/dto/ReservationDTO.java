package com.reservation.knpr2211.dto;

import java.sql.Timestamp;

import javax.persistence.Id;

import com.reservation.knpr2211.entity.Reservation;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationDTO {

	@Id
	private Integer seq;
	
	private String id;
	
	private String category1;
	private String nameCategory1;
	
	private String category2;
	private String nameCategory2;
	
	private String category3;
	private String nameCategory3;

	private String category4;
	private String nameCategory4;

	private String room;
	
	private String orderTime;
	
	private Timestamp startDay;

	private Timestamp endDay;
	
	private String period; //사용기간

	private Integer people; // 예약정원

	private String allDay; // 예약일수

	private String price;

	private String checked;
	
	private Boolean isDone;
	
	private String status;
	public ReservationDTO() {
		
	}


	

}