package com.koreait.shopping.board;

import com.koreait.shopping.Const;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired private BoardService service;

    @GetMapping("/main")
    public void main(){}

    @GetMapping("/detail/{iboard}")
    public String detail(@PathVariable int iboard, Model model, BoardProductDto dto) {
        model.addAttribute("iboard", iboard);
        dto.setIboard(iboard);
        BoardProductVo vo = service.selProductDetail(dto);
        model.addAttribute(Const.DETAIL, vo);
        return "board/detail";
    }

    @GetMapping("/list/{icategory}")
    public String list(@PathVariable int icategory, Model model, BoardProductDto dto){
        model.addAttribute(Const.I_CATEGORY, icategory);
        return "board/list";
    }

    @GetMapping("/product/{isubcategory}")
    public String subList(@PathVariable int isubcategory, Model model, BoardProductDto dto){
        model.addAttribute("isubcategory", isubcategory);
        dto.setIsubcategory(isubcategory);
        model.addAttribute(Const.LIST, service.selProductList(dto));
        return "board/product";
    }
}