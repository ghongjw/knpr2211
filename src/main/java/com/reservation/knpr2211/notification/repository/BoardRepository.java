package com.reservation.knpr2211.notification.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.notification.entity.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer>{
	List<Board> findAll();


}


