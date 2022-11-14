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
@Table(name="board")
public class Board {
	
	@Id
	private int bno;
	
	private String category1;
	
	private String type;
	
	private String title;
	
	private String content;
	
	private String writer;
	
	private Date createDate;
	
	private Boolean lock_yn;
	
	private String state;
	
	public Board() {
		
	}
}
