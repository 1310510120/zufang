package com.zufang.mapper;

import com.zufang.pojo.House;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HouseMapper {

    //获取出租房列表
    public List<House> getHouseList(@Param("status")int status, @Param("startRows")int startRows,@Param("PageSize") int PageSize);

    //通过和拒绝（删除）都是用这个方法改变状态
    public int updateHouse(House house);

    public int insertHouse(House house);

    public int getHouseListCount(int status);

    public House getHouseById(int id);

}
