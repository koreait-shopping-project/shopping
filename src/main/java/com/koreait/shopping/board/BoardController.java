package com.koreait.shopping.board;

import com.koreait.shopping.Const;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.entity.BoardSubcategoryEntity;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired private BoardService service;

    @GetMapping("/main")
    public void main(){}

    @GetMapping("/productdetail/{iboard}")
    public String detail(@PathVariable int iboard, Model model, BoardProductVo vo) {
        vo.setIboard(iboard);
        model.addAttribute(Const.IBOARD, iboard);
        BoardProductEntity entity = service.selProductDetail(vo);
        model.addAttribute(Const.DETAIL, entity);
        model.addAttribute(Const.COLOR ,service.selDetailList(vo));
        return "board/productdetail";
    }

    @GetMapping("/list/{icategory}")
    public String list(@PathVariable int icategory, Model model){
        model.addAttribute(Const.I_CATEGORY, icategory);
        return "board/list";
    }

    @GetMapping("/product/{isubcategory}")
    public String subList(@PathVariable int isubcategory, Model model, BoardSubcategoryEntity entity){
        model.addAttribute(Const.ISUBCATEGORY, isubcategory);
        entity.setIsubcategory(isubcategory);
        model.addAttribute(Const.LIST, service.selProductList(entity));
        return "board/product";
    }
}