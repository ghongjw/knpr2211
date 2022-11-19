package com.reservation.knpr2211.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.entity.Program;


@Repository
public interface ProgramRepository extends JpaRepository<Program, Long>{
		
	
}
