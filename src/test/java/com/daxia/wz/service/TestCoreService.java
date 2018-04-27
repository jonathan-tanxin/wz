package com.daxia.wz.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.daxia.wz.dao.CustomerDAO;
import com.daxia.wz.dao.ProfitPhaseDAO;
import com.daxia.wz.job.ProfitPayJob;
import com.daxia.wz.model.Pay;
import com.daxia.wz.test.BaseTest;

public class TestCoreService extends BaseTest {

	@Autowired
	private CoreService coreService;
	
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private ProfitPhaseDAO profitPhaseDAO;
	@Autowired
	private ProfitPayJob profitPayJob;
	
	// @Test
	// public void testProfitPay() {
		// coreService.profitPay(profitPhaseDAO.findOne(new ProfitPhaseDTO()).getId());
		// profitPayJob.run();
	// }
	
	//@Test
	public void test() {
		Pay pay = new Pay();
		pay.setActualPayAmount(100d);
		pay.setCustomer(customerDAO.load(25L));
		
		coreService.calInviteProfit(pay);
	}
}
