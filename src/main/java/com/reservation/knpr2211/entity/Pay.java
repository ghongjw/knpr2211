package com.reservation.knpr2211.entity;

import java.security.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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
@Table(name="pay")
public class Pay {
	
	@Id
	private Integer seq;
	
	
	private String room;
	private Timestamp payDay;
	private String price;
	private Boolean refund;
	
	@OneToOne
	@JoinColumn(name = "user", referencedColumnName = "id", insertable = true, updatable = true)
	private User pay;
	
	@Builder
	public Pay(String room, Timestamp payDay, String price, Boolean refund,User pay) {
		this.room=room;
		this.payDay=payDay;
		this.price=price;
		this.pay=pay;
				
	}
	
	public Pay() {
		
	}
}
