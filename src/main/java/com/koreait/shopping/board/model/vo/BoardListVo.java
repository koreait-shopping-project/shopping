package com.koreait.shopping.board.model.vo;

import com.koreait.shopping.board.model.entity.BoardListEntity;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardListVo extends BoardListEntity {
    private String writerNm;
}
