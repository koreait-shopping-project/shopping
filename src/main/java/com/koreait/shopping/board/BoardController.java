package com.koreait.shopping.board;

import com.koreait.shopping.Const;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired private BoardService service;

    @GetMapping("/main")
    public void main(){}

    @GetMapping("/list/{icategory}")
    public String list(@PathVariable int icategory, Model model, BoardListDto dto){
        model.addAttribute(Const.I_CATEGORY, icategory);
        model.addAttribute(Const.LIST, service.selBoardList(dto));
        dto.setIcategory(icategory);
        return "board/list";
    }

    @GetMapping("/detail")
    public void detail(Model model, BoardListVo vo) {
        model.addAttribute(Const.DATA, service.selBoard(vo));
    }

    @GetMapping("write")
    public void write() {}

    @PostMapping("/write")
    public String writeProc(BoardListEntity entity) {
        int result = service.insBoard(entity);
        switch (result) {
            case 0:
                break;
            case 1:
                break;
        }
        return "redirect:/board/list/" + entity.getIcategory();
    }

    @GetMapping("/mod")
    public String mod(BoardListVo vo, Model model) {
        model.addAttribute(Const.DATA, service.selBoard(vo));
        return "board/write";
    }

    @PostMapping("/mod")
    public String modProc(BoardListEntity entity) {
        int result = service.updBoard(entity);
        return "redirect:/board/detail?iboard=" + entity.getIboard();
    }

    @GetMapping("/del")
    public String delProc(BoardListEntity entity) {
        int result = service.delBoard(entity);
        return "redirect:/board/list/" + entity.getIcategory();
    }

    @GetMapping("/productdetail/{iboard}")
    public String detail(@PathVariable int iboard, Model model, BoardProductVo vo) {
        vo.setIboard(iboard);
        model.addAttribute(Const.IBOARD, iboard);
        BoardProductEntity entity = service.selProductDetail(vo);
        model.addAttribute(Const.DETAIL, entity);
        model.addAttribute(Const.COLOR ,service.selDetailList(vo));
        return "board/productdetail";
    }

    @GetMapping("/product/{isubcategory}")
    public String subList(@PathVariable int isubcategory, Model model, BoardProductDto dto){
        model.addAttribute(Const.I_SUBCATEGORY, isubcategory);
        dto.setIsubcategory(isubcategory);
        model.addAttribute(Const.LIST, service.selProductList(dto));
        return "board/product";
    }
}