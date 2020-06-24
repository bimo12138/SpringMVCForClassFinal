package com.bimo.dao;

import com.bimo.pojo.User;
import com.bimo.pojo.Users;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserDao {
    public User findUserByUsernameAndPassword(@Param("username") String username,
                             @Param("password") String password);
    public User saveUserByUsernameAndPassword(@Param("username") String username,
                                             @Param("password") String password);
    public void updateUserById(User user);

    public List<User> findUsersByStartAndNum(@Param("start") Integer start,
                                             @Param("limit") Integer limit);

    public Integer saveUserByUser(User user);

    public Integer getUserCount();

    public void deleteUserById(String id);
}
