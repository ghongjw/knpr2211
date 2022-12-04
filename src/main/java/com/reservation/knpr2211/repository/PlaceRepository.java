
package com.reservation.knpr2211.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.reservation.knpr2211.dto.PlaceDTO;
import com.reservation.knpr2211.entity.Place;

@Repository
public interface PlaceRepository extends JpaRepository<Place, Integer> {
	List<Place> findAll();

	//List<Place> findByCategory2AndCategory3(String category2, String category3); 
	
	ArrayList<Place> findByCategory2(String parkId);
	ArrayList<Place> findByCategory3(String parkId);
	ArrayList<Place> findByCategory4(String parkId);
	ArrayList<Place> findByRoom(String firstRomm);
	
	@Query(nativeQuery=true, value = "select distinct price_day from place where category4 = ?1")
	List<String> findDistintPriceDay(String parkId);
	
	@Query(nativeQuery=true, value = "select distinct people_max from place where category4 = ?1")
	List<Integer> findDistintPeopleMax(String parkId);
	
	@Query(nativeQuery=true, value = "select distinct category2 from place where category1 = ?1")
	ArrayList<String> findDistintCategory2(String category1);
	
	@Query(nativeQuery=true, value = "select distinct category3 from place where category2 = ?1")
	ArrayList<String> findDistintCategory3(String category2);

	@Query(nativeQuery=true, value = "select distinct category4 from place where category3 = ?1")
	ArrayList<String> findDistintCategory4(String category3);
	
	
	
	@Query(nativeQuery=true, value = "select * from place where category2 like CONCAT('%',:category2,'%')")
	ArrayList<Place> find(@Param("category2") String category2);
	
	//작성자: 김수정
	List<PlaceDTO> findAllByCategory2(String category2);


	@Query(nativeQuery=true, value = "select distinct room from place where category4 = ?1")
	ArrayList<String> findDistintRoom(String category4);


	Place findFirstByCategory4(String cat4);

	//attention리스트 셀렉트용//
	@Query(nativeQuery=true, value = "select distinct category2 from place")
	ArrayList<String> findDistinctCategory2();


	PlaceDTO findAllByCategory4(String category2);

	


	

	
}
