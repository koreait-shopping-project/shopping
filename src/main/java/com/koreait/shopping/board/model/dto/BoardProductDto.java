package com.koreait.shopping.board.model.dto;

import com.koreait.shopping.board.model.entity.BoardProductEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Getter
@Setter
@ToString
public class BoardProductDto extends BoardProductEntity implements Serializable {
    private int isubcategory;
    private int iboard;
    private int color;
    private String size;
    private int itemNum;
}