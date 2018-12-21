package com.zufang.pojo.extend;
//展示广告位有多少个，已经有多少个使用广告位。
public class Content_Cat_Count {
//    类别名称
    private String content_cat;
    private Integer content_cat_count;

    public String getContent_cat() {
        return content_cat;
    }

    public void setContent_cat(String content_cat) {
        this.content_cat = content_cat;
    }

    public Integer getContent_cat_count() {
        return content_cat_count;
    }

    public void setContent_cat_count(Integer content_cat_count) {
        this.content_cat_count = content_cat_count;
    }

    @Override
    public String toString() {
        return "Content_Cat_Count{" +
                "content_cat='" + content_cat + '\'' +
                ", content_cat_count=" + content_cat_count +
                '}';
    }
}
