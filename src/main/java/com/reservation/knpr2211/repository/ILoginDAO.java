package com.reservation.knpr2211.repository;

import org.apache.ibatis.annotations.Mapper;

import com.reservation.knpr2211.dto.LoginDTO;

@Mapper
public interface ILoginDAO {
	LoginDTO loginProc(LoginDTO login);
}