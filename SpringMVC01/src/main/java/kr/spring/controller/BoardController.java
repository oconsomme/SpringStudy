package kr.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.entity.Board;
import kr.spring.mapper.BoardMapper;

@Controller // 현재 클래스를 핸들러 맵핑이 찾기 위해 컨트롤러로 등록하는 부분
public class BoardController {
	
	@Autowired
	private BoardMapper mapper; // MyBatis한테 JDBC 실행하게 요청하는 객체
	
	@RequestMapping("/") // 요청 url로 들어 왔을 때 아래 기능을 수행하겠다
	public String home(){
		System.out.println("홈 기능 수행");
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardList.do") // 요청 url로 들어 왔을 때 아래 기능을 수행하겠다
	public String boardList(Model model){
		System.out.println("게시판 목록 보기 기능 수행");
		
		// 게시글 정보 가져오기
		// 한 개의 게시글은 - 번호, 제목, 내용, 작성자, 작성일, 조회수
		// 전체 게시글 조회 기능
		List<Board> list = mapper.getLists();
		
		// 객체 바인딩 - 동적 바인딩
		model.addAttribute("list", list);
		return "boardList"; // /WEB-INF/views/boardList.jsp -> forward 방식
	}
	
	@RequestMapping("/boardForm.do")
	public String boardForm() {
		System.out.println("글쓰기 페이지 이동");
		
		return "boardForm";
	}
	
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board board) { 
		System.out.println("게시글 등록 기능 수행");
		
		mapper.boardInsert(board);
		
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardContent.do/{idx}")
	public String boardContent(@PathVariable("idx") int idx, Model model) {
		System.out.println("게시글 상세 보기 기능 수행");
		// 게시글 조회수 증가
		mapper.boardCount(idx);
		
		Board vo = mapper.boardContent(idx);
		model.addAttribute("vo", vo);
		return "boardContent";
	}
	
	@RequestMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable("idx") int idx) {
		System.out.println("게시글 삭제 기능 수행");
		mapper.boardDelete(idx);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardUpdateForm.do/{idx}")
	public String boardUpdateForm(@PathVariable("idx") int idx, Model model) {
		System.out.println("게시글 수정 화면 이동 기능 수행");
		Board vo = mapper.boardContent(idx);
		model.addAttribute("vo", vo);
		return "boardUpdateForm";
	}
	
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(Board board) {
		System.out.println("게시글 수정 기능 수행");
		mapper.boardUpdate(board);
		return "redirect:/boardList.do";
	}

}
