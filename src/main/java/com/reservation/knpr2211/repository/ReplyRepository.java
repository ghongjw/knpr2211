package com.reservation.knpr2211.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.reservation.knpr2211.entity.Board;
import com.reservation.knpr2211.entity.Reply;

public interface ReplyRepository extends JpaRepository<Reply, Long> {
	List<Reply> findByBoard(Board board);
};
	

