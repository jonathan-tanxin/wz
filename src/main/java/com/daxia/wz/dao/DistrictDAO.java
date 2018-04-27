package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.daxia.wz.dto.DistrictDTO;
import com.daxia.wz.model.District;
import com.daxia.wz.support.Page;

@Repository
public class DistrictDAO extends GenericDAOHibernate<District> {

    public List<District> find(DistrictDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From District n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getName())) {
            hql.append(" and n.name like ? ");
            paras.add("%" + dto.getName() + "%");
        }					
        if (dto.getCity() != null) {
        	if (dto.getCity().getId() != null) {
	            hql.append(" and n.city.id = ? ");
	            paras.add(dto.getCity().getId());
        	}
        	if (StringUtils.isNotBlank(dto.getCity().getName())) {
	            hql.append(" and n.city.name like ? ");
	            paras.add("%" + dto.getCity().getName() + "%");
        	}
        }			
        if (StringUtils.isNotBlank(dto.getLetter())) {
            hql.append(" and n.letter = ? ");
            paras.add(dto.getLetter());
        }		
        if (StringUtils.isNotBlank(dto.getFullLetter())) {
            hql.append(" and n.fullLetter like ? ");
            paras.add("%" + dto.getFullLetter() + "%");
        }
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public District findOne(DistrictDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<District> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
