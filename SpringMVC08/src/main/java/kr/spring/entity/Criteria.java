package kr.spring.entity;

import lombok.Data;

@Data
public class Criteria { // Criteria : 기준
	
	private int page; // 현재 페이지 번호 저장 변수
	
	private int perPageNum; // 한 페이지에 보여줄 게시글의 개수
	
	// 현재 페이지에 있는 게시글의 시작 번호를 구하는 메소드
	// 1 page -> 0 ~ 9 / 2 page -> 10 ~ 19
	// 예외 : mysql에서는 시작값을 0으로 인식
	
	public int getPageStart() {
		return (page - 1) * perPageNum;
	}
	
}