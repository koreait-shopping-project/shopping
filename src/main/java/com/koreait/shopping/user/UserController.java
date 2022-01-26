package com.koreait.shopping.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping("/user")
public class UserController {
    @GetMapping("/login")
    public void login(){}

    @GetMapping("/join")
    public void join(){}

    @GetMapping("/kakaologin")
    public void kakaologin(){}

}