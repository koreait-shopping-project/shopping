package com.koreait.shopping.user;

import com.koreait.shopping.Const;

import com.koreait.shopping.UserUtils;

import com.koreait.shopping.user.model.dto.UserDto;
import com.koreait.shopping.user.model.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @Autowired private UserUtils utils;

    @GetMapping("/login")
    public void login(){}

    @GetMapping("/logout")
    public String logout(HttpSession hs){
        hs.invalidate();
        return "redirect:/user/login";
    }

    @PostMapping("/login")
    public String loginProc(UserEntity entity, RedirectAttributes reAttr){
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

    @GetMapping("/join")
    public void join(){}

    //소셜 로그인시 이메일 중복체크
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
        }
        //회원가입 성공하면 로그인 처리는 나중에
        return "redirect:/";
    }

    //아이디 중복 체크
    @GetMapping("/idChk/{uid}")//@PathVariable 변수명이랑 이름 맞춤
    @ResponseBody//return 이 Json 으로 바뀜, 받을때는 RequestBody
    public Map<String, Integer> idChk(@PathVariable String uid) {
        Map<String, Integer> res = new HashMap<>();
        res.put("result", service.idChk(uid));
        return res;
        // {"result" : 1} 문자열이 Json 형태로 변환
    }
    //이메일 중복 체크
    @GetMapping("/emailChk")//@PathVariable 변수명이랑 이름 맞춤
    @ResponseBody//return 이 Json 으로 바뀜, 받을때는 RequestBody
    public Map<String, Integer> emailChk(UserEntity entity) {
        Map<String, Integer> res = new HashMap<>();
        res.put("result", service.emailChk(entity));
        return res;
        // {"result" : 1} 문자열이 Json 형태로 변환
    }

    //회원 정보 수정
    @GetMapping("/modify")
    public void modify() { }

    @PostMapping("/modify")
    public String modifyProc(UserDto dto, RedirectAttributes rAttr) {
        int result = service.modify(dto);
        if(result != 1) {
            switch(result) {
                case 0:
                    rAttr.addFlashAttribute(Const.MSG, "비밀번호 변경에 실패하였습니다.");
                    break;
                case 2:
                    rAttr.addFlashAttribute(Const.MSG, "현재 비밀번호를 확인해 주세요.");
                    break;
            }
            return "redirect:/user/modify";
        }
        return "redirect:/user/modify";
    }



    //비밀번호 확인(회원 정보 수정 진입)
    @GetMapping("/checkpw")
    public void checkpw() {}

    @PostMapping("/checkpw")
    public String checkpwProc(UserEntity entity, RedirectAttributes reAttr) {
        int result = service.checkpw(entity);
        if (result != 1) {
            reAttr.addFlashAttribute(Const.TRY_CHECK, entity);
            switch(result){
                case 0:
                    reAttr.addFlashAttribute(Const.MSG, Const.ERR_A);
                    return "redirect:/user/login";//알수 없는 오류시 로그인 창으로 이동
                case 2:
                    reAttr.addFlashAttribute(Const.MSG, Const.ERR_PW);
                    break;
            }
            return "redirect:/user/checkpw";
        }
        return "redirect:/user/modify";
    }

    //마이 페이지
    @GetMapping("/mypage")
    public void mypage() {}

}