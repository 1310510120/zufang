package com.zufang.controller;

import com.zufang.pojo.House;
import com.zufang.service.HouseService;
import com.zufang.utils.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("house")
public class HouseController {

    @Autowired
    private HouseService houseService;

    @RequestMapping("passlist")
    public String getHousePassList(Model model,Integer current){
        List<House> list = houseService.getHouseList(1);
        int total = houseService.getHouseListCount(1);
        PageVo pageVo = PageVo.getPageVoBy_current_total(current,total);
        model.addAttribute("list",list);
        model.addAttribute("pageVo",pageVo);
        return "house/house-list";
    }

    @RequestMapping("checklist")
    public String getHouseCheckList(Model model,Integer current){
        List<House> list = houseService.getHouseList(0);
        int total = houseService.getHouseListCount(0);
        PageVo pageVo = PageVo.getPageVoBy_current_total(current,total);
        model.addAttribute("list",list);
        model.addAttribute("pageVo",pageVo);
        return "house/house-checklist";
    }

    @RequestMapping("{id}/pass")
    public String passHouse(@PathVariable("id") Integer id){
        House house = houseService.getHouseById(id);
        house.setStatus(1);
        houseService.updateHouse(house);
        return "house/house-list";
    }

    @RequestMapping("{id}/rejectpass")
    public String rejectpassHouse(@PathVariable("id") Integer id){
        House house = houseService.getHouseById(id);
        house.setStatus(-1);
        houseService.updateHouse(house);
        return "house/house-list";
    }

}
