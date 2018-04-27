package com.daxia.wz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.AuthorityDAO;
import com.daxia.wz.dao.UserAuthorityDAO;
import com.daxia.wz.model.Authority;
import com.daxia.wz.model.UserAuthority;
import com.google.common.collect.Lists;

@Service
public class UserAuthorityService {
    @Autowired
    private UserAuthorityDAO userAuthorityDAO;
    
    @Autowired
    private AuthorityDAO authorityDAO;
    
    public List<Authority> findAuthoritiesByUserId(Long userId) {
        List<UserAuthority> userAuthorities = userAuthorityDAO.findByUserId(userId);
        List<Authority> authorities = Lists.newArrayList();
        for (UserAuthority userAuthority : userAuthorities) {
            authorities.add(authorityDAO.load(userAuthority.getAuthorityId()));
        }
        return authorities;
    }
}
