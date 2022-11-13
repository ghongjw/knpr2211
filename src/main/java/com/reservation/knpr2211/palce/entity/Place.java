package com.reservation.knpr2211.palce.entity;

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
	private String category1;
	
	private String category2;
	
	private String category3;
	
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
}
