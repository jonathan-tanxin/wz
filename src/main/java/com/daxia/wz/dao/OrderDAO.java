package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
import org.apache.commons.lang3.StringUtils;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.Order;
import com.daxia.wz.dto.OrderDTO;
import com.daxia.wz.support.Page;

@Repository
public class OrderDAO extends GenericDAOHibernate<Order> {

    public List<Order> find(OrderDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Order n where 1 = 1 and status != -1");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (dto.getCustomer() != null) {
        	if (dto.getCustomer().getId() != null) {
	            hql.append(" and n.customer.id = ? ");
	            paras.add(dto.getCustomer().getId());
        	}
        	if(dto.getCustomer().getNickName() != null){
        		hql.append(" and n.customer.nickName like ? ");
	            paras.add("%" + dto.getCustomer().getNickName() + "%");
        	}
        }
        if(dto.getIds() != null && !dto.getIds().equals("")){
            hql.append(" and n.id in (" + dto.getIds()+") ");
            //paras.add(dto.getIds());
        }
        if (StringUtils.isNotBlank(dto.getOrderNo())) {
            hql.append(" and n.orderNo like ? ");
            paras.add("%" + dto.getOrderNo()+ "%");
        }		
        if (dto.getStatus() != null) {
            hql.append(" and n.status = ? ");
            paras.add(dto.getStatus());
        }
        if (dto.getDistributeStatus() != null) {
            hql.append(" and n.distributeStatus = ? ");
            paras.add(dto.getDistributeStatus());
        }
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Order findOne(OrderDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Order> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
