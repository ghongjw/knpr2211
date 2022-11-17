package com.reservation.knpr2211.Repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.entity.user;


@Repository
public interface UserRepository extends JpaRepository<user, String>{

		user findByid(String id);
		
	
}
