package com.gjai.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.gjai.entity.BoardVO;
import com.gjai.entity.Criteria;
import com.gjai.entity.Member;
// CRUD
public interface BoardMapper {
	//어노테이션 있는건 xml없이 여기서 바로 쿼리문 실행하는 법
	
	public List<BoardVO> getList(Criteria cri);
	
	public void insert(BoardVO vo);
	
	@Select("select * from reboard where idx=#{idx}")
	public BoardVO read(int idx);
	
	@Delete("update reboard set boardAvailable=0 where idx=#{idx}")
	public void delete(int idx);
	
	public void update(BoardVO vo);
	public Member getLogin(Member vo);
	
	public void replyUpdate(BoardVO parent);
	public void replyInsert(BoardVO vo);
	
	// 총 게시글 수 구하기
	public int countBoard();

	public List<BoardVO> search(Criteria cri);
}
