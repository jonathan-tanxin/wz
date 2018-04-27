package com.daxia.wz.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.daxia.wz.dto.UserDTO;
import com.daxia.wz.model.User;
import com.daxia.wz.support.Page;

@Repository
public class UserDAO extends GenericDAOHibernate<User> {

    public List<User> find(UserDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From User n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getUsername())) {
            hql.append(" and n.username = ? ");
            paras.add(dto.getUsername());
        }					
        if (dto.getType() != null) {
            hql.append(" and n.type = ? ");
            paras.add(dto.getType());
        }
        
        hql.append(" and n.deleted != true ");
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public User findOne(UserDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<User> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }

    public User loadUserByUsername(String username) {
        UserDTO query = new UserDTO();
        query.setUsername(username);
        return this.findOne(query);
    }

    @Override
    public void update(User t) {
    	super.update(t);
    }
    
    @Override
    public void deleteById(Serializable id) {
    	String hql = "update User set deleted = true where id = ?";
    	super.executeUpdate(hql, new Object[] {id});
    }
}
