package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.ProductDto;
import com.koreait.shopping.board.model.vo.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BoardService {
    @Autowired
    private BoardMapper mapper;

    public List<ProductVo> selProductList(ProductDto dto) {
        return mapper.selProductList(dto);
    }

    public ProductVo selProductDetail(ProductDto dto) {
        return mapper.selProductDetail(dto);
    }
}