package com.bimo.controller;

/*
 * @fileName: LogoutController
 * @author  : 13716
 * @Date    : 2020 - 07 - 08 13: 54
 */

import com.bimo.annotation.RequireLogin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@RequestMapping("/logout")
@Controller
public class LogoutController {
    @PostMapping
    @ResponseBody
    @RequireLogin
    public String logout(HttpSession httpSession) {
        httpSession.removeAttribute("user");
        return "注销成功！";
    }
}
