package com.reservation.knpr2211.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@DynamicInsert
@DynamicUpdate
@Table(name="user")

public class User {

	//아이디 
		@Id
		@Column(nullable = false, insertable = true, updatable = false, unique = true)
		private String id;
		//패스워드 
		@Column(nullable = false, insertable = true, updatable = true)
		private String pw;
		//이름 
		@Column(nullable = false, insertable = true, updatable = true)
		private String name;
		//이메일 
		@Column(nullable = false, insertable = true, updatable = true)
		private String email;
		//연락처
		@Column(nullable = false, insertable = true, updatable = true)
		private String mobile;
		//관리자,회원
		@Column(nullable = false, insertable = true, updatable = true)
		private String member;
		
	
		
		
		@Builder
		public User(String id, String pw, String name, String email, String mobile, String member) {
			
			this.id = id;
			this.pw = pw;
			this.name = name;
			this.email = email;
			this.mobile = mobile;
			this.member = member;
			
			
			
			
		}


		
	public User() {
		
	}
}
