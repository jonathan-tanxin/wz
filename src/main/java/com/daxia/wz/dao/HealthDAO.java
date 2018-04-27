package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.Health;
import com.daxia.wz.dto.HealthDTO;
import com.daxia.wz.support.Page;

@Repository
public class HealthDAO extends GenericDAOHibernate<Health> {

    public List<Health> find(HealthDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Health n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (dto.getCustomer() != null) {
        	if (dto.getCustomer().getId() != null) {
	            hql.append(" and n.customer.id = ? ");
	            paras.add(dto.getCustomer().getId());
        	}
        }			
        hql.append(" order by n.date desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Health findOne(HealthDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Health> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
