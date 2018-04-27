package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.daxia.wz.dto.CityDTO;
import com.daxia.wz.model.City;
import com.daxia.wz.support.Page;

@Repository
public class CityDAO extends GenericDAOHibernate<City> {

	public List<City> find2(CityDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From City n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getName())) {
            hql.append(" and n.name like ? ");
            paras.add("%" + dto.getName() + "%");
        }					
        if (dto.getProvince() != null) {
        	if (dto.getProvince().getId() != null) {
	            hql.append(" and n.province.id = ? ");
	            paras.add(dto.getProvince().getId());
        	}
        }			
        if (StringUtils.isNotBlank(dto.getFullletter())) {
            hql.append(" and n.fullletter like ? ");
            paras.add("%" + dto.getFullletter() + "%");
        }					
        if (StringUtils.isNotBlank(dto.getLetter())) {
            hql.append(" and n.letter = ? ");
            paras.add(dto.getLetter());
        }		
        if (dto.getHasCenter() != null) {
        	hql.append(" and n.hasCenter = ? ");
        	paras.add(dto.getHasCenter());
        }
        return super.find(hql.toString(), paras.toArray(), page);
	}
	
    public List<City> find(CityDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From City n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getName())) {
            hql.append(" and n.name like ? ");
            paras.add("%" + dto.getName() + "%");
        }					
        if (dto.getProvince() != null) {
        	if (dto.getProvince().getId() != null) {
	            hql.append(" and n.province.id = ? ");
	            paras.add(dto.getProvince().getId());
        	}
        }			
        if (dto.getIsHot() != null) {
            hql.append(" and n.isHot = ? ");
            paras.add(dto.getIsHot());
        }else{
        	hql.append(" and n.isHot = 1 ");
        }
        if (StringUtils.isNotBlank(dto.getFullletter())) {
            hql.append(" and n.fullletter like ? ");
            paras.add("%" + dto.getFullletter() + "%");
        }					
        if (StringUtils.isNotBlank(dto.getLetter())) {
            hql.append(" and n.letter = ? ");
            paras.add(dto.getLetter());
        }		
        if (dto.getHasCenter() != null) {
        	hql.append(" and n.hasCenter = ? ");
        	paras.add(dto.getHasCenter());
        }
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public City findOne(CityDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<City> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
    
    public List<City> getCitysFromUserType(int userType) {
    	StringBuffer sqlBuffer = new StringBuffer();
    	sqlBuffer.append("select distinct u.city from User u where type = ?");
    	return super.find(sqlBuffer.toString(), new Object[]{userType}, null);
    }

	public City findByName(String cityName) {
		throw new RuntimeException("自己实现");
	}

	public List<City> hasHotCity(Long id) {
		String hql = "select c.name from City c where c.province.id = " + id + " and c.isHot = 1";
		return super.find(hql, null, null);
	}
}
