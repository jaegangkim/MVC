package com.gjai.service;

import java.util.List;

import com.gjai.entity.BoardVO;
import com.gjai.entity.Criteria;
import com.gjai.entity.Member;

public interface BoardService {

	public List<BoardVO> getList(Criteria cri);
	public void register(BoardVO vo);
	public BoardVO get(int idx);
	public void remove(int idx);
	public void modify(BoardVO vo);
	public Member loginCheck(Member vo);
	public void replyUpdate(BoardVO parent);
	public void replyInsert(BoardVO vo);
	public int countBoard();
	public List<BoardVO> search(Criteria cri);
	
	
}
