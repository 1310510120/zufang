package com.zufang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("")
public class PageController {

    @RequestMapping("index")
    public String index(){
        return "index";
    }

    //登录跳转
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginUI() throws Exception {
        return "login";
    }

    @RequestMapping("unauthorized")
    public String noPerms(){
        return "unauthorized";
    }


}

