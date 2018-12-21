package com.zufang.service;

import com.zufang.pojo.Content;
import com.zufang.pojo.extend.Content_Cat_Count;
import com.zufang.pojo.extend.Content_extend;
import com.zufang.pojo.extend.House_extend;

import java.util.List;

public interface ContentService {
    /*
    列表
     */
    public List<Content_extend> getallContent();

    //获取广告信息
    public Content_extend getContentByHouseId(Integer houseId) throws Exception;
    /*
    用户修改内容后更新
     */
    public int updateContent(Content_extend content_extend);
    /*
    用户删除
     */
    public int deleteContentById(Integer house_id);

    public List<House_extend> getHouseContent(Integer startRow,Integer PageSize);

    //统计类别个数
    public List<Content_Cat_Count> count_content_cat();

    public int insertContent(Content_extend content_extend);
}
