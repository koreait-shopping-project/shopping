package com.koreait.shopping.user;

import com.koreait.shopping.model.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired private UserService service;

    @GetMapping("/login")
    public void login(){}

    @PostMapping("/login")
    public String loginProc(UserEntity entity, RedirectAttributes reAttr){
        int result = service.login(entity);
        return "redirect:/board/main";
    }

    @GetMapping("/join")
    public void join(){}

    @GetMapping("/kakaologin")
    public void kakaologin(){}

    @PostMapping("/join")
    public String joinProc() {
        return "redirect:/user/login";
    }


}