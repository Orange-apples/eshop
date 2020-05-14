package com.galaxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @RequestMapping("/login")
    public String login(String pwd, HttpServletRequest request){
        System.out.println("用户输入："+pwd);
        request.getSession().setAttribute("pwd",pwd);

        return "/manager/index.html";
    }
}
