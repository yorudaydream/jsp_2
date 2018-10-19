package com.ft.notice;

import java.sql.Date;

public class NoticeDTO {
	private int num;
	private String name;
	private String title;
	private String content;
	private Date today;
	private int hit;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
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
