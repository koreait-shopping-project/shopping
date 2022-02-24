package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardPrevNextVo;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    //subcategory
    List<BoardProductVo> selProductList(BoardProductDto dto);
    BoardProductVo selProductDetail(BoardProductVo vo);
    BoardProductVo selSize(BoardProductVo vo);
    //category
    List<BoardProductVo> selDetailList(BoardProductVo vo);
    List<BoardListVo> selBoardList(BoardListDto dto);
    BoardListVo selBoardDetail(BoardListVo vo);
    int updProductDetail(BoardProductVo vo);
    int insCart(BoardProductVo vo);
    int insBoard(BoardListEntity entity);
    int updBoard(BoardListEntity entity);
    int delBoard(BoardListEntity entity);
    BoardPrevNextVo selPrevNext(BoardListVo vo);
    List<BoardProductVo> searchProductList(BoardProductEntity entity);
    List<BoardListVo> searchBoardList(BoardListDto dto);
}