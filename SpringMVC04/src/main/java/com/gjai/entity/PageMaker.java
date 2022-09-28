package com.gjai.entity;

import lombok.Data;

@Data
public class PageMaker {
	private Criteria cri;
	private int totalCount; // 총 게시글 수
	private int startPage; // 시작페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev; // '이전' 버튼 생성 할 거야?
	private boolean next; // '다음' 버튼 생성 할?
	private int displayPageNum=3; // 한 페이지에 몇 쪽 까지 표기 할 지

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPaging();
	}

	private void calcPaging() {
		// 1. 화면에 보여질 마지막 페이지 번호
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum))*displayPageNum;
		// 2. 화면에 보여질 시작 페이지 번호
		startPage = endPage-displayPageNum+1;
		if(startPage<=0) startPage=1;
		// 3. 전체 마지막 페이지
		int tempEndPage = (int)Math.ceil(totalCount/(double)cri.getPerPageNum());
		// 4. 화면에 보여질 마지막 페이지 유효성 체크
		if(endPage>tempEndPage) {
			endPage=tempEndPage;
		}
		// 5. 이전 페이지 버튼(링크) 존재 여부
		prev = (startPage==1) ? false :true;
		next = (endPage<tempEndPage) ? true: false;
	}
}
