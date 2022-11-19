package com.reservation.knpr2211.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.entity.Favorite;
import com.reservation.knpr2211.entity.User;


@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Long>{
		
	
}
