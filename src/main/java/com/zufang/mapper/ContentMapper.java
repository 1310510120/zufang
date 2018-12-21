package com.zufang.mapper;

import com.zufang.pojo.Content;
import com.zufang.pojo.extend.Content_Cat_Count;
import com.zufang.pojo.extend.Content_extend;
import com.zufang.pojo.extend.House_extend;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ContentMapper {

    /*
    展示首页内容列表，并不能更换（更换功能跳转到到房屋推送页面）。
     */
    public List<Content_extend> getallContent();

    /*
    目的：更换（新增）房屋推送
    //TODO 1.获取所有类别放入复选框(这个在content_cat对应mapper实现,这个地方静态页面写死了）
    2.查询弹出框内容，也就是对应房屋id的首页推广内容（下面实现）
     */
    public Content_extend getContentByHouseId(Integer houseId);

    /*
    用户修改内容后更新
     */
    public int updateContent(Content_extend content_extend);

    /*
    用户删除
     */
    public int deleteContentById(Integer house_id);

    /*
    统计内容类别个数
     */
    public List<Content_Cat_Count> count_content_cat();

    //获取房子和推送信息
    public List<House_extend> getHouseContent(@Param("startRow") Integer startRow, @Param("PageSize") Integer PageSize);

    public int insertContent(Content_extend content_extend);
}
