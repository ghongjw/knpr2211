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
@Table(name = "favorite")
public class Favorite {
	

	@Id
	@Column(nullable=false, insertable = true, updatable=true)
	private String place;
	
	@Column(nullable=false, insertable = true, updatable=true)
	@ColumnDefault(value = "false")
	private boolean checked;
	
	@OneToOne
	@JoinColumn(name = "user", referencedColumnName = "id", insertable = true, updatable = true)
	private User favorite;
	
	@Builder
	public Favorite (String place, boolean checked, User favorite) {
		this.place = place;
		this.checked = checked;
		this.favorite = favorite;
				
	}
	public Favorite() {
		
	}
	
	 
}