package com.reservation.knpr2211.dto;

import javax.persistence.Id;

import com.reservation.knpr2211.entity.Place;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PlaceDTO {
	@Id
	private Integer seq;
	
	private String category1;
	private String nameCategory1;
	
	private String category2;
	private String nameCategory2;
	
	private String category3;
	private String nameCategory3;

	private String category4;
	private String nameCategory4;
	
	private String room;
	
	private int roomMax;
		
	private String address;
	
	private String mobile;
	
	private String time;
	
	private String priceWeekend;
	
	private String priceDay;
	
	private int peopleMax;
	
	private String memo;
	
	private String x;
	
	private String y;
	
	@Builder
	public PlaceDTO(Place place) throws Exception{
		this.seq=place.getSeq();
		this.category1 = place.getCategory1().toString();
		this.category2 = place.getCategory2();
		this.category3 = place.getCategory3();
		this.category4 = place.getCategory4() != null ? place.getCategory4():"";
		this.room=place.getRoom() != null ? place.getRoom():"";
		this.roomMax=place.getRoomMax();
		this.address = place.getAddress();
		this.mobile = place.getMobile();
		this.time = place.getTime();
		this.priceWeekend = place.getPriceWeekend()!= null ? place.getPriceWeekend():"";
		this.priceDay = place.getPriceDay();
		this.peopleMax = place.getPeopleMax();
		this.memo = place.getMemo();
		this.x =place.getX();
		this.y=place.getY();
	}

	public PlaceDTO() {
		// TODO Auto-generated constructor stub
	}
	
}
