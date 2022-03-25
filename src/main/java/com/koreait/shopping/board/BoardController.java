package com.koreait.shopping.board;

import com.koreait.shopping.Const;
import com.koreait.shopping.Paging.BoardCriteria;
import com.koreait.shopping.Paging.Criteria;
import com.koreait.shopping.Paging.dto.BoardPageMakerDto;
import com.koreait.shopping.Paging.dto.PageMakerDto;
import com.koreait.shopping.UserUtils;
import com.koreait.shopping.board.like.BoardLikeService;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.dto.BoardProductListDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.entity.UserEntity;
import com.koreait.shopping.user.model.vo.UserReviewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService service;

    @Autowired
    private BoardLikeService likeService;

    @Autowired
    private UserUtils utils;

    //메인메뉴
    @GetMapping("/main")
    public void main() {
    }

    //게시판 카테고리
    @GetMapping("/list/{icategory}")
    public String list(@PathVariable int icategory, Model model, BoardCriteria cri, UserEntity entity) {
        model.addAttribute(Const.I_CATEGORY, icategory);
        model.addAttribute(Const.LIST, service.selBoardList(cri));
        cri.setIcategory(icategory);
        int total = service.getBoardTotal(cri);

        if (cri.getSearchType() != 0) {
            model.addAttribute(Const.LIST, service.searchBoardList(cri));
            model.addAttribute(Const.SEARCH_TYPE, cri.getSearchType());
            model.addAttribute(Const.SEARCH_TEXT, cri.getSearchText());
            total = service.getSearchTotal(cri);
        } else {
            model.addAttribute(Const.LIST, service.selBoardList(cri));
        }

        if (icategory == 3) {
            entity.setIuser(utils.getLoginUserPk());
            model.addAttribute(Const.CART, service.selCart(entity));
        }

        if (icategory == 4) {
            model.addAttribute(Const.REVIEW, service.selReview());
        }

        BoardPageMakerDto pageMake = new BoardPageMakerDto(cri, total);
        model.addAttribute("pageMaker", pageMake);

        return "board/list";
    }

    //게시판 글목록
    @GetMapping("/detail")
    public void detail(BoardListDto dto, Model model) {
        BoardListVo vo = service.selBoard(dto);
        model.addAttribute(Const.DATA, vo);
        model.addAttribute(Const.PREV_NEXT, service.selPrevNext(vo));
    }

    //검색창
    @GetMapping("/prsearch")
    public List<BoardProductVo> searchProc(Model model, Criteria cri) {
        model.addAttribute(Const.LIST, service.searchProductList(cri));
        model.addAttribute(Const.TITLE, cri.getTitle());
        int total = service.getPrSearchTotal(cri);
        List<Integer> likeList = new ArrayList();
        for (BoardProductEntity list : service.searchProductList(cri)) {
            likeList.add(likeService.selBoardLikeNum(list.getIboard()));
        }
        model.addAttribute(Const.LIKE, likeList);
        PageMakerDto pageMake = new PageMakerDto(cri, total);
        model.addAttribute("pageMaker", pageMake);

        return service.searchProductList(cri);
    }

    //게시판 글쓰기
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

    //글 수정
    @GetMapping("/mod")
    public String mod(BoardListDto dto, Model model) {
        model.addAttribute(Const.DATA, service.selBoard(dto));
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

    @PostMapping("/editor")
    @ResponseBody
    public Map<String, String> receiveImage(@RequestPart("upload") MultipartFile file, HttpServletRequest request) {
        return service.ckEditorUploadImage(file, request);
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

    //상품 카테고리
    @GetMapping("/product/{isubcategory}")
    public String subList(@PathVariable int isubcategory, Model model, Criteria cri) {
        model.addAttribute(Const.I_SUBCATEGORY, isubcategory);
        cri.setIsubcategory(isubcategory);
        model.addAttribute(Const.LIST, service.selProductList(cri));

        List<Integer> likeList = new ArrayList();
        for (BoardProductEntity list : service.selProductList(cri)) {
            likeList.add(likeService.selBoardLikeNum(list.getIboard()));
        }
        model.addAttribute(Const.LIKE, likeList);

        int total = service.getTotal(isubcategory);
        PageMakerDto pageMake = new PageMakerDto(cri, total);
        model.addAttribute("pageMaker", pageMake);

        return "board/product";
    }

    //개별 상품
    @GetMapping("/productdetail/{iboard}")
    public String detail(@PathVariable int iboard, Model model, BoardProductVo vo, UserReviewVo vo2) {
        vo.setIboard(iboard);
        model.addAttribute(Const.IBOARD, iboard);
        model.addAttribute(Const.IUSER, utils.getLoginUserPk());
        //productdetail 제품 불러오기
        BoardProductEntity entity = service.selProductDetail(vo);
        model.addAttribute(Const.DETAIL, entity);

        //컬러, 사이즈 리스트 가져오기
        model.addAttribute(Const.DATA, service.selDetailList(vo));

        //리뷰
        vo2.setIboard(vo.getIboard());
        model.addAttribute(Const.REVIEW, service.selBoardReview(vo2));

        return "board/productdetail";
    }

    //개별 상품 색상별 사이즈 선택 Ajax
    @GetMapping("/size")
    @ResponseBody
    public Map<String, BoardProductVo> selSize(BoardProductVo vo) {
        HashMap<String, BoardProductVo> res = new HashMap<>();
        res.put(Const.RESULT, service.selSize(vo));
        return res;
    }

    //카트창
    @GetMapping("/cart")
    public void cart() {
    }

    //카트 상품 추가
    @PostMapping("/cart")
    public String cartProc(BoardProductListDto listDto) {
        for (int i = 0; i < listDto.getProductList().size(); i++) {
            BoardProductVo vo = new BoardProductVo();
            vo.setColor(listDto.getProductList().get(i).getColor());
            vo.setItemNum(listDto.getProductList().get(i).getItemNum());
            vo.setIboard(listDto.getProductList().get(i).getIboard());
            vo.setIuser(utils.getLoginUserPk());
            vo.setIdetail(service.selIdetail(vo).getIdetail());


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

    //카트
    @PostMapping("/order")
    public String orderProc(BoardProductListDto listDto) {
        for (int i = 0; i < listDto.getProductList().size(); i++) {
            BoardProductVo vo = new BoardProductVo();
            vo.setColor(listDto.getProductList().get(i).getColor());
            vo.setItemNum(listDto.getProductList().get(i).getItemNum());
            vo.setIboard(listDto.getProductList().get(i).getIboard());
            vo.setIuser(utils.getLoginUserPk());
            vo.setIdetail(service.selIdetail(vo).getIdetail());

            switch (listDto.getProductList().get(i).getSize()) {
                case "sm":
                    vo.setSm(listDto.getProductList().get(i).getItemNum());
                    service.insCartChecked(vo);
                    break;
                case "md":
                    vo.setMd(listDto.getProductList().get(i).getItemNum());
                    service.insCartChecked(vo);
                    break;
                case "lg":
                    vo.setLg(listDto.getProductList().get(i).getItemNum());
                    service.insCartChecked(vo);
                    break;
                case "xl":
                    vo.setXl(listDto.getProductList().get(i).getItemNum());
                    service.insCartChecked(vo);
                    break;
            }
        }
        return "redirect:/user/order";
    }
    //카트 삭제
    @DeleteMapping("/cart/{icart}")
    @ResponseBody
    public Map<String, Integer> delCart(@PathVariable String icart) {
        Map<String, Integer> result = new HashMap<>();
        String[] icartArr = icart.split("_");
        if(icartArr != null && icartArr.length>0){
            for(int i=0 ; i<icartArr.length ; i++){
                service.delCart(Integer.parseInt(icartArr[i]));
            }
            result.put(Const.RESULT, 1);
        }
        return result;
    }
    //카트 수량 증가
    @PutMapping("/pCart")
    @ResponseBody
    public Map<String, Integer> updCartUp(@RequestBody BoardProductVo vo) {
        Map<String, Integer> result = new HashMap<>();
        switch (vo.getSize()) {
            case "sm":
                vo.setSm(1);
                result.put(Const.RESULT, service.updCartUp(vo));
                return result;
            case "md":
                vo.setMd(1);
                result.put(Const.RESULT, service.updCartUp(vo));
                return result;
            case "lg":
                vo.setLg(1);
                result.put(Const.RESULT, service.updCartUp(vo));
                return result;
            case "xl":
                vo.setXl(1);
                result.put(Const.RESULT, service.updCartUp(vo));
                return result;
        }
        return null;
    }
    //카트 수량 감소
    @PutMapping("/dCart")
    @ResponseBody
    public Map<String, Integer> updCartDown(@RequestBody BoardProductVo vo) {
        Map<String, Integer> result = new HashMap<>();
        switch (vo.getSize()) {
            case "sm":
                vo.setSm(1);
                result.put(Const.RESULT, service.updCartDown(vo));
                return result;
            case "md":
                vo.setMd(1);
                result.put(Const.RESULT, service.updCartDown(vo));
                return result;
            case "lg":
                vo.setLg(1);
                result.put(Const.RESULT, service.updCartDown(vo));
                return result;
            case "xl":
                vo.setXl(1);
                result.put(Const.RESULT, service.updCartDown(vo));
                return result;
        }
        return null;
    }

    //카트 체크 1 업데이트() 바로구매시 카트 추가하면서 체크 속성부여해서 구매페이지로 이동하도록
    @PutMapping("/selected/{icart}")
    @ResponseBody
    public Map<String, Integer> order(@PathVariable String icart) {
        Map<String, Integer> result = new HashMap<>();
        String[] icartArr = icart.split("_");
        if(icartArr != null && icartArr.length>0){
            for(int i=0 ; i<icartArr.length ; i++){
                service.selectedCart(Integer.parseInt(icartArr[i]));
            }
            result.put(Const.RESULT, 1);
        }
        return result;
    }
    //카트 체크 0 업데이트() 외부페이지 이동 시 체크 속성 풀리도록
    @PutMapping("/unselected/{icart}")
    @ResponseBody
    public Map<String, Integer> unchecked(@PathVariable String icart) {
        Map<String, Integer> result = new HashMap<>();
        String[] icartArr = icart.split("_");
        if(icartArr != null && icartArr.length>0){
            for(int i=0 ; i<icartArr.length ; i++){
                service.unselectedCart(Integer.parseInt(icartArr[i]));
            }
            result.put(Const.RESULT, 1);
        }
        return result;
    }
}