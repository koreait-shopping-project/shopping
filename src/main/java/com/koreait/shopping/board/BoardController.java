package com.koreait.shopping.board;

import com.koreait.shopping.Const;
import com.koreait.shopping.ResultVo;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.dto.BoardProductListDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @GetMapping("/search")
    public List<BoardProductVo> searchProc(Model model, BoardProductDto dto) {
        model.addAttribute(Const.LIST, service.searchProductList(dto));
        return service.searchProductList(dto);
    }


    @GetMapping("write")
    public void write() {}

    @PostMapping("/write")
    public String writeProc(Model model , BoardListEntity entity) {
        int result = service.insBoard(entity);
        if (result != 1) {
            model.addAttribute(Const.MSG, Const.ERR_5);
            return "redirect:/board/write" + entity.getIcategory();
        }
        return "redirect:/board/list/" + entity.getIcategory();
    }

    @GetMapping("/mod")
    public String mod(BoardListVo vo, Model model) {
        model.addAttribute(Const.DATA, service.selBoard(vo));
        return "board/write";
    }

    @PostMapping("/mod")
    public String modProc(Model model, BoardListEntity entity) {
        int result = service.updBoard(entity);
        if (result != 1) {
            model.addAttribute(Const.MSG, Const.ERR_6);
            return "redirect:/board/detail?iboard=" + entity.getIboard();
        }
        return "redirect:/board/detail?iboard=" + entity.getIboard();
    }

    @GetMapping("/del")
    public String delProc(Model model, BoardListEntity entity) {
        int result = service.delBoard(entity);
        if (result != 1) {
            model.addAttribute(Const.MSG, Const.ERR_7);
            return "redirect:/board/detail?iboard=" + entity.getIboard();
        }
        return "redirect:/board/list/" + entity.getIcategory();
    }

    @GetMapping("/productdetail/{iboard}")
    public String detail(@PathVariable int iboard, Model model, BoardProductVo vo) {
        vo.setIboard(iboard);
        model.addAttribute(Const.IBOARD, iboard);
        //productdetail 제품 불러오기
        BoardProductEntity entity = service.selProductDetail(vo);
        model.addAttribute(Const.DETAIL, entity);

        //컬러, 사이즈 리스트 가져오기
        model.addAttribute(Const.DATA ,service.selDetailList(vo));
        return "board/productdetail";
    }

    @GetMapping("/product/{isubcategory}")
    public String subList(@PathVariable int isubcategory, Model model, BoardProductDto dto){
        model.addAttribute(Const.I_SUBCATEGORY, isubcategory);
        dto.setIsubcategory(isubcategory);
        model.addAttribute(Const.LIST, service.selProductList(dto));
        return "board/product";
    }

    @GetMapping("/size")
    @ResponseBody
    public Map<String, BoardProductVo> selSize(BoardProductVo vo) {
        HashMap<String, BoardProductVo> res = new HashMap<>();
        res.put(Const.RESULT, service.selSize(vo));
        return res;
    }

    @GetMapping("/purchase")
    public void purchase(){}

    @PostMapping("/purchase")
    public String purchaseProc(Model model, @ModelAttribute("BoardProductListDto") BoardProductListDto listDto) {
        System.out.println("리스트 사이즈 : " + listDto.getProductList().size());
        for(int i = 0; i < listDto.getProductList().size(); i++) {
            BoardProductVo vo = new BoardProductVo();
            vo.setColor(listDto.getProductList().get(i).getColor());
            vo.setItemNum(listDto.getProductList().get(i).getItemNum());
            vo.setIboard(listDto.getProductList().get(i).getIboard());
        System.out.println( i + "번째 리스트 사이즈 : " + listDto.getProductList().get(i).getColor());
        System.out.println( i  + "번째 컬러 값 " + listDto.getProductList().get(i).getColor());
        System.out.println( i  + "번째 iboard값 " + listDto.getProductList().get(i).getIboard());
        System.out.println( i  + "번째 수량 " + listDto.getProductList().get(i).getItemNum());

            System.out.println("담긴 컬러값 : " + vo.getColor());
            System.out.println("담긴 iboard값 : " + vo.getIboard());

            switch (listDto.getProductList().get(i).getSize()) {
                case "sm" :
                    vo.setSm(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 sm : " + vo.getSm());
                    service.updProductDetail(vo);
                    break;
                case "md" :
                    vo.setMd(listDto.getProductList().get(i).getItemNum());
                    service.updProductDetail(vo);
                    System.out.println("담긴 md : " + vo.getMd());
                    break;
                case "lg" :
                    vo.setLg(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 lg : " + vo.getLg());
                    service.updProductDetail(vo);
                    break;
                case "xl" :
                    vo.setXl(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 xl : " + vo.getXl());
                    service.updProductDetail(vo);
                    break;
            }
        }
        return "board/purchase";
    }

    @PostMapping("/cart")
    public String cartProc(Model model, @ModelAttribute("BoardProductListDto") BoardProductListDto listDto) {
        for(int i = 0; i < listDto.getProductList().size(); i++) {
            BoardProductVo vo = new BoardProductVo();
            vo.setColor(listDto.getProductList().get(i).getColor());
            vo.setItemNum(listDto.getProductList().get(i).getItemNum());
            vo.setIboard(listDto.getProductList().get(i).getIboard());

            switch (listDto.getProductList().get(i).getSize()) {
                case "sm" :
                    vo.setSm(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 sm : " + vo.getSm());
                    service.insCart(vo);
                    break;
                case "md" :
                    vo.setMd(listDto.getProductList().get(i).getItemNum());
                    service.insCart(vo);
                    System.out.println("담긴 md : " + vo.getMd());
                    break;
                case "lg" :
                    vo.setLg(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 lg : " + vo.getLg());
                    service.insCart(vo);
                    break;
                case "xl" :
                    vo.setXl(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 xl : " + vo.getXl());
                    service.insCart(vo);
                    break;
            }
        }
        return "board/list/4";
    }
}