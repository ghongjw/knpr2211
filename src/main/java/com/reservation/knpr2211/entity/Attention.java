package com.reservation.knpr2211.entity;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@SequenceGenerator(
		 name = "ATTENTION_SEQ_GENERATOR",
		 sequenceName = "ATTENTION_SEQ", //매핑할 데이터베이스 시퀀스 이름
		 initialValue = 1, allocationSize = 1)
@DynamicInsert
@DynamicUpdate
@Entity
@Table(name="attention")
public class Attention {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "ATTENTION_SEQ_GENERATOR")
	@Column(nullable = false, insertable = true, updatable = true)
	private long seq;
	
	private String title;
	
	private String content;
	
	private String category2;
	
	private int hit = 0;
	
	private String file;
	
	private boolean notice;
	
	private boolean deleted;
	
	private Timestamp createDate;
	
	private Timestamp modifiedDate;
	
	public Attention() {
		
	}
	
	@Builder
	public Attention(long seq,String title,String content,String category2,int hit, String file, boolean notice, 
			boolean deleted, Timestamp createDate,Timestamp modifiedDate) {
		this.seq=seq;
		this.title=title;
		this.content=content;
		this.category2=category2;
		this.hit=hit;
		this.file=file;
		this.notice=notice;
		this.deleted=deleted;
		this.createDate=createDate;
		this.modifiedDate=modifiedDate;
				
	}

}
