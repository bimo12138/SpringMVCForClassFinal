package com.bimo.controller;

/*
 * @fileName: OrderController
 * @author  : 13716
 * @Date    : 2020-07-08 23:14
 */

import com.bimo.annotation.RequireLogin;
import com.bimo.pojo.BaseOrder;
import com.bimo.pojo.Order;
import com.bimo.service.OrderService;
import com.bimo.utils.GetUUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/order")
@Controller
public class OrderController {

    private OrderService orderService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping
    @RequireLogin
    public ModelAndView GetOrder(String userId) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("orders", orderService.getOrderByIdInfo(userId));
        modelAndView.setViewName("myOrder");
        return modelAndView;
    }

    @PostMapping
    @ResponseBody
    @RequireLogin
    public String saveOrder(Order order) {
        order.setId(GetUUID.getUUID());
        orderService.saveOrder(order);
        return "保存成功！";
    }

    @RequestMapping(value = "/mine", method = RequestMethod.GET)
    @ResponseBody
    @RequireLogin
    public List<BaseOrder> getMyOrder(String userId) {
        return orderService.getOrderByIdInfo(userId);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @RequireLogin
    @ResponseBody
    public void deleteOrderById(String id) {
        orderService.deleteOrderById(id);
    }
}
