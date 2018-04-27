package com.daxia.wz.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.daxia.wz.model.RoleAuthority;

@Repository
public class RoleAuthorityDAO extends GenericDAOHibernate<RoleAuthority> {

    public List<RoleAuthority> findByRoleId(Long roleId) {
        String hql = "from RoleAuthority where roleId = ?";
        return find(hql, new Object[] {roleId}, null);
    }

    public void deleteByRoleId(Long roleId) {
        String hql = "delete from RoleAuthority where roleId = ?";
        super.executeUpdate(hql, new Object[] {roleId});
    }

}
