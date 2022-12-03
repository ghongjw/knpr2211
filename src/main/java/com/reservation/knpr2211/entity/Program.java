package com.reservation.knpr2211.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@DynamicInsert
@DynamicUpdate
@SequenceGenerator(
		 name = "PROGRAM_SEQ_GENERATOR",
		 sequenceName = "PROGRAM_SEQ", //매핑할 데이터베이스 시퀀스 이름
		 initialValue = 1, allocationSize = 1)
@Entity
public class Program {

	@Id
	@Column(nullable = false, insertable = true, updatable = false)
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "PROGRAM_SEQ_GENERATOR")
	private long seq;
	
	@Column(name="place")
	private String place;
	
	private String type; //생태관광 프로그램 환경교육 특화프로그램 등.
	
	private String title;
	
	private String duration;//소요시간
	
	private String target;//참가대상
	
	private String people;//참가인원
	
	private String extra;//기타사항
	
	@Builder
	public Program(String type, String title,String place,String duration, String target,String people,
		String extra, String schedule_N, String schedule_R) {
			this.type = type;
			this.title = title;
			this.place = place;
			this.duration = duration;
			this.target = target;
			this.people = people;
			this.extra = extra;
		
	}
	public Program() {}
}
