package com.daxia.wz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daxia.wz.dao.AuthorityDAO;
import com.daxia.wz.dao.RoleAuthorityDAO;
import com.daxia.wz.model.Authority;
import com.daxia.wz.model.RoleAuthority;
import com.google.common.collect.Lists;

@Service
public class RoleAuthorityService {

    @Autowired
    private RoleAuthorityDAO roleAuthorityDAO;
    @Autowired
    private AuthorityDAO authorityDAO;
    
    public List<Authority> findByAuthoritiesByRoleId(Long roleId) {
        List<RoleAuthority> roleAuthorities = roleAuthorityDAO.findByRoleId(roleId);
        List<Authority> authorities = Lists.newArrayList();
        for (RoleAuthority roleAuthority : roleAuthorities) {
            authorities.add(authorityDAO.load(roleAuthority.getAuthorityId()));
        }
        return authorities;
    }

    @Transactional
    public void update(Long roleId, Long[] authorityIds) {
        roleAuthorityDAO.deleteByRoleId(roleId);

        for (Long id : authorityIds) {
            RoleAuthority ra = new RoleAuthority();
            ra.setRoleId(roleId);
            ra.setAuthorityId(id);
            roleAuthorityDAO.create(ra);
        }
    }
    
}
