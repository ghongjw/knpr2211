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
@Table(name="notice")
public class Notice {
	
	@Id
	private int id;
	
	private String title;
	
	private String content;
	
	private String category1;
	
	private int hit;
	
	private String file;
	
	private int notice_yn;
	
	private int delete_yn;
	
	private Date createDate;
	
	private Date modifiedDate;
	
	public Notice() {
		
	}
}
