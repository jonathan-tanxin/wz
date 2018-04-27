package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import com.daxia.wz.model.Menu;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import com.daxia.wz.model.Role;

/**
 * RoleMenu
 */
@Entity
@Table(name = "rolemenu") 
public class RoleMenu extends BaseModel {
	
	public RoleMenu() {
	}
	
	public RoleMenu(Long id) {
		this.id = id;
	}
	
	/**
	 * id
	 */
	@Id
	@GeneratedValue
	@Column(name = "id")
    private Long id;
	/**
	 * 角色
	 */
	@ManyToOne
	@JoinColumn(name = "role_id")
    private Role role;
	/**
	 * 菜单
	 */
	@ManyToOne
	@JoinColumn(name = "menu_id")
    private Menu menu;
	
	public Long getId() {
    	return id;
    }
	
    public void setId(Long id) {
    	this.id = id;
    }
	
	public Role getRole() {
    	return role;
    }
	
    public void setRole(Role role) {
    	this.role = role;
    }
	
	public Menu getMenu() {
    	return menu;
    }
	
    public void setMenu(Menu menu) {
    	this.menu = menu;
    }
	
}
