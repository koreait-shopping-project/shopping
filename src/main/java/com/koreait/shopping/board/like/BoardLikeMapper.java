package com.koreait.shopping.board.like;

import com.koreait.shopping.board.model.entity.BoardLikeEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface BoardLikeMapper {
    int insBoardLike(BoardLikeEntity entity);
    BoardLikeEntity selBoardLike(BoardLikeEntity entity);
    int delBoardLike(BoardLikeEntity entity);
    int selBoardLikeNum(int iboard);
}
