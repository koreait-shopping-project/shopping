package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.entity.BoardSubcategoryEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardProductVo> selProductList(BoardProductDto dto);
    BoardProductVo selProductDetail(BoardProductVo vo);
    List<BoardProductVo> selDetailList(BoardProductVo vo);
    List<BoardListVo> selBoardList(BoardListDto dto);
    BoardProductVo selSize(BoardProductVo vo);
    int insBoard(BoardListEntity entity);
    BoardListVo selBoard(BoardListVo vo);
    int updBoard(BoardListEntity entity);
    int delBoard(BoardListEntity entity);
}