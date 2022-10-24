package kr.book.bshop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.book.entity.BookVO;
import kr.book.mapper.BookMapper;

@Controller
public class BookController {

	@Autowired
	BookMapper mapper;
	
	@RequestMapping("/bookList.do")
	public void bookList(Model model) {
		List<BookVO> list = mapper.bookList();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/bookInsert.do")
	public String bookInsert(BookVO vo) {
		mapper.bookInsert(vo);
		return "redirect:/bookList.do";
	}
	
}
