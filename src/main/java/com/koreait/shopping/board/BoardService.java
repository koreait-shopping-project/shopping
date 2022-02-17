package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.entity.BoardSubcategoryEntity;
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

    public BoardProductEntity selProductDetail(BoardProductVo vo) {
        return mapper.selProductDetail(vo);
    }

    public List<BoardProductVo> selDetailList(BoardProductVo vo) { return mapper.selDetailList(vo); }
}