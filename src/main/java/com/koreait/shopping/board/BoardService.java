package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BoardService {
    @Autowired
    private BoardMapper mapper;

    public List<BoardProductVo> selProductList(BoardProductDto dto) {
        return mapper.selProductList(dto);
    }

    public BoardProductVo selProductDetail(BoardProductDto dto) {
        return mapper.selProductDetail(dto);
    }

    public BoardProductVo selColor(BoardProductDto dto) { return mapper.selColor(dto); }
}