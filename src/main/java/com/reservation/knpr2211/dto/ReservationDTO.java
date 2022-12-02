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

	private String category1;

	private String category2;

	private String category3;

	private String category4;

	private String room;

	private Timestamp startDay;

	private Timestamp endDay;

	private Integer people; // 예약정원

	private String allDay; // 예약일수

	private String price;

	private Boolean checked;
	
	public ReservationDTO() {
		
	}
	
	@Builder
	public ReservationDTO(Reservation res) throws Exception{
		this.seq = res.getSeq();
		this.category1 = res.getCategory1().toString();
		this.category2 = res.getCategory2();
		this.category3 = res.getCategory3();
		this.category4 = res.getCategory4() != null ? res.getCategory4():"";
		this.room = res.getRoom();
		this.startDay = res.getStartDay();
		this.endDay = res.getEndDay();
		this.people = res.getPeople();
		this.allDay = res.getAllDay();
		this.price = res.getPrice();
		this.checked = res.getChecked();
	}
}
