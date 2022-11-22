package com.reservation.knpr2211.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.entity.Reservation;

@Repository
public interface PayRepository extends JpaRepository<Reservation, Integer>{

}
