package com.bimo.controller;

/*
 * @fileName: IndexController
 * @author  : 13716
 * @Date    : 2020 - 07 - 08 15: 08
 */

import com.bimo.annotation.RequireLogin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {

    @GetMapping
    public String getIndex() {
        System.out.println(666);
        return "../index";
    }
}
