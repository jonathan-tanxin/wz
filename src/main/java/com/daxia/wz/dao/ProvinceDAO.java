package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.daxia.wz.dto.ProvinceDTO;
import com.daxia.wz.model.Province;
import com.daxia.wz.support.Page;

@Repository
public class ProvinceDAO extends GenericDAOHibernate<Province> {

    public List<Province> find(ProvinceDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Province n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getName())) {
            hql.append(" and n.name like ? ");
            paras.add("%" + dto.getName() + "%");
        }					
        if (StringUtils.isNotBlank(dto.getLetter())) {
            hql.append(" and n.letter = ? ");
            paras.add(dto.getLetter());
        }		
        if (dto.getIsHot() != null) {
            hql.append(" and n.isHot = ? ");
            paras.add(dto.getIsHot());
        }
        if (StringUtils.isNotBlank(dto.getFullletter())) {
            hql.append(" and n.fullletter like ? ");
            paras.add("%" + dto.getFullletter() + "%");
        }					
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Province findOne(ProvinceDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		
		List<Province> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }

	public List<Province> findHasCenter() {
		String hql = "select c.province from City c where c.hasCenter = 1";
		return super.find(hql, null, null);
	}

	public List<Province> findHasIsHOtProvince() {
		String hql = "from Province p where p.isHot = 1";
		return super.find(hql, null, null);
	}
}
