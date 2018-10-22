package com.ft.notice;

import java.sql.Date;

public class NoticeDTO {
	private int num;
	private String writer;
	private String title;
	private String content;
	private Date reg_date;
	private int hit;
	
	

	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
