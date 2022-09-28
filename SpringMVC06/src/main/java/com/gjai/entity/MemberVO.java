package com.gjai.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private String id;
	private String pw;
	private String nick;
	private String phone;
	private String addr;
	 
}