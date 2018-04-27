package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.CustomerCard;
import com.daxia.wz.dto.CustomerCardDTO;
import com.daxia.wz.support.Page;

@Repository
public class CustomerCardDAO extends GenericDAOHibernate<CustomerCard> {

    public List<CustomerCard> find(CustomerCardDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From CustomerCard n where 1 = 1 ");
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
        if (dto.getCard() != null) {
        	if (dto.getCard().getId() != null) {
	            hql.append(" and n.card.id = ? ");
	            paras.add(dto.getCard().getId());
        	}
        }			
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public CustomerCard findOne(CustomerCardDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<CustomerCard> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }

	public CustomerCard findValidCard(Long customerId, int cardType) {
		String hql = "from CustomerCard n where n.customer.id = ? and n.card.type = ? and n.startTime <= ? and n.endTime >= ?";
		List<CustomerCard> list = super.find(hql, new Object[] {customerId,  cardType, new Date(), new Date()}, null);
		return CollectionUtils.isEmpty(list) ? null : list.get(0);
	}
}
