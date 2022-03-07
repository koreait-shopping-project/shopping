package com.koreait.shopping.Paging;

import com.koreait.shopping.board.model.dto.BoardListDto;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardCriteria extends BoardListDto {
    private int pageNum;
    private int amount;
    private int page;

    public BoardCriteria(){
        this(1,10);
    }

    public void setPageNum(int pageNum) {
        this.page = (pageNum-1) * amount;
        this.pageNum = pageNum;
    }

    public BoardCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
