package com.reservation.knpr2211.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.entity.Notice;

@Repository
public interface ReplyRepository extends JpaRepository<Notice,String>{
	List<Notice> findAll();
}


