package com.reservation.knpr2211.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.reservation.knpr2211.entity.Board;
import com.reservation.knpr2211.entity.Reply;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardDto {
	
	private Long bno;
	private String category1;
	private String type;
	private String title;
	private String content;
	private String writer;
	private boolean lock_yn;
	private boolean state;
	private LocalDateTime createDate;
	private LocalDateTime modifiedDate;
	private List<Reply> replyList = new ArrayList<>();
	
	public Board toEntity() {
		Board build = Board.builder()
				.bno(bno)
				.category1(category1)
				.type(type)
				.title(title)
				.content(content)
				.writer(writer)
				.lock_yn(lock_yn)
				.state(state)
				.build();
		return build;
	}
	
	@Builder
	public BoardDto(Long bno, String category1, String type, String title, String content, String writer,
			LocalDateTime createDate, LocalDateTime modifiedDate, boolean lock_yn, boolean state, List<Reply> list) {
		this.bno = bno;
		this.category1 = category1;
		this.type = type;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.createDate = createDate;
		this.modifiedDate = modifiedDate;
		this.lock_yn = lock_yn;
		this.state = state;
		this.replyList = list;
	}
}
