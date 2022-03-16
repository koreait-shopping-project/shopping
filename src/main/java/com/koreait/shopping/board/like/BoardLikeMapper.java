package com.koreait.shopping.board.like;

import com.koreait.shopping.board.like.model.entity.BoardLikeEntity;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface BoardLikeMapper {
    int insBoardLike(BoardLikeEntity entity);
    BoardLikeEntity selBoardLike(BoardLikeEntity entity);
    int delBoardLike(BoardLikeEntity entity);
    int selBoardLikeNum(int iboard);
}
