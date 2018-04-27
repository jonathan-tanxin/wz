package com.daxia.wz.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.daxia.wz.dao.AuthorityDAO;
import com.daxia.wz.dao.UserDAO;
import com.daxia.wz.dto.AuthorityDTO;
import com.daxia.wz.dto.UserDTO;
import com.daxia.wz.model.Authority;
import com.daxia.wz.model.Role;
import com.daxia.wz.model.User;
import com.qiniu.util.Auth;



@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService, Serializable {
	private static Logger logger = Logger.getLogger(MyUserDetailsService.class);
    private static final long serialVersionUID = 1L;

    @Autowired
    private UserDAO userDAO;
    @Autowired
    private AuthorityDAO authorityDAO;
    @Autowired
    private UserService userService;
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private UserAuthorityService userAuthorityService;
	@Autowired
	private RoleAuthorityService roleAuthorityService;
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	try {
	        return doLoad(username);
        } catch (Exception e) {
        	logger.error(e, e);
        	throw new RuntimeException(e.getMessage(), e);
        }
    }

	private UserDetails doLoad(String username) {
	    User user = userDAO.loadUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Can't find user by username [" + username + "]");
        }
        
        UserDTO userDTO = userService.load(user.getId());
        
        // 最终用户拥有的所有权限
        List<GrantedAuthority> finalAuthorities = new ArrayList<GrantedAuthority>();
        
        // 找角色，然后找出每个角色拥有的权限
        List<Role> roles = userRoleService.findRolesByUserId(user.getId());
        for (Role role : roles) {
            List<Authority> authorities = roleAuthorityService.findByAuthoritiesByRoleId(role.getId());
            addToFinalAuthorities(finalAuthorities, authorities);
        }
        
        // 找权限
        // List<Authority> authorities = userAuthorityService.findAuthoritiesByUserId(user.getId());
        List<Authority> authorities = authorityDAO.find(new AuthorityDTO(), null);
        addToFinalAuthorities(finalAuthorities, authorities);
        
        if (user instanceof User) {
        	finalAuthorities.add(new GrantedAuthority() {
					
				@Override
				public String getAuthority() {
					return "manager";
				}
			});
        }
        user.setAuthorities(finalAuthorities);
        
        return user;
    }

    private void addToFinalAuthorities(List<GrantedAuthority> finalAuthorities, List<Authority> authorities) {
        for (Authority authority : authorities) {
            addToFinalAuthorities(finalAuthorities, authority);
        }
    }
    
    private void addToFinalAuthorities(List<GrantedAuthority> finalAuthorities, Authority authority) {
        final String code = authority.getCode();
        if (StringUtils.isNotBlank(code)) {
            finalAuthorities.add(new GrantedAuthority() {
                private static final long serialVersionUID = 1L;
                @Override
                public String getAuthority() {
                    return code;
                }
            });
        }
        
//        if (CollectionUtils.isNotEmpty(authority.getChildrens())) {
//            for (Authority child : authority.getChildrens()) {
//                addToFinalAuthorities(finalAuthorities, child);
//            }
//        }
    }

}
