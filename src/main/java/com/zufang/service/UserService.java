package com.zufang.service;

import com.zufang.pojo.User;

import java.util.List;

public interface UserService {

    public List<User> getUserList(Integer startRow,Integer PageSize);

    public User getUserById(long id);

    public int UpdateUserByUser(User user);

    public int InsertUser(User user);

    public int deleteUserById(long userId);

    public int countUser();
}
