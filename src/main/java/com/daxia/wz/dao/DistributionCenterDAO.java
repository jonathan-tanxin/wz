package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
import org.apache.commons.lang3.StringUtils;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.DistributionCenter;
import com.daxia.wz.dto.DistributionCenterDTO;
import com.daxia.wz.support.Page;

@Repository
public class DistributionCenterDAO extends GenericDAOHibernate<DistributionCenter> {

    public List<DistributionCenter> find(DistributionCenterDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From DistributionCenter n where 1 = 1 and isdel = 0 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (dto.getCustomer() != null) {
        	if (dto.getCustomer().getNickName() != null) {
	            hql.append(" and n.customer.nickName like ? ");
	            paras.add("%" + dto.getCustomer().getNickName() + "%");
        	}
        }			
        if (StringUtils.isNotBlank(dto.getName())) {
            hql.append(" and n.name like ? ");
            paras.add("%" + dto.getName() + "%");
        }			
        if (dto.getQueryForDistrict() != null && dto.getQueryForDistrict().getId() != null) {
        	hql.append(" and (n.district is null or n.district.id = ?) ");
        	paras.add(dto.getQueryForDistrict().getId());
        }
        if (dto.getCity() != null && dto.getCity().getId() != null) {
        	hql.append(" and n.city.id = ? ");
        	paras.add(dto.getCity().getId());
        }
        
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public DistributionCenter findOne(DistributionCenterDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<DistributionCenter> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
    
    public void deleteById(Long id){
    	
    }
}
