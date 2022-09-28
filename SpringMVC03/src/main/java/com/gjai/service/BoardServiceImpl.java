package com.gjai.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gjai.entity.BoardVO;
import com.gjai.entity.Member;
import com.gjai.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	
	@Autowired
	BoardMapper boardMapper;
	public List<BoardVO> getList(){
		List<BoardVO> list = boardMapper.getList();
		return list;
	}
	public void register(BoardVO vo) {
		boardMapper.insert(vo);
	}
	public BoardVO get(int idx) {
		BoardVO vo = boardMapper.read(idx);
		return vo;
	}
	public void remove(int idx) {
		boardMapper.delete(idx);
	}
	public void modify(BoardVO vo) {
		boardMapper.update(vo);
	}
	@Override
	public Member loginCheck(Member vo) {
		Member mvo = boardMapper.getLogin(vo);
		return mvo;
	}
	@Override
	public void replyUpdate(BoardVO parent) {
		boardMapper.replyUpdate(parent);
	}
	@Override
	public void replyInsert(BoardVO vo) {
		boardMapper.replyInsert(vo);
	}
	
}
