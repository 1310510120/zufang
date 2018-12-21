package com.zufang.service.Impl;

import com.zufang.mapper.HouseMapper;
import com.zufang.pojo.House;
import com.zufang.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HouseServiceImpl implements HouseService {
    @Autowired
    private HouseMapper houseMapper;

    @Override
    public List<House> getHouseList(int status,int startRows,int PageSize) {
        List<House> list = houseMapper.getHouseList(status,startRows,PageSize);
        return list;
    }

    @Override
    public int updateHouse(House house) {
        int result = houseMapper.updateHouse(house);
        return result;
    }

    public int insertHouse(House house) {
        int result = houseMapper.insertHouse(house);
        return result;
    }

    @Override
    public int getHouseListCount(int status) {
        int result = houseMapper.getHouseListCount(status);
        return result;
    }

    public House getHouseById(int id){
        House house = houseMapper.getHouseById(id);
        return house;
    }


}
