package com.reservation.knpr2211.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.reservation.knpr2211.entity.Reservation;
@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
	//작성자: 김수정
	List<Reservation> findAllByCategory3(String parkId);
	
	//작성자: 공주원
	Page<Reservation> findByIdAndEndDayIsBefore(String id, Timestamp now, PageRequest pageRequest);
	Page<Reservation> findByIdAndEndDayIsAfter(String id, Timestamp now, PageRequest pageRequest);

	List<Reservation> findById(String id);
	
	Reservation findBySeq(Integer seq);

	Reservation findBySeqAndId(Integer seq, String id);
	@Transactional
	void deleteBySeq(Integer i);
}
