package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.OrderItem;
import com.daxia.wz.dto.OrderItemDTO;
import com.daxia.wz.support.Page;

@Repository
public class OrderItemDAO extends GenericDAOHibernate<OrderItem> {

    public List<OrderItem> find(OrderItemDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From OrderItem n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (dto.getOrder() != null) {
        	if (dto.getOrder().getId() != null) {
	            hql.append(" and n.order.id = ? ");
	            paras.add(dto.getOrder().getId());
        	}
        }			
        if (dto.getType() != null) {
            hql.append(" and n.type = ? ");
            paras.add(dto.getType());
        }
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    
    public OrderItem findOne(OrderItemDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<OrderItem> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
