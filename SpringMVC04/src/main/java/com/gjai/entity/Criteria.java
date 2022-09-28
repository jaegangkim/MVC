package com.gjai.entity;

import lombok.Data;

@Data
public class Criteria {
	private int page; // 현재 페이지 번호
	private int perPageNum; // 한 페이지에 보여줄 게시글 수
	private String type;
	private String keyword;
	
	public Criteria() {
		this.page=1; //현재 페이지 =1
		this.perPageNum=3; 
	}
	// 현재 페이지 게시글의 시작번호
	public int getPageStart() {
		return (page-1)*perPageNum;
	}
}