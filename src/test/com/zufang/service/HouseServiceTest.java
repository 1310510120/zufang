package com.zufang.service;

import com.zufang.pojo.House;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring/applicationContext-dao.xml","classpath:spring/applicationContext-service.xml"})
public class HouseServiceTest {

    @Resource
    private HouseService houseService;
    House house = new House();
    @Test
    public void getHouseList() {
        List<House> list = houseService.getHouseList(0);
        for(House house:list){
            System.out.println(house.toString());
        }
    }

    @Test
    public void updateHouse() {
        house.setId(1);
        house.setAid(100);
        house.setArea("300平方");
        house.setCid(100-100+"");
        house.setSell_point("测试卖点");
        house.setStatus(-1);
        houseService.updateHouse(house);
    }

    @Test
    public void insertHouseList(){
        for (int i=100;i<130;i++){
            house.setAid(i);
            house.setArea("300平方");
            house.setCid(i-100+"");
            house.setSell_point("测试卖点");
            house.setStatus(i%2);
            houseService.insertHouse(house);
        }
        System.out.println("成功");
    }

    @Test
    public void getHouseListCount(){
        int result = houseService.getHouseListCount(0);
        System.out.println(result);
    }
}