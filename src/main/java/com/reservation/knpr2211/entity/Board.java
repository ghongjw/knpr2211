package com.reservation.knpr2211.entity;

import java.time.LocalDateTime;

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
import lombok.ToString;

@ToString
@Getter
@Setter
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name = "board")
public class Board {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(nullable = false, unique = true)
	private Integer bno;
	
	@Column(nullable = false, unique = true)
	private String category1;
	
	@Column(nullable = false, unique = true)
	private String type;
	
	@Column(nullable = false, unique = true)
	private String title;
	
	@Column(nullable = false, unique = true)
	private String content;
	
	@Column(nullable = false, unique = true)
	private String writer;
	
	@Column(nullable = false, unique = true)
	private LocalDateTime createDate;
	
	@Column(nullable = false, unique = true)
	private String lock_yn;
	
	@Column(nullable = false, unique = true)
	private String state;

	@Builder
	public Board(Integer bno, String category1, String type, String title, String content, String writer,
			LocalDateTime createDate, String lock_yn, String state) {
		this.bno = bno;
		this.category1 = category1;
		this.type = type;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.createDate = createDate;
		this.lock_yn = lock_yn;
		this.state = state;
	}

	public Board() {

	}
}
