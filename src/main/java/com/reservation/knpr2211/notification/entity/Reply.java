package com.reservation.knpr2211.notification.entity;

import java.util.Date;

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
@Table(name="reply")
public class Reply {
	
	@Id
	private int rno;
	
	private int bno;
	
	private String content;
	
	private Date createDate;
	
	public Reply() {
		
	}
}