package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.Profit;
import com.daxia.wz.dto.ProfitDTO;
import com.daxia.wz.support.Page;

@Repository
public class ProfitDAO extends GenericDAOHibernate<Profit> {

    public List<Profit> find(ProfitDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Profit n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (dto.getProfitCustomer() != null) {
        	if (dto.getProfitCustomer().getId() != null) {
	            hql.append(" and n.profitCustomer.id = ? ");
	            paras.add(dto.getProfitCustomer().getId());
        	}
        }
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Profit findOne(ProfitDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Profit> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
