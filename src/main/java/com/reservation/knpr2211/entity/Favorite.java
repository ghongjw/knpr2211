package com.reservation.knpr2211.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
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
@Table(name = "favorite")
@SequenceGenerator(
		 name = "Favorite_SEQ_GENERATOR",
		 sequenceName = "Favorite_SEQ", //매핑할 데이터베이스 시퀀스 이름
		 initialValue = 1, allocationSize = 1)
public class Favorite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "Favorite_SEQ_GENERATOR")
	private long id;
	
	@Column(nullable = false, insertable = true, updatable = false, unique = true)
	private String place;
	
	@Column(nullable = false, insertable = true, updatable = true, unique = true)
	private boolean checked;
	
	@OneToOne
	@JoinColumn(name = "user", referencedColumnName = "id", nullable = true, updatable = true)
	private User user;
	 
}
