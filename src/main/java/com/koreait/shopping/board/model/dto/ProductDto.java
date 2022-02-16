package com.koreait.shopping.board.model.dto;

import com.koreait.shopping.board.model.entity.ProductEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDto extends ProductEntity {
    private int isubcategory;
    private String subcategorynm;
}