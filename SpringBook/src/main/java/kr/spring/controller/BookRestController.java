package kr.spring.controller;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.entity.Book;
import kr.spring.mapper.BookMapper;


// 앞으로 게시글 관련 요청할 때는 무조건
// /board/하고싶은 기능요청 url
// /board/boardList.do
// /board/boardDelete.do

@RequestMapping("/book")
@RestController
public class BookRestController {
	
	// RestController
	// 비동기 방식의 일만 처리하는 Controller
	// Rest 전송방식을 처리할 수 있다
	// - 요청 url + 전송방식(상태)을 묶어서 처리 가능
	// 사용이유 - url의 통일성 및 단순화
	
	@Autowired
	private BookMapper mapper; // MyBatis한테 JDBC 실행하게 요청하는 객체
	
	
	@GetMapping("/all")
	public List<Book> boardList() {
		System.out.println("게시글 전체 보기 기능 수행");
		List<Book> list = mapper.getLists();
		System.out.println(list.size());
		return list;
	}
	
	@PostMapping("/new")
	public void bookInsert(Book book) {
		System.out.println("게시글 작성 기능 수행");
		mapper.bookInsert(book);
	}
	
	@GetMapping("/{num}")
	public Book boardContent(@PathVariable("num") int num) {
		Book vo = mapper.bookContent(num);
		return vo;
	}
	
	@DeleteMapping("/{num}")
	public void boardDelete(@PathVariable("num") int num) {
		System.out.println("게시글 삭제 기능 수행");
		mapper.bookDelete(num);
	}
	
	@PutMapping("/update")
	public void bookUpdate(@RequestBody Book book) {
		System.out.println("게시글 삭제 기능 수행");
		mapper.bookUpdate(book);
	}

	
}
