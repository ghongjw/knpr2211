package com.reservation.knpr2211.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.dto.BoardDto;
import com.reservation.knpr2211.entity.Board;
import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.BoardRepository;
import com.reservation.knpr2211.repository.UserRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private UserRepository ur;
	
	@Autowired
	private HttpSession session;
	
	//페이징
	private static final int BLOCK_PAGE_NUM_COUNT = 10; //블럭에 존재하는 페이지 수
	private static final int PAGE_POST_COUNT = 10; // 한 페이지에 존재하는 게시글 수
	
	
	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}
	
	//검색(구분은 못함 아직)
		@Transactional
		public String searchPosts(Model model, String category1, String select, String keyword, RedirectAttributes ra) {
			
			List<Board> boards = new ArrayList<Board>(); 
			
			if(keyword==null) {
				if(!category1.equals("all")) {
					boards = boardRepository.findByCategory1(category1);
				}else {
					boards = boardRepository.findAll();
				}
			}
			else {
				if(!category1.equals("all")) {
					if(select.equals("title")) {
					boards = boardRepository.findByCategory1AndTitleContaining(category1,keyword);
					}else if(select.equals("content")) {
					boards = boardRepository.findByCategory1AndContentContaining(category1,keyword);

					}else {
						boards = boardRepository.findBykeyword(category1,keyword,keyword);

					}
				}else {
					if(select.equals("title")) {
						boards = boardRepository.findByTitleLike(keyword);
						}else if(select.equals("content")) {
						boards = boardRepository.findByContentContaining(keyword);

						}else {
							boards = boardRepository.findBykey(keyword,keyword);

						}
				}
			}
			
			
			ra.addAttribute("boardList", boards);
			
	 		return "redirect:list";
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
					.lock_yn(board.isLock_yn())
					.state(board.isState())
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
	public String getPost(Long bno, Model model) {
		String sessionId = (String)session.getAttribute("id");
		if (bno == null || sessionId == null||sessionId.isEmpty()) {
			model.addAttribute("msg","잘못된 접근입니다.");
			return "login/login";
		}
		User user = ur.findByid(sessionId);
		String member = user.getMember();
		
		Optional<Board> boardWrapper = boardRepository.findById(bno);
		
		Board board = boardWrapper.get();
		if(member.equals("admin")||sessionId.equals(board.getWriter())) {
			BoardDto boardDto =  BoardDto.builder()
					.bno(board.getBno())
					.title(board.getTitle())
					.content(board.getContent())
					.writer(board.getWriter())
					.createDate(board.getCreateDate())
					.build();

					model.addAttribute("boardDto", boardDto);

					return "board/detail";
		}
		
		else return "redirect:list";
		
	}
	//삭제
	@Transactional
	public void deletePost(Long bno) {
		boardRepository.deleteById(bno);
	}

	public String getMember(Model model) {
		String sessionId = (String)session.getAttribute("id");
		if (sessionId == null||sessionId.isEmpty()) {
			model.addAttribute("msg","잘못된 접근입니다.");
			return "login/login";
		}
		User user = ur.findByid(sessionId);
		model.addAttribute("member", user);
		
		return "board/write";
		
	}

	public String savePosts(String writer, String category1, String type, String title, String content, boolean lock_yn,
			boolean state) {
		
		Board board = Board.builder().writer(writer).category1(category1).type(type).title(title).content(content).lock_yn(lock_yn).state(state).build();
		boardRepository.save(board);
		
		return "redirect:/list";
	}
	
	
	

	
}
