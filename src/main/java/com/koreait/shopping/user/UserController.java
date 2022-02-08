package com.koreait.shopping.user;

import com.koreait.shopping.Const;
import com.koreait.shopping.model.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired private UserService service;

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
        System.out.println(result);
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

    @GetMapping("/kakaologin")
    public void kakaologin(){}

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

    @GetMapping("/idChk/{uid}")//@PathVariable 변수명이랑 이름 맞춤
    @ResponseBody//return 이 Json 으로 바뀜, 받을때는 RequestBody
    public Map<String, Integer> idChk(@PathVariable String uid) {
        Map<String, Integer> res = new HashMap();
        res.put("result", service.idChk(uid));
        return res;
        // {"result" : 1} 문자열이 Json 형태로 변환
    }

}