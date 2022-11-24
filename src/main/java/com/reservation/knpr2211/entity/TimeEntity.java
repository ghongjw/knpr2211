package com.reservation.knpr2211.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Getter;

@Getter
@MappedSuperclass //테이블 생성방지 자식에게 매핑정보 상속
@EntityListeners(AuditingEntityListener.class) //jpa에게 이 entity는 auditing 기능 알리는 어노테이션
public class TimeEntity {

	@CreatedDate
	@Column(updatable = false)
	private LocalDateTime createDate;
	
	@LastModifiedDate
	private LocalDateTime modifiedDate;
	
	
}
