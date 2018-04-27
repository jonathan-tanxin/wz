package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.HealthComment;
import com.daxia.wz.dto.HealthCommentDTO;
import com.daxia.wz.support.Page;

@Repository
public class HealthCommentDAO extends GenericDAOHibernate<HealthComment> {

    public List<HealthComment> find(HealthCommentDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From HealthComment n where 1 = 1 ");
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
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public HealthComment findOne(HealthCommentDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<HealthComment> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }

	public List<HealthComment> findByCustomer(Long customerId) {
		String hql = "from HealthComment n where n.customer.id = ? ";
		return super.find(hql, new Object[] {customerId}, null);
	}
}
