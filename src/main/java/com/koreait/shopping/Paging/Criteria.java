package com.koreait.shopping.Paging;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
    private int page;
    private int perPageNum;

    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }

    public void setPage(Integer page) {
        // page를 1보다 작은 수로 입력되면 1로 고정
        this.page = (page < 1) ? 1 :  page;
    }

    public void setPerPageNum(int perPageNum) {
        // perPageNum을 10 미만 또는 100이상일 경우 10으로 고정
        this.perPageNum = (perPageNum < 10 || perPageNum >=100) ? 10 : perPageNum;
    }

    //MyBatis
    public int getPageStart(){
        return (this.page-1) * 10 ;
    }
}
