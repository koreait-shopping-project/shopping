package com.koreait.shopping.board;

import com.koreait.shopping.board.model.dto.ProductDto;
import com.koreait.shopping.board.model.vo.ProductVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface BoardMapper {
    List<ProductVo> selProductList(ProductDto dto);
    ProductVo selProductDetail(ProductDto dto);
}
