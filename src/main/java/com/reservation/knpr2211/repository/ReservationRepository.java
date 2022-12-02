package com.reservation.knpr2211.repository;

import java.util.List;
import java.sql.Timestamp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.dto.ReservationDTO;
import com.reservation.knpr2211.entity.Reservation;
@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
	//작성자: 김수정
	
	//List<PlaceDTO> findByCategory3AndStartDay(String category3, Timestamp startDay);
	
	List<ReservationDTO> findByRoomAndStartDayAndAllDay(String room, Timestamp startDay, String allDay);
}
