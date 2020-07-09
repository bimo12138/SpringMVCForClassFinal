package com.bimo.service.impl;

import com.bimo.dao.OrderDao;
import com.bimo.pojo.BaseOrder;
import com.bimo.pojo.Order;
import com.bimo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @fileName: OrderSerciceImpl
 * @author  : 13716
 * @Date    : 2020-07-08 23:34
 */
@Service
public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao;

    @Autowired
    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    public List<Order> getOrder(String userId) {
        return orderDao.getOrder(userId);
    }

    @Override
    public void deleteOrderById(String id) {
        orderDao.deleteOrderById(id);
    }

    @Override
    public List<BaseOrder> getOrderByIdInfo(String userId) {
        return orderDao.getOrderByIdInfo(userId);
    }

    @Override
    public void saveOrder(Order order) {
        orderDao.saveOrder(order);
    }

    @Override
    public Order getOrderById(String id) {
        return orderDao.getOrderById(id);
    }
}
