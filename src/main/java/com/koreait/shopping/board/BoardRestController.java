package com.koreait.shopping.board;

import com.koreait.shopping.model.dto.ProductDto;
import com.koreait.shopping.model.vo.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/ajax/board")
public class BoardRestController {
    @Autowired private BoardService service;

    @GetMapping("/{isubcategory}")
    public List<ProductVo> selProductListRecord(@PathVariable int isubcategory, ProductDto dto){
        dto.setIsubcategory(isubcategory);
        return service.selProductListRecord(dto);
    }
}
