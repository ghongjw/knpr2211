package com.reservation.knpr2211.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.entity.Reservation;
@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
	//작성자: 김수정
	List<Reservation> findAllByStartDayBetweenAndCategory4(Timestamp startDt, Timestamp endDt, String category4 );
	List<Reservation> findAllByStartDayBetweenAndCategory3(Timestamp betweenStart, Timestamp betweenEnd, String parkId);
}
