package com.reservation.knpr2211.entity;

import java.time.LocalDateTime;

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
	private long id;
	
	private String title;
	
	private String content;
	
	private String category1;
	
	private int hit;
	
	private String file;
	
	private char notice_yn;
	
	private char delete_yn;
	
	private LocalDateTime createDate = LocalDateTime.now();
	
	private LocalDateTime modifiedDate;
	
	public Notice(String title, String content, String category1, int hit, String file, char notice_yn, char delete_yn) {
		this.title = title;
		this.content = content;
		this.category1 = category1;
		this.hit = hit;
		this.file = file;
		this.notice_yn = notice_yn;
		this.delete_yn = delete_yn;
	}
}
