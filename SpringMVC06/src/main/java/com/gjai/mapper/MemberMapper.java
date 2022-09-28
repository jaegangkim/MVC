package com.gjai.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.gjai.entity.MemberVO;

@Mapper
public interface MemberMapper {

	@Select("select * from smember where id=#{id}")
	public MemberVO idCheck(String id);

	@Select("select * from smember")
	public List<MemberVO> memberList();
	
	
	
}
