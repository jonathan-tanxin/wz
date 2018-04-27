package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * 
 * 
 * @date 2012-9-9
 */
@Entity
@Table(name = "userrole")
public class UserRole extends BaseModel {
    @Id
    @GeneratedValue
	@Column(name = "id")
    private Long id;
    @Column(name = "userid")
    private Long userId;
    @Column(name = "roleid")
    private Long roleId;
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    public Long getRoleId() {
        return roleId;
    }
    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
    
}
