package com.koreait.shopping.user;

import com.koreait.shopping.Const;
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
    public String joinProc() {
        return "redirect:/user/login";
    }

    @GetMapping("/test")
    public void test() {}

}