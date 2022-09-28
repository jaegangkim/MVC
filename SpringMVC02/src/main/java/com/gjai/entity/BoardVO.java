package com.gjai.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
public class BoardVO {
	// VO는 세가지 ( 필드, 메소드, 생성자 )가 기본 , 추가 (toString)
	private int idx;
	private String memId;
	private String title;
	private String contents;
	private int count;
	private String writer;
	private String indate;

	
}
