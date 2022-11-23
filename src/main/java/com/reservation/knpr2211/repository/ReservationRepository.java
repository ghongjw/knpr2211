package com.reservation.knpr2211.repository;

import java.security.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.entity.Place;
@Repository
public interface ReservationRepository extends JpaRepository<Place, Integer> {
	//작성자: 김수정
	List<PlaceDTO> findAllByCategory2(String category2);
	//List<PlaceDTO> findByCategory3AndStartDay(String category3, Timestamp startDay);
}
