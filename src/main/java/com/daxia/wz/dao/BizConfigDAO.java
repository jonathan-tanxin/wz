package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.daxia.wz.dto.BizConfigDTO;
import com.daxia.wz.model.BizConfig;
import com.daxia.wz.support.Page;

@Repository
public class BizConfigDAO extends GenericDAOHibernate<BizConfig> {

    public List<BizConfig> find(BizConfigDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From BizConfig n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getName())) {
            hql.append(" and n.name = ? ");
            paras.add(dto.getName());
        }		
        if (StringUtils.isNotBlank(dto.getRemark())) {
            hql.append(" and n.remark like ? ");
            paras.add("%" + dto.getRemark() + "%");
        }					
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public BizConfig findOne(BizConfigDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<BizConfig> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
