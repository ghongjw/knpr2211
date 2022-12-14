package com.reservation.knpr2211.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.knpr2211.dto.BoardDto;
import com.reservation.knpr2211.entity.Board;
import com.reservation.knpr2211.entity.Reply;
import com.reservation.knpr2211.entity.User;
import com.reservation.knpr2211.repository.BoardRepository;
import com.reservation.knpr2211.repository.ReplyRepository;
import com.reservation.knpr2211.repository.UserRepository;

@Service
public class BoardService {
	
	@Autowired 
	private ReplyRepository replyRepository;
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private UserRepository ur;
	
	@Autowired
	private HttpSession session; 
	
	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	//묻고답하기 등록 
	@Transactional
	public void savePost(Model model, BoardDto boardDto) {
		boardRepository.save(boardDto.toEntity()).getBno();
	
	}
	
	public String savePosts(String writer, String category1, String type, String title, String content, String lock_yn,
			boolean state, HttpServletResponse response, Long bno) throws IOException {
		
		if(title==null || title.isEmpty()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('제목은 필수사항입 니다');</script>");
			out.flush();
			return "board/write";
		}
		if(content==null || content.isEmpty()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('내용은 필수사항입 니다');</script>");
			out.flush();
			return "board/write";
		}
		
		
		Board board1 = Board.builder().writer(writer).category1(category1).type(type).title(title).content(content).lock_yn(lock_yn).state(state).build();
		boardRepository.save(board1);
		
		
		return "redirect:list";
	}
	 
	//리스트              
	public String paging(Model model, Integer page, Integer size, String board, String select, String category1,String keyword,  RedirectAttributes ra) {
		if(page == null || size == null) {
			page = 0;
			size = 10;
		}
		if (board == null || board.isEmpty()) {
			board = "all";
		}
		if (select == null || select.isEmpty()) {
			select = "id";
		}
		if(category1 == null || category1.isEmpty()) {
			category1 = "all";
		}
		PageRequest pageRequest = PageRequest.of(page, size, Sort.by(Direction.DESC,"bno"));
		
		Page<Board> result = boardRepository.findAll(pageRequest); 
	
		if(keyword==null) {
			if(!category1.equals("all")) {
				result = boardRepository.findByCategory1(category1, pageRequest);
			}else {
				result = boardRepository.findAll(pageRequest);
			}
		}
		else {
			if(!category1.equals("all")) {
				if(select.equals("title")) {
					result = boardRepository.findByCategory1AndTitleContaining(category1,keyword, pageRequest);
				}else if(select.equals("content")) {
					result = boardRepository.findByCategory1AndContentContaining(category1,keyword, pageRequest);

				}else {
					result = boardRepository.findBykeyword(category1,keyword,keyword, pageRequest);

				}
			}else {
				if(select.equals("title")) {
					result = boardRepository.findByTitleContaining(keyword, pageRequest);
					}else if(select.equals("content")) {
						result = boardRepository.findByContentContaining(keyword, pageRequest);

					}else {
						result = boardRepository.findBykey(keyword,keyword, pageRequest);

					}
			}
		}
		
		List<Board> boards = result.getContent();
		
		int totalPage = result.getTotalPages();
		System.out.println(totalPage);
		if (totalPage == 0) {
			totalPage = 1;
		}
		long totalElement = result.getTotalElements();
		
		String sessionId = (String)session.getAttribute("id");
		User user = ur.findByid(sessionId);
		model.addAttribute("member", user);
		
		model.addAttribute("boards", boards);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("totalElement", totalElement);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category1", category1);
		model.addAttribute("board", board);
		model.addAttribute("select", select);
		
		ra.addAttribute("boardList", boards);
		
		return "redirect:list";
	}
	
	//상세페이지
	public String getPost(Long bno, Model model) {
		String sessionId = (String)session.getAttribute("id");
		if (bno == null || sessionId == null || sessionId.isEmpty()) {
			model.addAttribute("msg","잘못된 접근입니다. 로그인 후 이용해주세요.");
			return "login/login";
		}
		User user = ur.findByid(sessionId);
		String member = user.getMember();
		
		Optional<Board> boardWrapper = boardRepository.findById(bno);
		
		List<Reply> list = replyRepository.findByBoard(boardWrapper.get());
		
		for(Reply reply : list) {
			
			reply.getContent();
			
		}
		
		model.addAttribute("list", list);
		Board board = boardWrapper.get();

		if(member.equals("admin") || sessionId.equals(board.getWriter())) {
			BoardDto boardDto =  BoardDto.builder()
					.bno(board.getBno())
					.title(board.getTitle())
					.category1(board.getCategory1())
					.content(board.getContent())
					.writer(board.getWriter())
					.createDate(board.getCreateDate())
					.list(list)
					.build();
					
					model.addAttribute("boardDto", boardDto);
					model.addAttribute("member", user);

					return "board/detail";
		}
		
		else return "redirect:list";
		
	}
	//삭제
	@Transactional
	public void deletePost(String delete) {
		long bno = Integer.parseInt(delete);
		Board board= boardRepository.findByBno(bno);
		List<Reply> result = replyRepository.findByBoard(board);
		for(Reply r : result) {
			r.setBoard(null);
			replyRepository.save(r);
		}
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
}
