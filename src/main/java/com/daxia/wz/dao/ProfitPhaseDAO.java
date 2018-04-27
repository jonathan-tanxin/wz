package com.daxia.wz.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Repository;

import com.daxia.wz.common.ProfitPhaseStatus;
import com.daxia.wz.dao.GenericDAOHibernate;
import com.daxia.wz.model.ProfitPhase;
import com.daxia.wz.dto.ProfitPhaseDTO;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.DateUtils;

@Repository
public class ProfitPhaseDAO extends GenericDAOHibernate<ProfitPhase> {

    public List<ProfitPhase> find(ProfitPhaseDTO dto, Page page) {
        StringBuilder hql = new StringBuilder();
        List<Object> paras = new ArrayList<Object>();
        hql.append("From ProfitPhase n where 1 = 1 ");
        if (dto.getId() != null) {
            hql.append(" and n.id = ? ");
            paras.add(dto.getId());
        }
        if (dto.getProfit() != null) {
        	if (dto.getProfit().getId() != null) {
	            hql.append(" and n.profit.id = ? ");
	            paras.add(dto.getProfit().getId());
        	}
        }			
        if (dto.getStatus() != null) {
            hql.append(" and n.status = ? ");
            paras.add(dto.getStatus());
        }
        if (dto.getPhase() != null) {
            hql.append(" and n.phase = ? ");
            paras.add(dto.getPhase());
        }
        hql.append(" order by n.phase asc ");
        return super.find(hql.toString(), paras.toArray(), page);
    }
    
    public ProfitPhase findOne(ProfitPhaseDTO dto) {
		Page page = new Page();
		page.setPageSize(1);
		page.setPage(1);
		
		List<ProfitPhase> list = this.find(dto, page);
	    return CollectionUtils.isEmpty(list) ? null : list.get(0);
    }

    /**
     * 查找今天要返利的
     * @param date
     * @return
     */
	public List<ProfitPhase> findTodayPay(Date date) {
		String hql = "from ProfitPhase n where n.status = ? and n.planDate >= ? and n.planDate <= ?";
		return super.find(hql, new Object[] {ProfitPhaseStatus.NotStart.getValue(), DateUtils.getBeginningOfADay(date), DateUtils.getEndOfADay(date)}, null);
	}
}
