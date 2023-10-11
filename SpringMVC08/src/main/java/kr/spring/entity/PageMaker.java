package kr.spring.entity;

import lombok.Data;

@Data
public class PageMaker { // 페이징처리 클래스
	
	private Criteria cri; // 현재 몇 페이지인지 정보와 게시글을 몇 개씩 볼 것인지 그리고
						  // 현재 페이지에서 몇 번 글부터 시작해야하는 지 정보를 가지고 있는 객체가 있어야
						  // 페이징 처리가 가능하다
	
	private int totalCount; // 총 게시글의 수 : 총 게시글의 수를 알아야 몇 페이지가 나오는 지 알 수 있다.
	
	private int startPage; // 시작페이지 번호
	
	private int endPage; // 끝페이지 번호
	
	private boolean prev; // 이전 버튼
	
	private boolean next; // 다음 버튼
	
	private int displayPageNum = 10; // 하단에 몇 개의 페이지를 보여줄 것 인지
	// 1 2 3 4 5 6 7 8 9 10
	
	// 총 게시글의 수를 구하는 메소드
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		makePagein();
	}
	
	public void makePagein() {
		// 1. 화면에 보여질 마지막 페이지 번호
		// 현재 하단에 보여줄 페이지 개수는? 1 2 3 4 5 6 7 8 9 10
		// 질문. 내가 현재 7 페이지를 보고 있다. 그렇다면 우측 끝에 있는 마지막 페이지 번호는? 10
		// 질문. 내가 현재 13 페이지를 보고 있다. 그렇다면 우측 끝에 있는 마지막 페이지 번호는? 20
		// 7 / 10.0 -> 소수 발생 시 올림 -> 1 * 10 -> 10
		// 13 / 10.0 -> 2 * 10 -> 20
		endPage = (int)(Math.ceil((cri.getPage() / (double)displayPageNum) * displayPageNum));
		
		// 2. 화면에 보여질 시작 페이지 번호
		// 현재 7 페이지 -> 10(마지막) - 10(보여줄 페이지 개수) + 1
		// 현재 15 페이지 -> 20(마지막) - 10(보여줄 페이지 개수) + 1
		startPage = endPage - displayPageNum + 1;
		
		if(startPage <= 0) {
			startPage = 1; // 혹시라도 startPage가 0보다 작거나 같다면 1부터 시작할 수 있게
		}
		
	}
	
}
