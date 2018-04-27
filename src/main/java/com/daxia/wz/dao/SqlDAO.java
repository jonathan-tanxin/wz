package com.daxia.wz.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;

import com.daxia.wz.common.Sqls;

@Repository
public class SqlDAO extends GenericDAOHibernate<Object> {
    
    @SuppressWarnings("unchecked")
    public <T> T findOne(Sqls sql, Object[] paras, Class<T> clazz) {
        List<T> list = super.findBySQL(sql.sql(), paras, clazz);
        if (CollectionUtils.isEmpty(list)) {
            return null;
        } else {
            return list.get(0);
        }
    }
}
