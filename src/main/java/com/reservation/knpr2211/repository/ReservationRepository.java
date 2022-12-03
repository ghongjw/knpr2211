package com.reservation.knpr2211.repository;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.reservation.knpr2211.entity.Reservation;
@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
	//작성자: 김수정

	List<Reservation> findAllByStartDayBetweenAndCategory4(Timestamp startDt, Timestamp endDt, String category4 );
	List<Reservation> findAllByStartDayBetweenAndCategory3(Timestamp betweenStart, Timestamp betweenEnd, String parkId);
	List<Reservation> findAllByCategory3(String parkId);
	
	//작성자: 공주원
	Page<Reservation> findByIdAndEndDayIsBefore(String id, Timestamp now, PageRequest pageRequest);
	Page<Reservation> findByIdAndEndDayIsAfter(String id, Timestamp now, PageRequest pageRequest);

	List<Reservation> findById(String id);
	
	Reservation findBySeq(Integer seq);

	Reservation findBySeqAndId(Integer seq, String id);
	@Transactional
	void deleteBySeq(Integer i);
	
	@Query(nativeQuery=true, value = "select * from reservation where id = ?1 and (status = ?2 or status = ?3) and start_day > ?4")
	Page<Reservation> findByStatusAndFuture(String id,String status1, String status2, Timestamp timestamp,  PageRequest pageRequest);
	
	@Query(nativeQuery=true, value = "select * from reservation where id = ?1 and (status = ?2 or status = ?3) and start_day <= ?4")
	Page<Reservation> findByStatusAndPast(String id,String status1, String status2, Timestamp timestamp,  PageRequest pageRequest);

	Page<Reservation> findByid(String id, PageRequest pageRequest);
}
