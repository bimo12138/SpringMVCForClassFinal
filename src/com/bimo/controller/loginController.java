package com.bimo.controller;

import com.bimo.pojo.User;
import com.bimo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class loginController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String getLogin() {
        return "login";
    }

    @PostMapping
    @ResponseBody
    public String login(User user) {
        User result = userService.findUserByUsernameAndPassword(user.getUsername(), user.getPassword());
        if (result == null) {
            return "当前用户不存在";
        }
        return user.getUsername();
    }
}
