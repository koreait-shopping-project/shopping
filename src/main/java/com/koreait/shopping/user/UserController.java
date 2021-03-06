package com.koreait.shopping.user;

import com.koreait.shopping.Const;

import com.koreait.shopping.UserUtils;

import com.koreait.shopping.board.BoardService;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.dto.UserDto;
import com.koreait.shopping.user.model.entity.UserEntity;
import com.koreait.shopping.user.model.entity.UserOrderEntity;
import com.koreait.shopping.user.model.entity.UserPurchasedEntity;
import com.koreait.shopping.user.model.dto.UserReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired private UserService service;
    @Autowired private BoardService boardService;
    @Autowired private UserUtils utils;

    @GetMapping("/login")
    public void login(){}

    @GetMapping("/logout")
    public String logout(HttpSession hs){
        hs.invalidate();
        return "redirect:/user/login";
    }

    @PostMapping("/login")
    public String loginProc(UserEntity entity, RedirectAttributes reAttr) {
        int result = service.login(entity);
        if(result != 1){
            reAttr.addFlashAttribute(Const.TRY_LOGIN, entity);
            switch(result){
                case 0:
                    reAttr.addFlashAttribute(Const.MSG, Const.ERR_A);
                    break;
                case 2:
                    reAttr.addFlashAttribute(Const.MSG, Const.ERR_ID);
                    break;
                case 3:
                    reAttr.addFlashAttribute(Const.MSG, Const.ERR_PW);
                    break;
            }
            return "redirect:/user/login";
        }
        return "redirect:/board/main";
    }

    @GetMapping("loginSocial")
    @ResponseBody
    public Map<String, Integer> loginSocial(UserEntity entity, RedirectAttributes reAttr) {
        Map<String, Integer> res = new HashMap<>();
        res.put("result", service.loginSocial(entity));
        return res;
    }

    @GetMapping("/join")
    public void join(){}

    //?????? ???????????? ????????? ????????????
    @GetMapping("/selSocial")
    @ResponseBody
    public Map<String, Integer> selSocial(UserEntity entity) {
        Map<String, Integer> res = new HashMap<>();
        res.put("result", service.selSocial(entity));
        return res;
    }

    @PostMapping("/join")
    public String joinProc(UserEntity entity, RedirectAttributes reAttr) {
        int result = service.join(entity);
        if (result == 0) {
            reAttr.addFlashAttribute(Const.MSG, Const.ERR_4);
            return "redirect:/user/join";
        } else if (!entity.getSocial().equals("general")) {
            service.loginSocial(entity);
        }
        //???????????? ???????????? ????????? ????????? ?????????
        return "redirect:/";
    }

    //????????? ?????? ??????
    @GetMapping("/idChk/{uid}")//@PathVariable ??????????????? ?????? ??????
    @ResponseBody//return ??? Json ?????? ??????, ???????????? RequestBody
    public Map<String, Integer> idChk(@PathVariable String uid) {
        Map<String, Integer> res = new HashMap<>();
        res.put("result", service.idChk(uid));
        return res;
        // {"result" : 1} ???????????? Json ????????? ??????
    }
    //????????? ?????? ??????
    @GetMapping("/emailChk")//@PathVariable ??????????????? ?????? ??????
    @ResponseBody//return ??? Json ?????? ??????, ???????????? RequestBody
    public Map<String, Integer> emailChk(UserEntity entity) {
        Map<String, Integer> res = new HashMap<>();
        res.put("result", service.emailChk(entity));
        return res;
        // {"result" : 1} ???????????? Json ????????? ??????
    }

    //?????? ?????? ??????
    @GetMapping("/modify")
    public void modify() { }

    @PostMapping("/modify")
    public String modifyProc(UserDto dto, RedirectAttributes rAttr) {
        int result = service.modify(dto);
        if(result != 1) {
            switch(result) {
                case 0:
                    rAttr.addFlashAttribute(Const.MSG, "???????????? ????????? ?????????????????????.");
                    break;
                case 2:
                    rAttr.addFlashAttribute(Const.MSG, "?????? ??????????????? ????????? ?????????.");
                    break;
            }
            return "redirect:/user/modify";
        }
        return "redirect:/board/main";
    }

    //???????????? ??????(?????? ?????? ?????? ??????)
    @GetMapping("/checkpw")
    public void checkpw() {}

    //???????????? ??????
    @PostMapping("/checkpw")
    public String checkpwProc(UserEntity entity, RedirectAttributes reAttr) {
        int result = service.checkpw(entity);
        if (result != 1) {
            reAttr.addFlashAttribute(Const.TRY_CHECK, entity);
            switch(result){
                case 0:
                    reAttr.addFlashAttribute(Const.MSG, Const.ERR_A);
                    return "redirect:/user/login";//?????? ?????? ????????? ????????? ????????? ??????
                case 2:
                    reAttr.addFlashAttribute(Const.MSG, Const.ERR_PW);
                    break;
            }
            return "redirect:/user/checkpw";
        }
        return "redirect:/user/modify";
    }

    //?????? ?????????
    @GetMapping("/mypage")
    public void mypage() {}

    @GetMapping("/review")
    public void review(UserReviewDto dto, Model model) {
        model.addAttribute(Const.IBOARD, dto.getIboard());
        model.addAttribute(Const.IDETAIL, dto.getIdetail());
        model.addAttribute(Const.IPURCHASED, dto.getIpurchased());
        model.addAttribute(Const.LIST, service.selPurchased(dto));
    }

    @GetMapping("/selReview")
    @ResponseBody
    public Map<String, Integer> selReview(UserReviewDto dto) {
        Map<String, Integer> res = new HashMap<>();
        res.put("result", service.selReview(dto));
        return res;
    }

    @PostMapping("/review")
    public String reviewProc(UserReviewDto dto, RedirectAttributes reAttr) {
        int result = service.review(dto);
        if (result == 0) {
            reAttr.addFlashAttribute(Const.MSG, Const.ERR_8);
        }
        return "redirect:/user/mypage";
    }


    //???????????? checked ??? ?????? select
    @GetMapping("/order")
    public void order(Model model, UserEntity entity) {
        entity.setIuser(utils.getLoginUserPk());
        model.addAttribute(Const.CHECKED, service.checkedCart(entity));
        int cost = 0;
        for(int i = 0; i < service.checkedCart(entity).size(); i++) {
            cost += service.checkedCart(entity).get(i).getPrice() * service.checkedCart(entity).get(i).getSm();
            cost += service.checkedCart(entity).get(i).getPrice() * service.checkedCart(entity).get(i).getMd();
            cost += service.checkedCart(entity).get(i).getPrice() * service.checkedCart(entity).get(i).getLg();
            cost += service.checkedCart(entity).get(i).getPrice() * service.checkedCart(entity).get(i).getXl();
        }
        model.addAttribute(Const.COST, cost);
    }

    @PostMapping("/order")
    public String orderProc(UserEntity entity, UserOrderEntity entity2) {
        entity.setIuser(utils.getLoginUserPk());
        for(int i = 0; i < service.checkedCart(entity).size(); i++) {
            BoardProductVo vo = new BoardProductVo();
            vo.setIuser(entity.getIuser());
            vo.setColor(service.checkedCart(entity).get(i).getColor());
            vo.setIboard(service.checkedCart(entity).get(i).getIboard());
            vo.setIdetail(service.checkedCart(entity).get(i).getIdetail());
            if(service.checkedCart(entity).get(i).getSm() != 0) {vo.setSm(service.checkedCart(entity).get(i).getSm());}
            else if(service.checkedCart(entity).get(i).getMd() != 0) {vo.setMd(service.checkedCart(entity).get(i).getMd());}
            else if(service.checkedCart(entity).get(i).getLg() != 0) {vo.setLg(service.checkedCart(entity).get(i).getLg());}
            else if(service.checkedCart(entity).get(i).getXl() != 0) {vo.setXl(service.checkedCart(entity).get(i).getXl());}
            boardService.insPurchased(vo);
            service.updProductDetail(vo);
        }
        boardService.delCartChecked(entity.getIuser());
        service.order(entity2);
        return "board/main";
    }

    @GetMapping("/purchased")
    public void purchased(UserPurchasedEntity entity, Model model) {
        model.addAttribute(Const.PURCHASED, service.selPurchased2(entity));
        service.selPurchased2(entity);
    }

}