package com.koreait.shopping.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class BoardProductListDto {
    private List<BoardProductDto> productList;
}
