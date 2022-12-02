package com.reservation.knpr2211.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.reservation.knpr2211.entity.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{

	//검색
	List<Board> findByTitleContaining(String keyword);


	
	Page<Board> findByCategory1(String category1, PageRequest pageRequest);

	Page<Board> findByCategory1AndTitleContaining(String category1, String keyword, PageRequest pageRequest);

	Page<Board> findByCategory1AndContentContaining(String category1, String keyword, PageRequest pageRequest);

	Page<Board> findByTitleContaining(String keyword, PageRequest pageRequest);
	
	Page<Board> findByContentContaining(String keyword, PageRequest pageRequest);

	@Query(nativeQuery=true, value = "select * from board where category1 = :category1 and (title like CONCAT('%',:title,'%') or content like CONCAT('%',:content,'%'))")
	Page<Board> findBykeyword(@Param("category1")String category1, @Param("title")String title, @Param("content")String content, PageRequest pageRequest);

	@Query(nativeQuery=true, value = "select * from board where title like CONCAT('%',:title,'%') or content like CONCAT('%',:content,'%')")
	Page<Board> findBykey(@Param("title")String title, @Param("content")String content, PageRequest pageRequest);
	//페이징
	//	Board findAll(Sort by, PageRequest pageRequest);
	//List<Board> findAllByOrderByCreatedAtDesc();

	

	

	

	

	

	
}
