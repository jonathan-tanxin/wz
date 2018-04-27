package com.daxia.wz.support;


public class Page {
    private Integer page = 1;
    private Integer pageSize = 20;
    private Integer totalPages = 1;
	private Integer totalRecords = 15;
	private String dir;
	private String sort;
	private String alias;
    public Integer getPage() {
        return page;
    }
    public void setPage(Integer page) {
        this.page = page;
    }
    public Integer getPageSize() {
        return pageSize;
    }
    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
    public Integer getTotalPages() {
        return totalPages;
    }
    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }
    public Integer getTotalRecords() {
        return totalRecords;
    }
    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }
    public String getDir() {
        return dir;
    }
    public void setDir(String dir) {
        this.dir = dir;
    }
    public String getSort() {
        return sort;
    }
    public void setSort(String sort) {
        this.sort = sort;
    }
    public String getAlias() {
        return alias;
    }
    public void setAlias(String alias) {
        this.alias = alias;
    }
	
	
}
