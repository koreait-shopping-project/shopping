package com.koreait.shopping.board.model.dto;

import com.koreait.shopping.board.model.entity.BoardListEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardListDto extends BoardListEntity{
    private int searchType;
    private String writerNm;
}
