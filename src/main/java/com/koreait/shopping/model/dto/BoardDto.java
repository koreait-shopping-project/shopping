package com.koreait.shopping.model.dto;

import com.koreait.shopping.model.entity.BoardEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDto extends BoardEntity {
    private int isubcategory;
    private String subcategorynm;
}