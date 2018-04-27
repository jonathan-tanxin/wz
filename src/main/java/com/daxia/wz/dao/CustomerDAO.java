package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
import org.apache.commons.lang3.StringUtils;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.Customer;
import com.daxia.wz.dto.CustomerDTO;
import com.daxia.wz.support.Page;

@Repository
public class CustomerDAO extends GenericDAOHibernate<Customer> {

    public List<Customer> find(CustomerDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Customer n where 1 = 1 and isdel = 0 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getNickName())) {
            hql.append(" and n.nickName like ? ");
            paras.add("%" + dto.getNickName()+ "%");
        }		
        if (StringUtils.isNotBlank(dto.getOpenid())) {
            hql.append(" and n.openid = ? ");
            paras.add(dto.getOpenid());
        }		
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Customer findOne(CustomerDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Customer> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }

	public List<Customer> findMember(CustomerDTO dto, Page page) {
		StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Customer n where  (n.isDishMember = true or n.isWaterMember = true) ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getNickName())) {
            hql.append(" and n.nickName like ? ");
            paras.add("%" + dto.getNickName()+ "%");
        }		
        if (StringUtils.isNotBlank(dto.getOpenid())) {
            hql.append(" and n.openid like ? ");
            paras.add("%" +dto.getOpenid()+ "%");
        }		
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
	}

	public List<Customer> findExpert(CustomerDTO dto, Page page) {
		StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Customer n where n.isExpert = true ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getNickName())) {
            hql.append(" and n.nickName like ? ");
            paras.add("%" + dto.getNickName()+ "%");
        }		
        if (StringUtils.isNotBlank(dto.getOpenid())) {
            hql.append(" and n.openid like ? ");
            paras.add("%" +dto.getOpenid()+ "%");
        }		
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
	}
}
