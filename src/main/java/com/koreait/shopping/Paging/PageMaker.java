package com.koreait.shopping.Paging;

public class PageMaker {
    private Criteria cri; // page, perPageNum
    private int totalCount; // 총 게시물 수
    private int startPage;  // 시작 페이지
    private int endPage;    // 끝 페이지
    private boolean prev;       // 이 전
    private boolean next;       // 이 후

    private int displayPageNum = 10; // 페이지네이션 보여줄 갯 수 10개로 고정

    private void calcData(){
        // 끝 페이지
        endPage = (int)Math.ceil((double)cri.getPage()/displayPageNum) * displayPageNum;
        // 시작 페이지
        startPage = (endPage - displayPageNum) + 1;
        int tempEndPage = (int)Math.ceil((double)totalCount/displayPageNum);
        // 끝 페이지 검증
        if( endPage > tempEndPage ){
            endPage = tempEndPage;
        }// if()
        // 이전
        prev = (startPage != 1);
        // 이후
        next = (tempEndPage > endPage);
    }// calcData()
    /*getters & setters*/
}
