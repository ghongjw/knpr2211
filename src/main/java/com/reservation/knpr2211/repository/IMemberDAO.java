package com.reservation.knpr2211.repository;
import org.apache.ibatis.annotations.Mapper;

import com.reservation.knpr2211.dto.LoginDTO;

@Mapper
public interface IMemberDAO {

	int isExistId(String id);
	
	void insertLogin(LoginDTO login);

	LoginDTO userPassword(String id);

	int updateLogin(LoginDTO login);

	void deleteLogin(String modifyId);

	int memberCount();

}
