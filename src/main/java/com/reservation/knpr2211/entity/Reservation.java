package com.reservation.knpr2211.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import javax.persistence.Id;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
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
		 name = "RESERVATION_SEQ_GENERATOR",
		 sequenceName = "RESERVATION_SEQ", //매핑할 데이터베이스 시퀀스 이름
		 initialValue = 1, allocationSize = 1)
@Entity
@Table(name="reservation")
public class Reservation {
	
		@Id

		@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "RESERVATION_SEQ_GENERATOR")
		@Column(nullable = false, insertable = true, updatable = false, unique = true)
		private Integer seq;
		//예약한 계정(아이디)
		@Column(nullable=false, insertable = true, updatable = false)
		private String id;
		//대분류 EX) A,B,C,D
		@Column(nullable = false, insertable = true, updatable = false)
		private String category1;
		//중분류 EX) A01, A02
		@Column(nullable = false, insertable = true, updatable = false)
		private String category2;
		//소분류 EX) A0103, A0201
		@Column(nullable = false, insertable = true, updatable = false)
		private String category3;
		//소소분류 EX) A010301, A020102
		@Column(nullable = true, insertable = true, updatable = false)
		private String category4;
		//방 타입(객실)
		@Column(nullable = true, insertable = true, updatable = false)
		private String room;
		//예약한(요청) 날짜
		@Column(name="order_Time", nullable = false, insertable = true, updatable = false)
		private Timestamp orderTime;
		//입실일
		@Column(name="start_day", nullable = false, insertable = true, updatable = false)
		private Timestamp startDay;
		//퇴실일
		@Column(name="end_day", nullable = false, insertable = true, updatable = false)
		private Timestamp endDay;
		//예약인원
		@Column(nullable = false, insertable = true, updatable = false)
		private Integer people;
		//예약일수
		@Column(nullable = false, insertable = true, updatable = false)
		private String allDay; 
		//결재금액
		@Column(nullable = false, insertable = true, updatable = false)
		private String price;
		//결제시 생기는 고유번호
		@Column(nullable = true, insertable = true, updatable = true)
		private String paidNum;
		//결제시 생기는 주번호
		@Column(nullable = true, insertable = true, updatable = true)
		private String merchant_uid;
		//예약확정(결재) 유무
		@Column(insertable = true, updatable=true)
		@Column(nullable=false, insertable = true, updatable=true)
		@ColumnDefault(value = "0")
		private Boolean checked;
		//환불유뮤
		@Column(nullable=true, insertable = true, updatable=true)
		
		private String status = "reserve";
		

    public Reservation() {
			
		}


    
//		@Builder
//		public Reservation(Reservation res) throws Exception{
//			this.seq = res.getSeq();
//			this.id = res.getId();
//			this.category1 = res.getCategory1().toString();
//			this.category2 = res.getCategory2();
//			this.category3 = res.getCategory3();
//			this.category4 = res.getCategory4() != null ? res.getCategory4():"";
//			this.room = res.getRoom();
//			this.orderTime = res.getOrderTime();
//			this.startDay = res.getStartDay();
//			this.endDay = res.getEndDay();
//			this.people = res.getPeople();
//			this.allDay = res.getAllDay();
//			this.price = res.getPrice();
//			this.checked = res.getChecked() != null ? res.getChecked():false;
//		}
	@Builder
	public Reservation(Reservation res) throws Exception{
	this.id = res.getId();
	this.seq = res.getSeq();
	this.category1 = res.getCategory1().toString();
	this.category2 = res.getCategory2();
	this.category3 = res.getCategory3();
	this.category4 = res.getCategory4() != null ? res.getCategory4():" ";
	this.room = res.getRoom() != null ? res.getRoom():" ";
	this.orderTime = res.getOrderTime();
	this.startDay = res.getStartDay();
	this.endDay = res.getEndDay();
	this.people = res.getPeople();
	this.allDay = res.getAllDay();
	this.price = res.getPrice();
	this.checked = res.getChecked() == null ? false:true;
  }

	
//		public Reservation toEntity() {
//			Reservation rebuild = Reservation.builder()
//					.seq(seq)
//					.id(id)
//					.category1(category1)
//					.category2(category2)
//					.category3(category3)
//					.category4(category4)
//					.room(room)
//					.orderTime(orderTime)
//					.startDay(startDay)
//					.endDay(endDay)
//					.people(people)
//					.allDay(allDay)
//					.price(price);
//					.checked(checked);
//			return rebuild;
//		}
}
