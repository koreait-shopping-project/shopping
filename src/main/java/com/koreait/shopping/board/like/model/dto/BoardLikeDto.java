package com.koreait.shopping.board.like.model.dto;

import com.koreait.shopping.board.like.model.entity.BoardLikeEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class BoardLikeDto extends BoardLikeEntity {
    private List<BoardLikeEntity> list;
}
