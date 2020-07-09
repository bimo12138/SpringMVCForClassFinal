package com.bimo.service;

import com.bimo.pojo.BaseOrder;
import com.bimo.pojo.Order;

import java.util.List;

/*
 * @fileName: OrderService
 * @author  : 13716
 * @Date    : 2020 - 07 - 08 23: 34
 */
public interface OrderService {
    public List<Order> getOrder(String userId);
    public void saveOrder(Order order);
    public Order getOrderById(String id);
    public List<BaseOrder> getOrderByIdInfo(String userId);
    public void deleteOrderById(String id);
}
