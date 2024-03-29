package com.gjai.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gjai.entity.BoardVO;
import com.gjai.entity.Criteria;
import com.gjai.entity.Member;
import com.gjai.entity.PageMaker;
import com.gjai.mapper.BoardMapper;
import com.gjai.service.BoardService;



@Controller // 
public class BoardController {
	
	@Autowired // DI(의존성 주입)
	BoardService boardService;
	
	@RequestMapping("/boardList.do")
	public String getList(Criteria cri,Model model, HttpSession session) {
		System.out.println("게시판 목록보기 요청");
		List<BoardVO> list = boardService.getList(cri);
		model.addAttribute("list", list);  // Object타입으로 add함
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.countBoard());
		session.setAttribute("pageMaker", pageMaker);
		return "boardList";
	}
	@RequestMapping(value="/boardWrite.do",method=RequestMethod.GET) // 겟 방식일때 여기로
	public String register() {  
		return "boardWrite";
	}
	@RequestMapping(value="/boardWrite.do",method=RequestMethod.POST) // 포스트 방식은 여기 or 이노테이션을 get이나 post매핑으로(update처럼)
	public String register(BoardVO vo, HttpSession session) {
		Member mvo = (Member)session.getAttribute("mvo");
		vo.setMemId(mvo.getMemId());
		boardService.register(vo);
		return "redirect:/boardList.do";
	}
	@GetMapping("/boardView.do") // 보드리스트에서 ?idx= 로 겟 해놔서 이거 씀
	public String get(/* @RequestParam("idx") 넘어오는 값과 변수가 같아서 생략가능*/ int idx, Model model) {
		BoardVO vo = boardService.get(idx);
		model.addAttribute("vo", vo);
		return "boardView";
	}
	@GetMapping("/boardDelete.do/{idx}")  // << 이런식으로 데이터 받을 때 매개변수 어노테이션 아래처럼
	public String remove(@PathVariable int idx) {
		boardService.remove(idx);
		return "redirect:/boardList.do";
	}
	@GetMapping("/boardUpdate.do/{idx}")
	public String modify(Model model,@PathVariable int idx) {
		BoardVO vo = boardService.get(idx);
		model.addAttribute("vo", vo);
		return "boardUpdate";
	}
	@PostMapping("/boardUpdate.do")
	public String modify(BoardVO vo) {
		boardService.modify(vo);
		return "redirect:/boardList.do";
	}
	@GetMapping("/boardReply.do/{idx}")
	public String reply(@PathVariable int idx,Model model) {
		BoardVO vo = boardService.get(idx);
		model.addAttribute("vo", vo);
		return "boardReply";
	}
	@PostMapping("/boardReply.do")
	public String reply(BoardVO vo) {
		BoardVO parent = boardService.get(vo.getIdx());
		vo.setBoardGroup(parent.getBoardGroup());
		vo.setBoardSequence(parent.getBoardSequence()+1);
		vo.setBoardLevel(parent.getBoardLevel()+1);
		
		boardService.replyUpdate(parent); // 원글과 답글의 순서 조정
		boardService.replyInsert(vo); // 답글 등록
		
		return "redirect:/boardList.do";
	}
	@RequestMapping("/boardSearch.do")
	public String search(Criteria cri) {
	 	List<BoardVO> list = boardService.search(cri);
		return "";
	}
	
}


