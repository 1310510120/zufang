package com.zufang.service.Impl;

import com.zufang.pojo.Content;
import com.zufang.pojo.extend.Content_Cat_Count;
import com.zufang.pojo.extend.Content_extend;
import com.zufang.pojo.extend.House_extend;
import com.zufang.service.ContentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring/applicationContext-dao.xml","classpath:spring/applicationContext-service.xml"})
public class ContentServiceImplTest {

    @Resource
    private ContentService contentService;


    @Test
    public void getallContent() {
        List<Content_extend> list = contentService.getallContent();
        for (Content_extend content_extend:list){
            System.out.println(content_extend.toString());
        }
    }

    @Test
    public void getContentByHouseId()throws Exception {
        Content_extend content_extend = contentService.getContentByHouseId(5);
        System.out.println(content_extend.toString());
    }

    @Test
    public void updateContent()throws Exception {
        contentService.updateContent(contentService.getContentByHouseId(5));
    }

    @Test
    public void deleteContentById() {
        int count = contentService.deleteContentById(1);
        System.out.println(count);
    }

    @Test
    public void getHouseContent(){
        List<House_extend> list = contentService.getHouseContent(0,5);
        for(House_extend house_extend : list){
            System.out.println(house_extend.toString());
        }
    }

    @Test
    public void count_content_cat(){
        List<Content_Cat_Count> catCount_list = contentService.count_content_cat();
        for (Content_Cat_Count content_cat_count:catCount_list){
            System.out.println(content_cat_count.toString());
        }
    }
}