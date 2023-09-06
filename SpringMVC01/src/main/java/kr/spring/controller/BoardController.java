package kr.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Board;
import kr.spring.mapper.BoardMapper;

@Controller // 현재 클래스를 핸들러 맵핑이 찾기 위해 컨트롤러로 등록하는 부분
public class BoardController {
	
	@Autowired
	private BoardMapper mapper; // MyBatis한테 JDBC 실행하게 요청하는 객체
	
//	@RequestMapping("/") // 요청 url로 들어 왔을 때 아래 기능을 수행하겠다
//	public String home(){
//		System.out.println("홈 기능 수행");
//		return "boardList";
//	}
	
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

}
