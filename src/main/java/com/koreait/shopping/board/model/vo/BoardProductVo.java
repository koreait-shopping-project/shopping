package com.koreait.shopping.board.model.vo;

import com.koreait.shopping.board.model.entity.BoardProductEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardProductVo extends BoardProductEntity {
    private int isubcategory;
    private String subcategorynm;
    private int color;
    private int sm;
    private int md;
    private int lg;
    private int xl;
}
