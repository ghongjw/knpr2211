package com.reservation.knpr2211.place.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;  

@Getter
@Setter
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name="place")
public class Place {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int seq;
	
	private String category1;
	
	private String category2;
	
	private String category3;

	private String category4;
		
	private String address;
	
	private String mobile;
	
	private String time;
	
	@Column(name="price_weekend")
	private String priceWeekend;
	
	@Column(name="price_day")
	private String priceDay;
	
	private String max;
	
	private String memo;
	
	private String x;
	
	private String y;
	
	public Place(){
		
	}
	
	@Builder
	public Place(Place place) throws Exception{
		this.seq=place.getSeq();
		this.category1 = place.getCategory1().toString();
		this.category2 = place.getCategory2();
		this.category3 = place.getCategory3() != null ? place.getCategory3():"";
		this.category4 = place.getCategory4() != null ? place.getCategory4():"";
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
