package com.daxia.wz.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.MappedSuperclass;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.daxia.wz.util.BigDecimalUtils;



/**
 * 
 * 
 * Aug 30, 2012
 *
 */
@MappedSuperclass
// @Inheritance
public abstract class BaseModel implements Serializable {
    private static final long serialVersionUID = 1L;
    /*
    @Id
    @GeneratedValue
    private Long id;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    */
    protected BigDecimal moneyValue(BigDecimal money) {
        return BigDecimalUtils.moneyValue(money);
    }
    
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
    
}
