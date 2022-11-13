package com.reservation.knpr2211.place.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.palce.entity.Place;

@Repository
public interface PlaceRepository extends JpaRepository<Place,String>{
	List<Place> findAll();
	
	Place findByCategory3(String category3);
	
}