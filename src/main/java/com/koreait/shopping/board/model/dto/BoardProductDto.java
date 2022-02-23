package com.koreait.shopping.board.model.dto;

import com.koreait.shopping.board.model.entity.BoardProductEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardProductDto extends BoardProductEntity {
    private int isubcategory;
    private int iboard;
    private int color;
    private String size;
    private int itemNum;
}