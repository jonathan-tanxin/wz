package com.daxia.wz.job;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.daxia.wz.dao.ProfitPhaseDAO;
import com.daxia.wz.model.ProfitPhase;
import com.daxia.wz.service.CoreService;

/**
 * 返利，每天凌晨12：05开始运行 
 */
@Component
public class ProfitPayJob {

	@Autowired
	private CoreService coreService;
	@Autowired
	private ProfitPhaseDAO profitPhaseDAO;
	
	@Scheduled(cron = "0 05 0 * * ?")
	@Transactional
	public void run() {
		List<ProfitPhase> profitPhases = profitPhaseDAO.findTodayPay(new Date());
		for (ProfitPhase profitPhase : profitPhases) {
			coreService.profitPay(profitPhase.getId(), true);
		}
	}
}
