package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.daxia.wz.dto.ExampleDTO;
import com.daxia.wz.model.Example;
import com.daxia.wz.support.Page;

@Repository
public class ExampleDAO extends GenericDAOHibernate<Example> {

    public List<Example> find(ExampleDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Example n where 1 = 1 ");
        
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getUsername())) {
            hql.append(" and n.username like ? ");
            paras.add("%" + dto.getUsername() + "%");
        }					
        if (dto.getCreateDate() != null) {
            hql.append(" and n.createDate = ? ");
            paras.add(dto.getCreateDate());
        }
        if (StringUtils.isNotBlank(dto.getMyname())) {
            hql.append(" and n.myname like ? ");
            paras.add("%" + dto.getMyname() + "%");
        }					
        
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Example findOne(ExampleDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Example> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
