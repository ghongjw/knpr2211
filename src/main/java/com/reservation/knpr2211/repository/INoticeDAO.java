package com.reservation.knpr2211.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.reservation.knpr2211.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {
	public void writeProc(NoticeDTO notice);

	public ArrayList<NoticeDTO> noticeProc(@Param("b") int begin, @Param("e")int end,  @Param("sel")String sel, @Param("search") String search);

	public NoticeDTO viewProc(int no);
	
	public void upHit(int no);

	public int noticeCount(HashMap<String, Object> map);

	public int modifyProc(NoticeDTO notice);

	public int deleteProc(int no);

	public String getFileName(int no);
}
