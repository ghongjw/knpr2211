package com.reservation.knpr2211.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.reservation.knpr2211.entity.Attention;

public interface AttentionRepository extends JpaRepository<Attention, Long>{

	Attention findBySeq(Long seq);
	
	Page<Attention> findByCategory2(String category2, PageRequest pageRequest);

	@Query(nativeQuery=true, value = "select * from Attention where (title like CONCAT('%',:title,'%') or content like CONCAT('%',:content,'%'))")
	Page<Attention> findByContentOrTitle(@Param("title")String title, @Param("content")String content, PageRequest pageRequest);

	Page<Attention> findByTitleContaining(String title, PageRequest pageRequest);

	Page<Attention> findByContentContaining(String content, PageRequest pageRequest);

	@Query(nativeQuery=true, value = "select * from Attention where category2 = :category2 and (title like CONCAT('%',:content,'%') or content like CONCAT('%',:title,'%'))")
	Page<Attention> findByCategory2AndContentOrTitle(@Param("category2")String category2, @Param("content")String content, @Param("title")String title, PageRequest pageRequest);

	Page<Attention> findByCategory2AndTitleContaining(String category2, String title, PageRequest pageRequest);


	Page<Attention> findByCategory2AndContentContaining(String category2, String search, PageRequest pageRequest);


	
}
