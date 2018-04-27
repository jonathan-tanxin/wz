package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
import org.apache.commons.lang3.StringUtils;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.Pay;
import com.daxia.wz.dto.PayDTO;
import com.daxia.wz.support.Page;

@Repository
public class PayDAO extends GenericDAOHibernate<Pay> {

    public List<Pay> find(PayDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Pay n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (dto.getCustomer() != null) {
        	if (dto.getCustomer().getId() != null) {
	            hql.append(" and n.customer.id = ? ");
	            paras.add(dto.getCustomer().getId());
        	}
        	if (dto.getCustomer().getNickName() != null) {
	            hql.append(" and n.customer.nickName like ? ");
	            paras.add("%" + dto.getCustomer().getNickName()+ "%");
        	}
        }			
        if (StringUtils.isNotBlank(dto.getPayNO())) {
            hql.append(" and n.payNO = ? ");
            paras.add(dto.getPayNO());
        }		
        if (StringUtils.isNotBlank(dto.getWxPayNo())) {
            hql.append(" and n.wxPayNo = ? ");
            paras.add(dto.getWxPayNo());
        }		
        if (StringUtils.isNotBlank(dto.getPrepayId())) {
        	hql.append(" and n.prepayId = ? ");
        	paras.add(dto.getPrepayId());
        }
        if (dto.getStatus() != null) {
            hql.append(" and n.status = ? ");
            paras.add(dto.getStatus());
        }
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Pay findOne(PayDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Pay> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }

	public Pay findByPrepayId(String prepayId) {
		PayDTO query = new PayDTO();
		query.setPrepayId(prepayId);
		return this.findOne(query);
	}
}
