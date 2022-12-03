package com.reservation.knpr2211.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

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
	private Integer seq;
	
	private String category1;
	
	private String category2;
	
	private String category3;

	private String category4;
	
	private String room;
	
	@Column(name="room_Max")
	private int roomMax;
		
	private String address;
	
	private String mobile;
	
	private String time;
	
	@Column(name="price_weekend")
	private String priceWeekend;
	
	@Column(name="price_day")
	private String priceDay;
	
	@Column(name="people_max")
	private int peopleMax;
	
	private String memo;
	
	private String x;
	
	private String y;
	
	public Place(){
		
	}
	
}
