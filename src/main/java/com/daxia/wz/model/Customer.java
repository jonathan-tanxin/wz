package com.daxia.wz.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import com.daxia.wz.model.BaseModel;

import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

/**
 * Customer
 */
@Entity
@Table(name = "customer") 
public class Customer extends BaseModel {
	
	public Customer() {
	}
	
	public Customer(Long id) {
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
	 * 昵称
	 */
	@Column(name = "nickName")
    private String nickName;
	/**
	 * 头像
	 */
	@Column(name = "headImage")
    private String headImage;
	/**
	 * openid
	 */
	@Column(name = "openid")
    private String openid;
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "createTime")
    private Date createTime;
	/**
	 * 最后更新时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "lastUpdateTime")
    private Date lastUpdateTime;
	/**
	 * 是否是菜品会员
	 */
	@Column(name = "isDishMember")
    private Boolean isDishMember;
	/**
	 * 是否是桶装水会员
	 */
	@Column(name = "isWaterMember")
    private Boolean isWaterMember;
	/**
	 * 菜品剩余可购
	 */
	@Column(name = "dishLeft")
    private Integer dishLeft;
	/**
	 * 桶装水剩余可购
	 */
	@Column(name = "waterLeft")
    private Integer waterLeft;
	/**
	 * 邀请码
	 */
	@Column(name = "inviteCode")
    private String inviteCode;
	/**
	 * 是否是专家
	 */
	@Column(name = "isExpert")
    private Boolean isExpert;
	/**
	 * 被设置为专家的时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")	
	@Column(name = "setExpertTime")
    private Date setExpertTime;
	
	@Column(name = "isdel")
	private Integer isdel;
	
	/**
	 * 推荐人
	 */
	@ManyToOne
	@JoinColumn(name = "recCustomer_id")
	private Customer recCustomer;
	
	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	
	public Long getId() {
    	return id;
    }
	
    public void setId(Long id) {
    	this.id = id;
    }
	
	public String getNickName() {
    	return nickName;
    }
	
    public void setNickName(String nickName) {
    	this.nickName = nickName;
    }
	
	public String getHeadImage() {
    	return headImage;
    }
	
    public void setHeadImage(String headImage) {
    	this.headImage = headImage;
    }
	
	public String getOpenid() {
    	return openid;
    }
	
    public void setOpenid(String openid) {
    	this.openid = openid;
    }
	
	public Date getCreateTime() {
    	return createTime;
    }
	
    public void setCreateTime(Date createTime) {
    	this.createTime = createTime;
    }
	
	public Date getLastUpdateTime() {
    	return lastUpdateTime;
    }
	
    public void setLastUpdateTime(Date lastUpdateTime) {
    	this.lastUpdateTime = lastUpdateTime;
    }
	
	public Boolean getIsDishMember() {
    	return isDishMember;
    }
	
    public void setIsDishMember(Boolean isDishMember) {
    	this.isDishMember = isDishMember;
    }
	
	public Boolean getIsWaterMember() {
    	return isWaterMember;
    }
	
    public void setIsWaterMember(Boolean isWaterMember) {
    	this.isWaterMember = isWaterMember;
    }
	
	public Integer getDishLeft() {
    	return dishLeft;
    }
	
    public void setDishLeft(Integer dishLeft) {
    	this.dishLeft = dishLeft;
    }
	
	public Integer getWaterLeft() {
    	return waterLeft;
    }
	
    public void setWaterLeft(Integer waterLeft) {
    	this.waterLeft = waterLeft;
    }
	
	public String getInviteCode() {
    	return inviteCode;
    }
	
    public void setInviteCode(String inviteCode) {
    	this.inviteCode = inviteCode;
    }
	
	public Boolean getIsExpert() {
    	return isExpert;
    }
	
    public void setIsExpert(Boolean isExpert) {
    	this.isExpert = isExpert;
    }
	
	public Date getSetExpertTime() {
    	return setExpertTime;
    }
	
    public void setSetExpertTime(Date setExpertTime) {
    	this.setExpertTime = setExpertTime;
    }

	public Customer getRecCustomer() {
		return recCustomer;
	}

	public void setRecCustomer(Customer recCustomer) {
		this.recCustomer = recCustomer;
	}
	
}
