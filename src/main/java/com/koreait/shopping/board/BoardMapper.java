package com.koreait.shopping.board;

import com.koreait.shopping.model.dto.BoardDto;
import com.koreait.shopping.model.vo.BoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface BoardMapper {
    List<BoardVo> selBoardList(BoardDto dto);
}
