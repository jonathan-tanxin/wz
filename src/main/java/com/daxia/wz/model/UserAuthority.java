package com.daxia.wz.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "userauthority")
public class UserAuthority extends BaseModel {
    @Id
    @GeneratedValue
    private Long id;
    private Long userId;
    private Long authorityId;
    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    public Long getAuthorityId() {
        return authorityId;
    }
    public void setAuthorityId(Long authorityId) {
        this.authorityId = authorityId;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    
}
