package com.daxia.wz.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Profit
 */
@Entity
@Table(name = "profit_set")
public class ProfitSet extends BaseModel {

	public ProfitSet() {
	}

	public ProfitSet(Long id) {
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
	 * 返利比例
	 */

	@Column(name = "profit_ratio")
    private Integer profitRatio;
	/**
	 * 返利期数
	 */

	@Column(name = "profit_count")
    private Integer profitCount;
	/**
	 * 是否自动返利
	 */
	@Column(name = "is_auto")
    private boolean isAuto;

	/**
	 * 邀新返利说明文字
	 */
	@Column(name = "profit_desc")
	private String profitDesc;

	public Long getId() {
		return id;
	}

	public Integer getProfitRatio() {
		return profitRatio;
	}

	public Integer getProfitCount() {
		return profitCount;
	}

	public boolean isAuto() {
		return isAuto;
	}

	public String getProfitDesc() {
		return profitDesc;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setProfitRatio(Integer profitRatio) {
		this.profitRatio = profitRatio;
	}

	public void setProfitCount(Integer profitCount) {
		this.profitCount = profitCount;
	}

	public void setAuto(boolean auto) {
		isAuto = auto;
	}

	public void setProfitDesc(String profitDesc) {
		this.profitDesc = profitDesc;
	}



	
}
