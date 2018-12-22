package com.zufang.controller;

import com.zufang.pojo.House;
import com.zufang.pojo.extend.Content_Cat_Count;
import com.zufang.pojo.extend.Content_extend;
import com.zufang.pojo.extend.House_extend;
import com.zufang.service.ContentService;
import com.zufang.service.HouseService;
import com.zufang.utils.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("content")
public class ContentController {

    @Autowired
    private ContentService contentService;
    @Autowired
    private HouseService houseService;

    /**
     *  获取房屋维护列表
     * @param model
     * @param current 当前页码
     * @return
     */
    @RequestMapping("/houseContent")
    public String gethouseContent(Model model, Integer current){
        int total = houseService.getHouseListCount(1);
        PageVo pageVo = PageVo.getPageVoBy_current_total(current,total);
        List<House_extend> list = contentService.getHouseContent(pageVo.getStartRow(),pageVo.getPageSize());
        List<Content_Cat_Count> catCount_list = contentService.count_content_cat();
        model.addAttribute("catCount_list",catCount_list);
        model.addAttribute("list",list);
        model.addAttribute("pageVo",pageVo);
        return "content/house-content";
    }

    /**
     * 在房屋维护列表点击推送到首页事件
     * 弹出模态框，将广告信息填充，如果是旧广告则可以更换，如果是新广告则可以新增
     * @param houseId
     * @return
     */
    @RequestMapping("/houseContent/{houseId}")
    @ResponseBody
    public Map<String,Object> getContentByHouseId(@PathVariable("houseId")Integer houseId){
        Map<String,Object> result = new HashMap<String,Object>();
        try{
            //如果此房屋消息目前  已经被推送  需要更换，查询信息
            Content_extend content_extend = contentService.getContentByHouseId(houseId);
            //如果此房屋消息目前  没有推送，需要新增,设置信息
            if (content_extend == null){
                //如果广告没有设置内容，则自动将house里面的内容填充进去,广告默认内容是house表里面的对应字段
                Content_extend new_content_extend = new Content_extend();
                new_content_extend.setHouse_id(houseId);
                House house = houseService.getHouseById(houseId);
                new_content_extend.setBig_pic(house.getImage_1());
                new_content_extend.setHeadline(house.getHeadline());
                new_content_extend.setPrice(house.getPrice());
                //将信息填充到页面，此时还没有插入数据库，只是自动将该广告的信息填充
                result.put("code",100);
                result.put("data",new_content_extend);
                return result;
            }
            //如果content_extend不为null，
            result.put("code",100);
            result.put("data",content_extend);
        }
       catch (Exception e){
           result.put("code",250);
           result.put("msg","错误");
       }
        return result;
    }

    /**
     * 模态框中确定更新广告信息按钮，
     * @param content_extend
     * @return
     */
    @RequestMapping(value = "/UpdateContent" ,method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addOrUpdateContent(Content_extend content_extend){
        Map<String,Object> result = new HashMap<String,Object>();
        //有id就更新，没有就新增.
        try{
        Integer id = content_extend.getId();
            if(id == null){
                contentService.insertContent(content_extend);
            }else {
                contentService.updateContent(content_extend);
            }
            result.put("code",200);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 取消推送
     * @param houseId
     * @return
     */
    @RequestMapping("/deleteContent/{houseId}")
    public String deleteContent(@PathVariable("houseId")Integer houseId){
        contentService.deleteContentById(houseId);
        return "redirect:/content/houseContent";
    }

    /**
     * 展示广告内容列表
     * @param model
     * @return
     */
    @RequestMapping("/getallContent")
    public String getallContent(Model model){
        List<Content_extend> list =  contentService.getallContent();
        model.addAttribute("list",list);
        return "content/contentList";
    }






}
