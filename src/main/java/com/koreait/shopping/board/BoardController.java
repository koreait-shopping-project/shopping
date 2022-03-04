package com.koreait.shopping.board;

import com.koreait.shopping.Const;
import com.koreait.shopping.Paging.Criteria;
import com.koreait.shopping.Paging.PageMakerDto;
import com.koreait.shopping.ResultVo;
import com.koreait.shopping.UserUtils;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductDto;
import com.koreait.shopping.board.model.dto.BoardProductListDto;
import com.koreait.shopping.board.model.entity.BoardCmtEntity;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService service;

    @Autowired
    private UserUtils utils;

    @GetMapping("/main")
    public void main() {
    }

    @GetMapping("/list/{icategory}")
    public String list(@PathVariable int icategory, Model model, BoardListDto dto, HttpServletRequest request, UserEntity entity) {
        model.addAttribute(Const.I_CATEGORY, icategory);
        model.addAttribute(Const.LIST, service.selBoardList(dto));
        dto.setIcategory(icategory);
        if (dto.getSearchType() != 0) {
            model.addAttribute(Const.LIST, service.searchBoardList(dto));
            model.addAttribute(Const.SEARCH_TYPE, dto.getSearchType());
            System.out.println("writerNm : " + dto.getWriterNm());
        } else {
            model.addAttribute(Const.LIST, service.selBoardList(dto));
        }

        if (icategory == 3) {
            entity.setIuser(utils.getLoginUserPk());
            System.out.println(utils.getLoginUserPk());
            model.addAttribute(Const.CART, service.selCart(entity));
        }

        return "board/list";
    }

    @GetMapping("/detail")
    public void detail(Model model, BoardListVo vo) {
        model.addAttribute(Const.DATA, service.selBoard(vo));
    }

    @GetMapping("/prsearch")
    public List<BoardProductVo> searchProc(Model model, BoardProductDto dto) {
        model.addAttribute(Const.LIST, service.searchProductList(dto));
        return service.searchProductList(dto);
    }


    @GetMapping("write")
    public void write() {
    }

    @PostMapping("/write")
    public String writeProc(Model model, BoardListEntity entity) {
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
        model.addAttribute(Const.DATA, service.selDetailList(vo));
        return "board/productdetail";
    }

    @GetMapping("/product/{isubcategory}")
    public String subList(@PathVariable int isubcategory, Model model, BoardProductDto dto, Criteria cri) {
        model.addAttribute(Const.I_SUBCATEGORY, isubcategory);
        dto.setIsubcategory(isubcategory);
        model.addAttribute(Const.LIST, service.selProductList(cri));

        int total = service.getTotal(isubcategory);
        PageMakerDto pageMake = new PageMakerDto(cri, total);
        model.addAttribute("pageMaker", pageMake);

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
    public void purchase() {
    }

    @PostMapping("/purchase")
    public String purchaseProc(@ModelAttribute("BoardProductListDto") BoardProductListDto listDto) {
//        System.out.println("바로구매로 이동했습니다");
//        System.out.println("리스트 사이즈 : " + listDto.getProductList().size());
        for (int i = 0; i < listDto.getProductList().size(); i++) {
            BoardProductVo vo = new BoardProductVo();
            vo.setColor(listDto.getProductList().get(i).getColor());
            vo.setItemNum(listDto.getProductList().get(i).getItemNum());
            vo.setIboard(listDto.getProductList().get(i).getIboard());
//            System.out.println(i + "번째 리스트 사이즈 : " + listDto.getProductList().get(i).getColor());
//            System.out.println(i + "번째 컬러 값 " + listDto.getProductList().get(i).getColor());
//            System.out.println(i + "번째 iboard값 " + listDto.getProductList().get(i).getIboard());
//            System.out.println(i + "번째 수량 " + listDto.getProductList().get(i).getItemNum());
//
//            System.out.println("담긴 컬러값 : " + vo.getColor());
//            System.out.println("담긴 iboard값 : " + vo.getIboard());

            switch (listDto.getProductList().get(i).getSize()) {
                case "sm":
                    vo.setSm(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 sm : " + vo.getSm());
                    service.updProductDetail(vo);
                    break;
                case "md":
                    vo.setMd(listDto.getProductList().get(i).getItemNum());
                    service.updProductDetail(vo);
                    System.out.println("담긴 md : " + vo.getMd());
                    break;
                case "lg":
                    vo.setLg(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 lg : " + vo.getLg());
                    service.updProductDetail(vo);
                    break;
                case "xl":
                    vo.setXl(listDto.getProductList().get(i).getItemNum());
                    System.out.println("담긴 xl : " + vo.getXl());
                    service.updProductDetail(vo);
                    break;
            }
        }
        return "board/purchase";
    }

    @GetMapping("/cart")
    public void cart() {
    }

    @PostMapping("/cart")
    public String cartProc(@ModelAttribute("BoardProductListDto") BoardProductListDto listDto, HttpServletRequest request) {
        System.out.println("카트로 이동했습니다");
        for (int i = 0; i < listDto.getProductList().size(); i++) {
            BoardProductVo vo = new BoardProductVo();
            vo.setColor(listDto.getProductList().get(i).getColor());
            vo.setItemNum(listDto.getProductList().get(i).getItemNum());
            vo.setIboard(listDto.getProductList().get(i).getIboard());
            vo.setUid(request.getParameter("uid"));

            switch (listDto.getProductList().get(i).getSize()) {
                case "sm":
                    vo.setSm(listDto.getProductList().get(i).getItemNum());
                    service.insCart(vo);
                    break;
                case "md":
                    vo.setMd(listDto.getProductList().get(i).getItemNum());
                    service.insCart(vo);
                    break;
                case "lg":
                    vo.setLg(listDto.getProductList().get(i).getItemNum());
                    service.insCart(vo);
                    break;
                case "xl":
                    vo.setXl(listDto.getProductList().get(i).getItemNum());
                    service.insCart(vo);
                    break;
            }
        }
        return "board/main";
    }

    @DeleteMapping("/cart/{icart}")
    public Map<String, Integer> delCart(@PathVariable String icart) {
        Map<String, Integer> result = new HashMap<>();
        String[] userArr = icart.split("_");
        if(userArr != null && userArr.length>0){
            for(int i=0 ; i<userArr.length ; i++){
                service.delCart(Integer.parseInt(userArr[i]));
            }
            result.put(Const.RESULT, 1);
        }
        return result;
    }

    @PostMapping("/pCart")
    public Map<String, Integer> updCartUp(@RequestBody BoardProductVo vo) {
        Map<String, Integer> result = new HashMap<>();
        switch (vo.getSize()) {
            case "sm":
                vo.setSm(1);
                result.put(Const.RESULT, service.updCartUp(vo));
                break;
            case "md":
                vo.setMd(1);
                result.put(Const.RESULT, service.updCartUp(vo));
                break;
            case "lg":
                vo.setLg(1);
                result.put(Const.RESULT, service.updCartUp(vo));
                break;
            case "xl":
                vo.setXl(1);
                result.put(Const.RESULT, service.updCartUp(vo));
                break;
        }
        return result;
    }

    @PostMapping("/dCart")
    public Map<String, Integer> updCartDown(@RequestBody BoardProductVo vo) {
        Map<String, Integer> result = new HashMap<>();
        switch (vo.getSize()) {
            case "sm":
                vo.setSm(1);
                result.put(Const.RESULT, service.updCartDown(vo));
                break;
            case "md":
                vo.setMd(1);
                result.put(Const.RESULT, service.updCartDown(vo));
                break;
            case "lg":
                vo.setLg(1);
                result.put(Const.RESULT, service.updCartDown(vo));
                break;
            case "xl":
                vo.setXl(1);
                result.put(Const.RESULT, service.updCartDown(vo));
                break;
        }
        return result;
    }
}