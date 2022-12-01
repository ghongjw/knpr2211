package com.reservation.knpr2211.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.reservation.knpr2211.entity.Board;

public interface BoardRepository extends JpaRepository<Board, Long>{
	//검색
	List<Board> findByTitleContaining(String keyword);

	List<Board> findByCategory1(String category1);

	List<Board> findByCategory1AndTitleContaining(String category1, String keyword);

	List<Board> findByCategory1AndContentContaining(String category1, String keyword);

	//List<Board> findByTitleContaining(String category1, String keyword);

	@Query(nativeQuery=true, value = "select * from board where category1 = :category1 and (title like CONCAT('%',:title,'%') or content like CONCAT('%',:content,'%'))")
	List<Board> findBykeyword(@Param("category1")String category1, @Param("title")String title, @Param("content")String content);

	@Query(nativeQuery=true, value = "select * from board where title like CONCAT('%',:title,'%') or content like CONCAT('%',:content,'%')")
	List<Board> findBykey(@Param("title")String title, @Param("content")String content);

	List<Board> findByContentContaining(String keyword);


}
