package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
import org.apache.commons.lang3.StringUtils;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.Category;
import com.daxia.wz.dto.CategoryDTO;
import com.daxia.wz.support.Page;

@Repository
public class CategoryDAO extends GenericDAOHibernate<Category> {

    public List<Category> find(CategoryDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Category n where 1 = 1 and isdel = 0 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getName())) {
            hql.append(" and n.name like '%"+dto.getName()+"%'");
            //paras.add(dto.getName());
        }		
        hql.append(" order by n.id asc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Category findOne(CategoryDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Category> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
