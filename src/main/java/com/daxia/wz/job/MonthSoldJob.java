package com.daxia.wz.job;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.daxia.wz.dao.ProfitPhaseDAO;
import com.daxia.wz.model.ProfitPhase;
import com.daxia.wz.service.CoreService;
import com.daxia.wz.service.DishService;

/**
 * 每个月第一天更新月销量 
 */
@Component
public class MonthSoldJob {

	@Autowired
	private CoreService coreService;
	@Autowired
	private ProfitPhaseDAO profitPhaseDAO;
	@Autowired
	private DishService dishService;
	
	@Scheduled(cron = "0 15 0 * * ?")
	@Transactional
	public void run() {
		Date date = new Date();
		if (DateUtils.isSameDay(date, com.daxia.wz.util.DateUtils.getBeginingOfAMonth(date))) {
			dishService.updateMonthSold();
		}
	}
}
