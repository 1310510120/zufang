package com.zufang.utils;

public class PageVo {

    //一页多少个
    private int pageSize = 5;

    //总页数
    private int pageCount;

    //当前页数
    private int current;

    private int startRow;

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getStartRow() {
        return startRow;
    }

    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }

    public static PageVo getPageVoBy_current_total(Integer currentPage, int total){
        PageVo pageVo = new PageVo();
        //设置起始页面
        if(currentPage==null || currentPage <=0){
            currentPage=1;
            pageVo.setCurrent(currentPage);
        }else{
            pageVo.setCurrent(currentPage);
        }
        //设置总页数
        if(total % pageVo.getPageSize()>0){
            pageVo.setPageCount(total/pageVo.getPageSize() + 1);
        }else{
            pageVo.setPageCount(total/pageVo.getPageSize());
        }
        //设置起始行
        pageVo.setStartRow((currentPage-1)*pageVo.getPageSize());

        return pageVo;

    }
}