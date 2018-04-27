package com.daxia.wz.dao;

import com.daxia.wz.dto.ProfitDTO;
import com.daxia.wz.dto.ProfitSetDTO;
import com.daxia.wz.model.Profit;
import com.daxia.wz.model.ProfitSet;
import com.daxia.wz.support.Page;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ProfitSetDAO extends GenericDAOHibernate<ProfitSet> {

    public List<ProfitSet> find(ProfitSetDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From ProfitSet n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }

        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public ProfitSet findOne(ProfitSetDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<ProfitSet> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
