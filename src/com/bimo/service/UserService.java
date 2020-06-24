package com.bimo.service;

import com.bimo.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    public User findUserByUsernameAndPassword(@Param("username") String username,
                                              @Param("password") String password);
    public List<User> findUsersByStartAndNum(@Param("start") Integer start,
                                             @Param("limit") Integer limit);

    public Integer saveUserByUser(User user);

    public Integer getUserCount();

    public void updateUserById(User user);

    public void deleteUserById(String id);
}
