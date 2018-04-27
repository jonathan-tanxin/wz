package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
import org.apache.commons.lang3.StringUtils;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.Address;
import com.daxia.wz.dto.AddressDTO;
import com.daxia.wz.support.Page;

@Repository
public class AddressDAO extends GenericDAOHibernate<Address> {

    public List<Address> find(AddressDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Address n where 1 = 1 ");
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
        if (StringUtils.isNotBlank(dto.getName())) {
            hql.append(" and n.name = ? ");
            paras.add(dto.getName());
        }		
        if (StringUtils.isNotBlank(dto.getMobile())) {
            hql.append(" and n.mobile = ? ");
            paras.add(dto.getMobile());
        }		
        if (StringUtils.isNotBlank(dto.getAddress())) {
            hql.append(" and n.address like ? ");
            paras.add("%" + dto.getAddress() + "%");
        }					
        if (dto.getProvince() != null) {
        	if (dto.getProvince().getId() != null) {
	            hql.append(" and n.province.id = ? ");
	            paras.add(dto.getProvince().getId());
        	}
        }			
        if (dto.getCity() != null) {
        	if (dto.getCity().getId() != null) {
	            hql.append(" and n.city.id = ? ");
	            paras.add(dto.getCity().getId());
        	}
        }			
        if (dto.getDistrict() != null) {
        	if (dto.getDistrict().getId() != null) {
	            hql.append(" and n.district.id = ? ");
	            paras.add(dto.getDistrict().getId());
        	}
        }			
        if (dto.getDistributionCenter() != null) {
        	if (dto.getDistributionCenter().getId() != null) {
	            hql.append(" and n.distributionCenter.id = ? ");
	            paras.add(dto.getDistributionCenter().getId());
        	}
        }			
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Address findOne(AddressDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Address> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
