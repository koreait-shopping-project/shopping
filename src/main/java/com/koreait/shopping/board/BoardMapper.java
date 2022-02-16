package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface BoardMapper {
    List<BoardProductVo> selProductList(BoardProductDto dto);
    BoardProductVo selProductDetail(BoardProductDto dto);
}