package com.zufang.mapper;

import com.zufang.pojo.User;

import java.util.List;

public interface UserMapper {

    public List<User> getUserList();

    public User getUserById(long id);

    public int UpdateUserByUser(User user);

    public int InsertUser(User user);

    public int deleteUserById(long UserId);
}
