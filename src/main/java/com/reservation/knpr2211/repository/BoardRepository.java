package com.reservation.knpr2211.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.reservation.knpr2211.entity.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{
	//검색
	List<Board> findByTitleContaining(String keyword);

}
