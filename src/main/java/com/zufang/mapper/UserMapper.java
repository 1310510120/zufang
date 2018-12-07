package com.zufang.mapper;

import com.zufang.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    public List<User> getUserList(@Param("startRow") Integer startRow, @Param("PageSize") Integer PageSize);

    public User getUserById(long id);

    public int UpdateUserByUser(User user);

    public int InsertUser(User user);

    public int deleteUserById(long UserId);

    public int countUser();
}
