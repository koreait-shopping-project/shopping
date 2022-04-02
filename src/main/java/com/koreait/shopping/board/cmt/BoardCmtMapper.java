package com.koreait.shopping.board.cmt;

import com.koreait.shopping.board.cmt.model.entity.BoardCmtEntity;
import com.koreait.shopping.board.cmt.model.vo.BoardCmtVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardCmtMapper {
    int insBoardCmt(BoardCmtEntity entity);
    List<BoardCmtVo> selBoardCmtList(BoardCmtEntity entity);
    int updBoardCmt(BoardCmtEntity entity);
    int delBoardCmt(BoardCmtEntity entity);
}