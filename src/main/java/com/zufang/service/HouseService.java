package com.zufang.service;

import com.zufang.pojo.House;

import java.util.List;

public interface HouseService {

    //获取出租房列表
    public List<House> getHouseList(int status,int startRows,int PageSize);

    //通过和拒绝（删除）都是用这个方法改变状态
    public int updateHouse(House house);

    public int insertHouse(House house);

    public int getHouseListCount(int status);

    public House getHouseById(int id);
}
