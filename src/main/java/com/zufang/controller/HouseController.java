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

    /**
     * 房屋已通过审核列表
     * @param model
     * @param current
     * @return
     */
    @RequestMapping("passlist")
    public String getHousePassList(Model model,Integer current){
        int total = houseService.getHouseListCount(1);
        PageVo pageVo = PageVo.getPageVoBy_current_total(current,total);
        List<House> list = houseService.getHouseList(1,pageVo.getStartRow(),pageVo.getPageSize());
        model.addAttribute("list",list);
        model.addAttribute("pageVo",pageVo);
        return "house/house-list";
    }

    /**
     * 房屋待审核列表
     * @param model
     * @param current
     * @return
     */
    @RequestMapping("checklist")
    public String getHouseCheckList(Model model,Integer current){
        int total = houseService.getHouseListCount(0);
        PageVo pageVo = PageVo.getPageVoBy_current_total(current,total);
        List<House> list = houseService.getHouseList(0,pageVo.getStartRow(),pageVo.getPageSize());
        model.addAttribute("list",list);
        model.addAttribute("pageVo",pageVo);
        return "house/house-checklist";
    }

    /**
     * 通过审核按钮
     * @param id
     * @return
     */
    @RequestMapping("{id}/pass")
    public String passHouse(@PathVariable("id") Integer id){
        House house = houseService.getHouseById(id);
        house.setStatus(1);
        houseService.updateHouse(house);
        return "redirect:passlist";
    }

    /**
     * 拒绝审核按钮
     * @param id
     * @return
     */
    @RequestMapping("{id}/rejectpass")
    public String rejectpassHouse(@PathVariable("id") Integer id){
        House house = houseService.getHouseById(id);
        house.setStatus(-1);
        houseService.updateHouse(house);
        return "redirect:checklist";
    }

    /**
     *更新房屋表
     * @param house
     * @return
     */
    @RequestMapping("/update")
    public String updateHosue(House house){
        houseService.updateHouse(house);
        return "redirect:passlist";
    }

    /**
     * 点击编辑获取而房屋信息
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("{id}/edit")
    public String detailHouse(@PathVariable("id") Integer id,Model model){
        House house = houseService.getHouseById(id);
        model.addAttribute("house",house);
        return "house/house-edit";
    }
}
