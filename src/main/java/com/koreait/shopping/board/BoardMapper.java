package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.entity.BoardSubcategoryEntity;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface BoardMapper {
    List<BoardProductVo> selProductList(BoardProductDto dto);
    BoardProductEntity selProductDetail(BoardProductVo vo);
    List<BoardProductVo> selDetailList(BoardProductVo vo);
}