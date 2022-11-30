package com.reservation.knpr2211.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.entity.Program;


@Repository
public interface ProgramRepository extends JpaRepository<Program, Long>{

	List<Program> findByPlace(String parkId);

	List<Program> findByPlaceAndType(String parkId, String type);
	Long countByPlaceAndType(String parkId, String type);
		
	
}
