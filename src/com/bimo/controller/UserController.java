package com.bimo.controller;

import com.bimo.pojo.User;
import com.bimo.pojo.Users;
import com.bimo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/users")
public class UserController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public ModelAndView getUsers(Integer start, Integer limit) {
        ModelAndView modelAndView = new ModelAndView();
        Integer nums = userService.getUserCount();
        List<User> users;
        if (nums < start) {
            modelAndView.setStatus(HttpStatus.NOT_FOUND);
            modelAndView.addObject("message", "开始索引超出所有内容！");
            return modelAndView;
        } else if (nums > start && nums < (start + limit)) {
            limit = nums;
        }
        users = userService.findUsersByStartAndNum(start, limit);
        modelAndView.addObject("users", users);
        return modelAndView;
    }

    @PostMapping
    @ResponseBody
    public String saveUser(User user) {
        user.setId(UUID.randomUUID().toString());
        user.setSex(0);
        user.setSuperuser(false);
        Integer num = userService.saveUserByUser(user);
        if (num > 0) {
            return user.getUsername() + "添加成功！";
        } else {
            return "信息添加失败！";
        }
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    @ResponseBody
    public String updateUser(User user) {
        userService.updateUserById(user);
        return user.getUsername() + "修改成功！";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public String deleteUser(String id) {
        userService.deleteUserById(id);
        return id + "删除成功！";
    }
}
