package com.daxia.wz.service;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.common.Sqls;
import com.daxia.wz.dao.SqlDAO;
import com.google.common.collect.Lists;

/**
 * 用于执行一些简单的sql。有些表可能只用到一次，并且只是查询，相比之下用sql查比较简单吧。
 */
@Service
public class SqlService {
    
    @Autowired
    private SqlDAO sqlDAO;
    
    public <T> T findOne(Sqls sql, Object[] paras, Class<T> clazz) {
        return sqlDAO.findOne(sql, paras, clazz);
    }
    
    @SuppressWarnings("unchecked")
    public <T> List<T> findAll(Sqls sql, Object[] paras, Class<T> clazz) {
        List<T> list = sqlDAO.findBySQL(sql.sql(), paras, clazz);
        if (CollectionUtils.isEmpty(list)) {
            return Lists.newArrayList();
        } else {
            return list;
        }
    }
    
    public void update(Sqls sql, Object[] paras) {
        sqlDAO.executeSQLUpdate(sql.sql(), paras);
    }
}
