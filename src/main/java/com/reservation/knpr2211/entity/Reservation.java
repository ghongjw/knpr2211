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
		private Integer seq;
		
		private String category1;

		private String category2;
		
		private String category3;

		private String category4;
		
		private String room;
		
		private Timestamp orderTime;
		
		private Timestamp startDay;
		
		private Timestamp endDay;
		
		private Integer people; // 예약정원
		
		private String allDay; // 예약일수
		
		private String price;
		
		@Column(nullable=false, insertable = true, updatable=true)
		@ColumnDefault(value = "false")
		private Boolean checked;
		
		@OneToOne
		@JoinColumn(name = "user", referencedColumnName = "id", insertable = true, updatable = true)
		private User reservation;
		
		public Reservation() {
			
		}
		
//		@Builder
//		public Reservation(Reservation res) throws Exception{
//			this.seq = res.getSeq();
//			this.category1 = res.getCategory1().toString();
//			this.category2 = res.getCategory2();
//			this.category3 = res.getCategory3();
//			this.category4 = res.getCategory4() != null ? res.getCategory4():"";
//			this.room = res.getRoom();
//			this.startDay = res.getStartDay();
//			this.endDay = res.getEndDay();
//			this.people = res.getPeople();
//			this.allDay = res.getAllDay();
//			this.price = res.getPrice();
//			this.check = res.getCheck();
//		}
}
