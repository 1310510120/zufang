package com.zufang.service.Impl;

import com.zufang.mapper.ContentMapper;
import com.zufang.mapper.HouseMapper;
import com.zufang.pojo.Content;
import com.zufang.pojo.House;
import com.zufang.pojo.extend.Content_Cat_Count;
import com.zufang.pojo.extend.Content_extend;
import com.zufang.pojo.extend.House_extend;
import com.zufang.service.ContentService;
import com.zufang.service.HouseService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentServiceImpl implements ContentService {

    @Autowired
    private ContentMapper contentMapper;
    @Autowired
    private HouseMapper houseMapper;

    @Override
    public List<Content_extend> getallContent() {
        return contentMapper.getallContent();
    }

    @Override
    public Content_extend getContentByHouseId(Integer houseId) throws Exception{
        Content_extend content_extend = contentMapper.getContentByHouseId(houseId);
        return content_extend;
    }

    @Override
    public int updateContent(Content_extend content_extend) {
        return contentMapper.updateContent(content_extend);
    }

    @Override
    public int deleteContentById(Integer house_id) {
        int result = contentMapper.deleteContentById(house_id);
        return result;
    }

    @Override
    public List<House_extend> getHouseContent(Integer startRow,Integer PageSize) {
        List<House_extend> list = contentMapper.getHouseContent(startRow,PageSize);
        return list;
    }

    public List<Content_Cat_Count> count_content_cat(){
        List<Content_Cat_Count> list = contentMapper.count_content_cat();
        return list;
    }

    public int insertContent(Content_extend content_extend){
        int result = contentMapper.insertContent(content_extend);
        return result;
    }
}
