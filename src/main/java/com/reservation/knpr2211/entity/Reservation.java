package com.reservation.knpr2211.entity;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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
@Entity
@Table(name="reservation")
public class Reservation {
	
		@Id
		@Column(nullable = false, insertable = true, updatable = false, unique = true)
		private Integer seq;
		//예약한 계정(아이디)
		@Column(nullable=false, insertable = true, updatable = true)
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
		@Column(nullable = false, insertable = true, updatable = false)
		private String category4;
		//방 타입(객실)
		@Column(nullable = false, insertable = true, updatable = false)
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
		//예약확정(결재) 유무
		@Column(nullable=false, insertable = true, updatable=true)
		@ColumnDefault(value = "false")
		private Boolean checked;
		
		@Builder
		public Reservation(Reservation res) throws Exception{
			this.id = res.getId();
			this.seq = res.getSeq();
			this.category1 = res.getCategory1().toString();
			this.category2 = res.getCategory2();
			this.category3 = res.getCategory3();
			this.category4 = res.getCategory4() != null ? res.getCategory4():"";
			this.room = res.getRoom();
			this.orderTime = res.getOrderTime();
			this.startDay = res.getStartDay();
			this.endDay = res.getEndDay();
			this.people = res.getPeople();
			this.allDay = res.getAllDay();
			this.price = res.getPrice();
			this.checked = res.getChecked() != null ? res.getChecked():false;
		}
}
