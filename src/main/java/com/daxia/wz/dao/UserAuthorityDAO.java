package com.daxia.wz.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.daxia.wz.model.UserAuthority;

@Repository
public class UserAuthorityDAO extends GenericDAOHibernate<UserAuthority> {

    public List<UserAuthority> findByUserId(Long userId) {
        String hql = "from UserAuthority where userId = ?";
        return find(hql, new Object[] {userId}, null);
    }

}
