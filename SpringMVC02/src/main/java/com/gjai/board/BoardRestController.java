package com.gjai.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gjai.entity.BoardVO;
import com.gjai.service.BoardService;

@RestController // JSON Data전달 (1)
public class BoardRestController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board")
	public /* (2) */List<BoardVO> boardListAjax(){
		List<BoardVO> list = boardService.getList();
		return list; // 또는 (1)을 controller로하고 (2)에 @ResponseBody
	}
	
	@GetMapping("/board/{idx}")
	public BoardVO boardViewAjax(@PathVariable int idx) {
		return boardService.get(idx);
	}
	
}
