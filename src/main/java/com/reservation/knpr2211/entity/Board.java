package com.reservation.knpr2211.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name="board")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Board extends TimeEntity{

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(nullable = false, unique=true)
	private Long bno;
	
	@Column(nullable = false)
	private String category1;
	
	@Column(nullable = false)
	private String type;
	
	@Column(nullable = false)
	private String title;
	
	@Column(nullable = false, columnDefinition ="TEXT")
	private String content;
	
	@Column(nullable = false)
	private String writer;
	
	@Column(nullable = false)
	private String lock_yn;
	
	@Column(nullable = false)
	private boolean state;
	
	@OneToMany(mappedBy = "board")
	private List<Reply> reply;

	@Builder
	public Board(Long bno, String category1, String type, String title, String content, String writer,
			LocalDateTime createDate, String lock_yn, boolean state) {
		this.bno = bno;
		this.category1 = category1;
		this.type = type;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.lock_yn = lock_yn;
		this.state = state;
	}


	
}
