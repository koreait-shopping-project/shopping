package com.koreait.shopping.board.model.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class BoardProductListDto {
    private List<BoardProductDto> productList;
}
