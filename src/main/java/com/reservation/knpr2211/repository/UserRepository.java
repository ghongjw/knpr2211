package com.reservation.knpr2211.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	
	User findByid(String id);

	Page<User> findByDeletedAndMember(Boolean deleted,String member, PageRequest pageRequest);
	// Page<User> findAll(PageRequest pageRequest);

	Page<User> findByDeletedAndIdContaining(Boolean deleted,String id, PageRequest pageRequest);

	Page<User> findByDeletedAndNameContaining(Boolean deleted,String name, PageRequest pageRequest);

	Page<User> findByDeletedAndEmailContaining(Boolean deleted,String email, PageRequest pageRequest);

	Page<User> findByDeletedAndMobileContaining(Boolean deleted,String mobile, PageRequest pageRequest);

	Page<User> findByDeletedAndMemberAndIdContaining(Boolean deleted,String member, String id, PageRequest pageRequest);

	Page<User> findByDeletedAndMemberAndNameContaining(Boolean deleted,String member, String name, PageRequest pageRequest);

	Page<User> findByDeletedAndMemberAndEmailContaining(Boolean deleted,String member, String email, PageRequest pageRequest);

	Page<User> findByDeletedAndMemberAndMobileContaining(Boolean deleted,String member, String mobile, PageRequest pageRequest);

	//User getById(String id);

	Page<User> findByDeleted(boolean b, PageRequest pageRequest);

	Page<User> findByMemberAndDeleted(String member, boolean b, PageRequest pageRequest);

	User getByid(String memberId);

}
