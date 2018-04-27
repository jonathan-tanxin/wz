package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.CustomerBalanceDetail;
import com.daxia.wz.dto.CustomerBalanceDetailDTO;
import com.daxia.wz.support.Page;

@Repository
public class CustomerBalanceDetailDAO extends GenericDAOHibernate<CustomerBalanceDetail> {

    public List<CustomerBalanceDetail> find(CustomerBalanceDetailDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From CustomerBalanceDetail n where 1 = 1 ");
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
        if (dto.getType() != null) {
            hql.append(" and n.type = ? ");
            paras.add(dto.getType());
        }
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public CustomerBalanceDetail findOne(CustomerBalanceDetailDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<CustomerBalanceDetail> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
