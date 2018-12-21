package com.zufang.pojo.extend;
//此类是内容展示列表页所需要的pojo，去和content表区别是没有cid，换成了cname
public class Content_extend {

    private Integer id;
    private String content_cat;
    private long house_id;
    private String small_pic;
    private String big_pic;
    private String headline;
    private String price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent_cat() {
        return content_cat;
    }

    public void setContent_cat(String content_cat) {
        this.content_cat = content_cat;
    }

    public long getHouse_id() {
        return house_id;
    }

    public void setHouse_id(long house_id) {
        this.house_id = house_id;
    }

    public String getSmall_pic() {
        return small_pic;
    }

    public void setSmall_pic(String small_pic) {
        this.small_pic = small_pic;
    }

    public String getBig_pic() {
        return big_pic;
    }

    public void setBig_pic(String big_pic) {
        this.big_pic = big_pic;
    }

    public String getHeadline() {
        return headline;
    }

    public void setHeadline(String headline) {
        this.headline = headline;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Content_extend{" +
                "id=" + id +
                ", content_cat='" + content_cat + '\'' +
                ", house_id=" + house_id +
                ", small_pic='" + small_pic + '\'' +
                ", big_pic='" + big_pic + '\'' +
                ", headline='" + headline + '\'' +
                ", price='" + price + '\'' +
                '}';
    }
}
