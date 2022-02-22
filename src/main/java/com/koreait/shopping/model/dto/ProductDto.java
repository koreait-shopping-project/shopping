package com.koreait.shopping.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDto {
    private int iboard;
    private int isubcategory;
    private int recordCount;
    private int currentPage;
    private int startIdx;
}
