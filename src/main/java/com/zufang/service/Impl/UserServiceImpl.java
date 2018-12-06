package com.zufang.service.Impl;

import com.zufang.mapper.UserMapper;
import com.zufang.pojo.User;
import com.zufang.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getUserList() {
        List<User> list = userMapper.getUserList();
        return list;
    }

    @Override
    public User getUserById(long id) {
        User user= userMapper.getUserById(id);
        return user;
    }

    @Override
    public int UpdateUserByUser(User user) {
     return  userMapper.UpdateUserByUser(user);
    }


    public int InsertUser(User user){
        user.setCreated(new Date());
        return userMapper.InsertUser(user);
    }

    public int deleteUserById(long userId){
        int result = userMapper.deleteUserById(userId);
        return result;
    }
}
