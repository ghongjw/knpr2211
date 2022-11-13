package com.reservation.knpr2211.place.DTO;

import com.reservation.knpr2211.palce.entity.Place;

public class PlaceDTO {
	public String category1;
	
	public String category2;
	
	public String category3;
	
	public String address;
	
	public String mobile;
	
	public String time;
	
	public String priceWeekend;
	
	public String priceDay;
	
	public String max;
	
	public String memo;
	
	public String x;
	
	public String y;
	
	
	public PlaceDTO(Place place) throws Exception{
		this.category1 = place.getCategory1().toString();
		this.category2 = place.getCategory2();
		this.category3 = place.getCategory3() != null ? place.getCategory3():"";
		this.address = place.getAddress();
		this.mobile = place.getMobile();
		this.time = place.getTime();
		this.priceWeekend = place.getPriceWeekend()!= null ? place.getPriceWeekend():"";
		this.priceDay = place.getPriceDay();
		this.max = place.getMax();
		this.memo = place.getMemo();
		this.x =place.getX();
		this.y=place.getY();
	}
	
	
}
