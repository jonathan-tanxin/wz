package com.daxia.wz.common;

/**
 * 定义sql
 */
public enum Sqls {
    /**
     * 查出所有的GlobalReturnCode
     */
    find_all_UrlReturn("select * from UrlResponse where status = 0 ");
    
    private String sql;
    private Sqls(String sql) {
        this.sql = sql;
    }
    
    public String sql() {
        return sql;
    }
}
