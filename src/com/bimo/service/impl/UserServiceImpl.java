package com.bimo.service.impl;

import com.bimo.dao.UserDao;
import com.bimo.pojo.User;
import com.bimo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public User findUserByUsernameAndPassword(String username, String password) {
        return userDao.findUserByUsernameAndPassword(username, password);
    }

    @Override
    public List<User> findUsersByStartAndNum(Integer start, Integer limit) {
        return userDao.findUsersByStartAndNum(start, limit);
    }

    @Override
    public Integer saveUserByUser(User user) {
        return userDao.saveUserByUser(user);
    }

    @Override
    public Integer getUserCount() {
        return userDao.getUserCount();
    }

    @Override
    public void updateUserById(User user) {
        userDao.updateUserById(user);
    }

    @Override
    public void deleteUserById(String id) {
        userDao.deleteUserById(id);
    }
}
