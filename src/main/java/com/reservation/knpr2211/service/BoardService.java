package com.reservation.knpr2211.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.reservation.knpr2211.dto.BoardDto;
import com.reservation.knpr2211.entity.Board;
import com.reservation.knpr2211.repository.BoardRepository;

@Service
public class BoardService {
	
	private BoardRepository boardRepository;
	
	//페이징
	private static final int BLOCK_PAGE_NUM_COUNT = 10; //블럭에 존재하는 페이지 수
	private static final int PAGE_POST_COUNT = 10; // 한 페이지에 존재하는 게시글 수
	
	
	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}
	
	//검색(구분은 못함 아직)
		@Transactional
		public List<BoardDto> searchPosts(String keyword) {
			List<Board> boards = boardRepository.findByTitleContaining(keyword);
			List<BoardDto> boardDtoList = new ArrayList<>();
			
			if(boards.isEmpty()) return boardDtoList;
			
			for(Board board : boards) {
				boardDtoList.add(this.convertEntityToDto(board));
			}
	 		return boardDtoList;
		}
		
		private BoardDto convertEntityToDto(Board board) {
			return BoardDto.builder()
					.bno(board.getBno())
					.category1(board.getCategory1())
					.type(board.getType())
					.title(board.getTitle())
					.content(board.getContent())
					.writer(board.getWriter())
					.createDate(board.getCreateDate())
					.lock_yn(board.getLock_yn())
					.state(board.getState())
					.build();
		}
		
	//묻고답하기 등록 및 수정
	@Transactional
	public void savePost(BoardDto boardDto) {
		boardRepository.save(boardDto.toEntity()).getBno();
	}
	
	
	//리스트
	@Transactional
	public List<BoardDto> getBoardlist(Integer pageNum) {
	
		Page<Board> page = boardRepository
				.findAll(PageRequest
						.of(pageNum-1, PAGE_POST_COUNT, Sort.by(Sort.Direction.ASC,"createDate")));
		
		/* List<Board> boards = boardRepository.findAll(); */
		List<Board> boards = page.getContent();
		List<BoardDto> boardDtoList = new ArrayList<>();
		
		for(Board board : boards) {
			boardDtoList.add(this.convertEntityToDto(board));
		}
		return boardDtoList;
	}
	
	
	//페이징
	public Integer[] getPageList(Integer curPageNum) {
		Integer[] pageList = new Integer[BLOCK_PAGE_NUM_COUNT];
		
		//총 게시글 수
		Double postsTotalCount = Double.valueOf(this.getBoardCount());
		
		//총 게시글 수를 기준으로 계산한 마지막 페이지 번호 계산
		Integer totalLastPageNum = (int)(Math.ceil((postsTotalCount/PAGE_POST_COUNT)));
		
		//현재 페이지를 기준으로 블럭의 마지막 펭지 번호 계산
		Integer blockLastPageNum = (totalLastPageNum > curPageNum + BLOCK_PAGE_NUM_COUNT)
				? curPageNum + BLOCK_PAGE_NUM_COUNT
				: totalLastPageNum;
		
		//페이지 시작 번호 조정
		curPageNum = (curPageNum<=3) ? 1 : curPageNum-2; 
		
		//페이지 번호 할당
		for(int val=curPageNum, i=0;val<=blockLastPageNum;val++, i++) {
			pageList[i] = val;
		}
		return pageList;
	}
	
	@Transactional
	private Long getBoardCount() {
		return boardRepository.count();
	}

	
	//상세페이지
	@Transactional
	public BoardDto getPost(Long bno) {
		Optional<Board> boardWrapper = boardRepository.findById(bno);
		Board board = boardWrapper.get();
		
		BoardDto boardDto = BoardDto.builder()
				.bno(board.getBno())
				.title(board.getTitle())
				.content(board.getContent())
				.writer(board.getWriter())
				.createDate(board.getCreateDate())
				.build();
		return boardDto;
	}
	
	
	//삭제
	@Transactional
	public void deletePost(Long bno) {
		boardRepository.deleteById(bno);
	}
	
	
	

	
}
