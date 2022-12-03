package com.reservation.knpr2211.dto;

/*CREATE TABLE `notice` (
	    no            int,
	    id            varchar(20),
	    category1     varchar(20),
	    title         varchar(100),
	    content       text(3000),    
	    hit           int,
	    filename      varchar(300),  
	    noti      	  varchar(10),  
	    createDate    varchar(15),
	    PRIMARY KEY (`no`)
	) DEFAULT CHARSET=utf8;
*/

public class NoticeDTO {
	private int no;
	private int hit;
	private String fileName;
	
	public String getNoti() {
		return noti;
	}
	public void setNoti(String noti) {
		this.noti = noti;
	}
	private String noti;
	private String createDate;
	private String id;
	private String category1;
	private String title;
	private String content;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
		
	
}
