package com.gjai.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.gjai.entity.BoardVO;

public interface BoardMapper {
	public List<BoardVO> boardList();
	
	public void boardInsert(BoardVO vo);
	
	@Select("select * from board where idx=#{idx}")
	public BoardVO boardView(int idx);
	
	@Delete("delete from board where idx=#{idx}")
	public void boardDelete(int idx);
	
	public void boardUpdate(BoardVO vo);
	
}
