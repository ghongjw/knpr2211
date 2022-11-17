package com.reservation.knpr2211.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.knpr2211.entity.Board;
import com.reservation.knpr2211.repository.BoardRepository;


@Service
public class BoardService {
	@Autowired BoardRepository boardRepository;
	
	//문의글 글쓰기
	public String writeProc(Integer bno, String category1, String type, String title, String content, String writer,
			String lock_yn, String state) {
		
		LocalDateTime createDate2 = LocalDateTime.now();
		
		Board entity = Board.builder().bno(bno).category1(category1).type(type).title(title).
			content(content).writer(writer).createDate(createDate2).lock_yn(lock_yn).state(state).build();
		boardRepository.save(entity);
		return "등록성공";
		

	}
	//문의글 수정하기
	public String modifyProc(Integer bno, String category1, String type, String title, String content, String writer,
			String lock_yn, String state) {
		
		LocalDateTime createDate2 = LocalDateTime.now();
		
		Board entity = Board.builder().bno(bno).category1(category1).type(type).title(title).
			content(content).writer(writer).createDate(createDate2).lock_yn(lock_yn).state(state).build();
		boardRepository.save(entity);
		return "등록성공";
		
	}
	//문의글 리스트
	public List<Board> findAll(){ 
		 System.out.println(boardRepository.findAll());
	  	 return boardRepository.findAll(); 
	}
	//문의글 상세보기
	public Optional<Board> findById(Integer bno){ 
		System.out.println(boardRepository.findById(bno));
		return boardRepository.findById(bno); 
	}
	
	
	
}
