package com.koreait.shopping.board.model.dto;

import com.koreait.shopping.board.model.entity.BoardProductEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardProductDto extends BoardProductEntity {
    private int isubcategory;
    private String size;
    private int itemNum;
    private int recordCnt;
    private int page;
    private int sIdx;

    public void setPage(int page) {
        this.page = page;
        this.sIdx = (page - 1) * recordCnt;
    }
}