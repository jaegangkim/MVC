package com.gjai.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gjai.entity.BoardVO;
import com.gjai.mapper.BoardMapper;
import com.gjai.service.BoardService;



@Controller // 
public class BoardController {
	
	@Autowired // DI(의존성 주입)
	BoardService boardService;
	
	@RequestMapping("/boardList.do")
	public String boardList(Model model) {
		System.out.println("게시판 목록보기 요청");
		List<BoardVO> list = boardService.boardList();
		model.addAttribute("list", list);  // Object타입으로 add함
		
		return "boardList";
	}
	@RequestMapping("/boardForm.do")
	public String boardForm() {
		return "boardWrite";
	}
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite(BoardVO vo) {
		boardService.boardInsert(vo);
		return "redirect:/boardList.do";
	}
	
	@GetMapping("/boardView.do") // 보드리스트에서 ?idx= 로 겟 해놔서 이거 씀
	public String boardView(/* @RequestParam("idx") 넘어오는 값과 변수가 같아서 생략가능*/ int idx, Model model) {
		BoardVO vo = boardService.boardView(idx);
		model.addAttribute("vo", vo);
		return "boardView";
	}
	@GetMapping("/boardDelete.do/{idx}")  // << 이런식으로 데이터 받을 때 매개변수 어노테이션 아래처럼
	public String boardDelete(@PathVariable int idx) {
		boardService.boardDelete(idx);
		return "redirect:/boardList.do";
	}

	@GetMapping("/boardUpdateForm.do/{idx}")
	public String boardUpdate(Model model,@PathVariable int idx) {
		BoardVO vo = boardService.boardView(idx);
		model.addAttribute("vo", vo);
		return "boardUpdate";
	}
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO vo) {
		boardService.boardUpdate(vo);
		
		return "redirect:/boardList.do";
	}
	
}


