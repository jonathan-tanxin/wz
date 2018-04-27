package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;
import org.apache.commons.lang3.StringUtils;
	
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.Course;
import com.daxia.wz.dto.CourseDTO;
import com.daxia.wz.support.Page;

@Repository
public class CourseDAO extends GenericDAOHibernate<Course> {

    public List<Course> find(CourseDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From Course n where 1 = 1 and isdel = 0 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (StringUtils.isNotBlank(dto.getTitle())) {
            hql.append(" and n.title like ? ");
            paras.add("%" + dto.getTitle() + "%");
        }					
        if (dto.getStatus() != null) {
            hql.append(" and n.status = ? ");
            paras.add(dto.getStatus());
        }
        hql.append(" order by n.id desc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public Course findOne(CourseDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<Course> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }
}
