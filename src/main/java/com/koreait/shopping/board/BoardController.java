package com.koreait.shopping.board;

import com.koreait.shopping.Const;
import com.koreait.shopping.model.dto.BoardDto;
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

    @GetMapping("/list")
    public void list(){}

    @GetMapping("/{icategory}")
    public String list(@PathVariable int icategory, Model model, BoardDto dto){
        model.addAttribute(Const.I_CATEGORY, icategory);
        return "redirect:/board/list";
    }
    @GetMapping("/product/{isubcategory}")
    public String subList(@PathVariable int isubcategory, Model model){
        model.addAttribute("isubcategory", isubcategory);
        return "redirect:/product";
    }
}
