
package com.reservation.knpr2211.dto;

import com.reservation.knpr2211.entity.Place;

import lombok.ToString;

@ToString
public class PlaceDTO {
	public int seq;

	public String category1;

	public String category2;

	public String category3;

	public String category4;

	public String room;

	public int roomMax;

	public String address;

	public String mobile;

	public String time;

	public String priceWeekend;

	public String priceDay;

	public int peopleMax;

	public String max;

	public String memo;

	public String x;

	public String y;

	public PlaceDTO(Place place) throws Exception {
		this.seq = place.getSeq();
		this.category1 = place.getCategory1().toString();
		this.category2 = place.getCategory2();
		this.category3 = place.getCategory3();
		this.category4 = place.getCategory4() != null ? place.getCategory4() : "";
		this.room = place.getRoom();
		this.roomMax = place.getRoomMax();
		this.address = place.getAddress();
		this.mobile = place.getMobile();
		this.time = place.getTime();
		this.priceWeekend = place.getPriceWeekend() != null ? place.getPriceWeekend() : "";
		this.priceDay = place.getPriceDay();
		this.peopleMax = place.getPeopleMax();
		this.memo = place.getMemo();
		this.x = place.getX();
		this.y = place.getY();
	}

}
