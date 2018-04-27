package com.daxia.wz.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daxia.core.exception.BizException;
import com.daxia.core.utils.ValidationUtils;
import com.daxia.kwx.dto.WxPayUser;
import com.daxia.kwx.service.WxService;
import com.daxia.wxpay.common.CardType;
import com.daxia.wz.common.OrderItemType;
import com.daxia.wz.common.OrderStatus;
import com.daxia.wz.common.PayStatus;
import com.daxia.wz.common.PayType;
import com.daxia.wz.common.ProfitDetailStatus;
import com.daxia.wz.common.ProfitDetailType;
import com.daxia.wz.common.ProfitPhaseStatus;
import com.daxia.wz.dao.CardDAO;
import com.daxia.wz.dao.CustomerBalanceDetailDAO;
import com.daxia.wz.dao.CustomerCardDAO;
import com.daxia.wz.dao.CustomerDAO;
import com.daxia.wz.dao.DishDAO;
import com.daxia.wz.dao.OrderDAO;
import com.daxia.wz.dao.OrderItemDAO;
import com.daxia.wz.dao.PayDAO;
import com.daxia.wz.dao.ProfitDAO;
import com.daxia.wz.dao.ProfitDetailDAO;
import com.daxia.wz.dao.ProfitPhaseDAO;
import com.daxia.wz.dao.ProfitSetDAO;
import com.daxia.wz.dto.DishNumDTO;
import com.daxia.wz.dto.ProfitSetDTO;
import com.daxia.wz.model.Card;
import com.daxia.wz.model.Customer;
import com.daxia.wz.model.CustomerBalanceDetail;
import com.daxia.wz.model.CustomerCard;
import com.daxia.wz.model.Dish;
import com.daxia.wz.model.Order;
import com.daxia.wz.model.OrderItem;
import com.daxia.wz.model.Pay;
import com.daxia.wz.model.Profit;
import com.daxia.wz.model.ProfitDetail;
import com.daxia.wz.model.ProfitPhase;
import com.daxia.wz.model.ProfitSet;

@Service
public class CoreService extends BaseService {
	private static Logger logger = Logger.getLogger(CoreService.class);
	
	@Autowired
	private CardDAO cardDAO;
	@Autowired
	private DishDAO dishDAO;
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private CustomerCardDAO customerCardDAO;
	@Autowired
	private ProfitDAO profitDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private OrderItemDAO orderItemDAO;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private CustomerBalanceDetailDAO customerBalanceDetailDAO;
	@Autowired
	private PayDAO payDAO;
	@Autowired
	private ProfitSetDAO profitSetDAO;
	@Autowired
	private ProfitPhaseDAO profitPhaseDAO;
	@Autowired
	private WxService wxService;
	@Autowired
	private ProfitDetailDAO profitDetailDAO;
	
	private static Lock lock = new ReentrantLock();
	
	
	@Transactional
	public Long saveOrderDirectBuy(long customerId, List<DishNumDTO> dishNumList, long addressId) {
		Date now = new Date();
		Customer customer = customerDAO.load(customerId);
		Order order = new Order();
		order.setCustomer(customer);
		order.setOrderNo(System.currentTimeMillis() + "");
		order.setStatus(OrderStatus.ToBePay.getValue());
		order.setTotalAmount(0d);
		order.setCreateTime(now);
		order.setDistributeStatus(1);
		long orderId = orderDAO.create(order);
		order = orderDAO.load(orderId);
		double totalAmount = 0;
		for (DishNumDTO dishNumDTO : dishNumList) {
			long dishId = dishNumDTO.getId();
			int num = dishNumDTO.getNum();
			Dish dish = dishDAO.load(dishId);
			if (dish.getStock() < num) {
				error(dish.getName() + "库存不足");
			}
			
			dish.setStock(dish.getStock() - num);
			
			dish.setTotalSold(dish.getTotalSold() + num);
			dish.setMonthSold(dish.getMonthSold() + num);
			dishDAO.update(dish);
			
			OrderItem item = new OrderItem();
			item.setAmount(dish.getPrice() * num);
			item.setDish(dish);
			item.setOrder(order);
			item.setType(dish.getCategory().isWater() ? OrderItemType.Water.getValue() : OrderItemType.Dish.getValue());
			item.setNum(num);
			orderItemDAO.create(item);
			
			totalAmount += item.getAmount();
		}
		
		order.setTotalAmount(totalAmount);
	
		return order.getId();	
	}
	
	/**
	 * 保存订单/下单
	 * @param customerId
	 * @param dishNumList
	 * @param addressId
	 */
	@Transactional
	public void saveOrder(long customerId, List<DishNumDTO> dishNumList, long addressId) {
		Date now = new Date();
	    // 检查斤数是否够
		int totalDishNum = 0;
		int totalWaterNum = 0;
		
		Customer customer = customerDAO.load(customerId);
		boolean hasWaterCard = customerService.hasWaterCard(customerId);
		boolean hasDishCard = customerService.hasDishCard(customerId);
		Order order = new Order();
		order.setCustomer(customer);
		order.setOrderNo(System.currentTimeMillis() + "");
		order.setStatus(OrderStatus.WaitConfirm.getValue());
		order.setTotalAmount(0d);
		order.setCreateTime(now);
		order.setDistributeStatus(1);
		order.setDishLeft(0d);
		order.setWaterLeft(0);
		long orderId = orderDAO.create(order);
		order = orderDAO.load(orderId);
		double totalAmount = 0;
		for (DishNumDTO dishNumDTO : dishNumList) {
			long dishId = dishNumDTO.getId();
			int num = dishNumDTO.getNum();
			Dish dish = dishDAO.load(dishId);
			if (dish.getStock() < num) {
				error(dish.getName() + "库存不足");
			}
			
			dish.setStock(dish.getStock() - num);
			
			if (dish.getCategory().isWater()) {
				totalWaterNum += num;
			} else {
				totalDishNum += num;
			}
			dish.setTotalSold(dish.getTotalSold() + num);
			dish.setMonthSold(dish.getMonthSold() + num);
			dishDAO.update(dish);
			
			OrderItem item = new OrderItem();
			item.setAmount(dish.getPrice() * num);
			item.setDish(dish);
			item.setOrder(order);
			item.setType(dish.getCategory().isWater() ? OrderItemType.Water.getValue() : OrderItemType.Dish.getValue());
			if (dish.getCategory().isWater() && !hasWaterCard) {
				throw new BizException("您不是桶装水会员，无法购买" + dish.getName());
			} 
			if (!dish.getCategory().isWater() && !hasDishCard) {
				throw new BizException("您不是菜品会员，无法购买" + dish.getName());
			}
			item.setNum(num);
			orderItemDAO.create(item);
			
			totalAmount += item.getAmount();
		}
		
		order.setTotalAmount(totalAmount);
		if (customer.getDishLeft() < totalDishNum) {
			error("剩余可购菜品斤数不足");
		}
		if (totalDishNum > 0 && totalDishNum < 5) {
			// 取消至少5斤的限制
			// error("请至少选择5斤以上菜品");
		}
		if (customer.getWaterLeft() < totalWaterNum) {
			error("剩余可购桶装水数不足");
		}
		
		// 更新水和water变化数
		if (totalDishNum > 0) {
			CustomerBalanceDetail bd = new CustomerBalanceDetail();
			bd.setAmount((double) totalDishNum);
			bd.setBalanceBefore(customer.getDishLeft().doubleValue());
			customer.setDishLeft(customer.getDishLeft() - totalDishNum);
			bd.setBalanceAfter(customer.getDishLeft().doubleValue());
			bd.setCustomer(customer);
			bd.setOrder(order);
			bd.setTime(now);
			bd.setType(OrderItemType.Dish.getValue());
			customerBalanceDetailDAO.create(bd);
		}
		if (totalWaterNum > 0) {
			CustomerBalanceDetail bd = new CustomerBalanceDetail();
			bd.setAmount((double) totalWaterNum);
			bd.setBalanceBefore(customer.getWaterLeft().doubleValue());
			customer.setWaterLeft(customer.getWaterLeft() - totalWaterNum);
			bd.setBalanceAfter(customer.getWaterLeft().doubleValue());
			bd.setCustomer(customer);
			bd.setOrder(order);
			bd.setTime(now);
			bd.setType(OrderItemType.Water.getValue());
			customerBalanceDetailDAO.create(bd);
		}
		
		order.setDishLeft(customer.getDishLeft().doubleValue());
		order.setWaterLeft(customer.getWaterLeft());
		
	}
	
	/**
	 * 支付完成
	 * 
	 * @param prepayId 
	 */
	@Transactional
	public void onPaySuccess(String prepayId) {
		try {
			lock.lock();
			doPaySuccess(prepayId);
		} finally {
			lock.unlock();
		}
	}

	private void doPaySuccess(String prepayId) {
		// 更新pay的状态
		Pay pay = payDAO.findByPrepayId(prepayId);
		if (pay == null) {
			logger.error("找不到pay, prepayId: " + prepayId);
			return;
		}
		if (pay.getStatus() == PayStatus.Payed.getValue()) {
			return;// 支付完了
		}
		pay.setActualPayAmount(pay.getAmount());
		pay.setStatus(PayStatus.Payed.getValue());
		
		if (pay.getCard() != null) {
			createCustomerCard(pay);
			// 计算邀新返利
			calInviteProfit(pay);
		} else { // 买菜的
			if (pay.getOrder() != null) {
				Order order = orderDAO.load(pay.getOrder().getId());
				order.setStatus(OrderStatus.WaitConfirm.getValue());
				orderDAO.update(order);
			}
		}
		
		payDAO.update(pay);
	}

	/**
	 * 创建会员卡
	 * @param pay
	 */
	private void createCustomerCard(Pay pay) {
		CustomerCard cc = new CustomerCard();
		cc.setCustomer(pay.getCustomer());
		cc.setCard(pay.getCard());
		cc.setMoney(BigDecimal.valueOf(pay.getActualPayAmount()));
		cc.setStartTime(new Date());
		cc.setEndTime(DateUtils.addYears(cc.getStartTime(), 1));
		cc.setCreateTime(cc.getStartTime());
		customerCardDAO.create(cc);
		
		Customer customer = customerDAO.load(cc.getCustomer().getId());
		if (pay.getCard().getType() == CardType.Water.getValue()) {
			
			CustomerBalanceDetail bd = new CustomerBalanceDetail();
			bd.setAmount((double) pay.getCard().getAmount());
			bd.setBalanceBefore(customer.getWaterLeft().doubleValue());
			customer.setWaterLeft((int) (customer.getWaterLeft() + pay.getCard().getAmount()));
			bd.setBalanceAfter(customer.getWaterLeft().doubleValue());
			bd.setCustomer(customer);
			bd.setTime(new Date());
			bd.setType(OrderItemType.Water.getValue());
			customerBalanceDetailDAO.create(bd);
			
			customer.setIsWaterMember(true);
		} else if (pay.getCard().getType() == CardType.Dish.getValue()) {
			CustomerBalanceDetail bd = new CustomerBalanceDetail();
			bd.setAmount((double) pay.getCard().getAmount());
			bd.setBalanceBefore(customer.getDishLeft().doubleValue());
			bd.setBalanceAfter(customer.getDishLeft().doubleValue());
			bd.setCustomer(customer);
			bd.setTime(new Date());
			bd.setType(OrderItemType.Dish.getValue());
			customerBalanceDetailDAO.create(bd);
			
			customer.setDishLeft((int) (customer.getDishLeft() + pay.getCard().getAmount()));
			customer.setIsDishMember(true);
		}
		customerDAO.update(customer);
	}

	/**
	 * 邀新返利：
A用户通过扫描B用户的二维码，关注公众号并成功购买会员套餐，
则B用户可获得A用户会员套餐50%的款项，统一做12期返还，
每期返还的金额为现金，以微信企业付款给用户的方式返给B用户。
系统进行登记。邀新返利的总层数就一层，即：A发展B，A享受邀新返利；B发展C，B享受邀新返利，A不再享有B发展的下级用户返利。
其中：
邀新返利的返还金额比例作为动态参数，可进行修改；
返还期数作为动态参数，可进行修改；
	 * @param pay
	 */
	public void calInviteProfit(Pay pay) {
		Customer customer = pay.getCustomer();
		if (customer.getRecCustomer() == null) {
			logger.error("没有推荐用户，不需要返利");
			return;
		}
		
		ProfitSet profitSet = profitSetDAO.findOne(new ProfitSetDTO());
		Double totalProfit = pay.getActualPayAmount() * (profitSet.getProfitRatio() * 1.0 / 100);
		int phases = profitSet.getProfitCount(); // 12期
		Profit p = new Profit();
		p.setPay(pay);
		p.setCreateTime(new Date());
		p.setInviteeCustomer(pay.getCustomer());
		p.setLastUpdateTime(new Date());
		p.setNotProfitPhases(phases);
		p.setProfitCustomer(customer.getRecCustomer());
		p.setProfitPerMonth(totalProfit / phases);
		p.setTotalPhases(phases);
		p.setTotalProfit(totalProfit);
		p.setIsAuto(profitSet.isAuto());
		long profitId = profitDAO.create(p);
		
		// 生成每一期要返利的
		for (int i = 1; i <= phases; i++) {
			Date planDate = DateUtils.addMonths(p.getCreateTime(), i);
			ProfitPhase pp = new ProfitPhase();
			pp.setActualTime(null);
			pp.setCreateTime(p.getCreateTime());
			pp.setFailMessage(null);
			pp.setPhase(i);
			pp.setPlanDate(planDate);
			pp.setProfit(new Profit(profitId));
			pp.setStatus(ProfitPhaseStatus.NotStart.getValue());
			profitPhaseDAO.create(pp);
		}
	}

	/**
	 * 创建支付
	 * @param orderNo
	 * @param cardId
	 * @param id
	 */
	@Transactional
	public void createPay(String orderNo, Long cardId, long customerId, String prepayId, Double amount, Long orderId) {
		Pay p = new Pay();
		if (cardId != null) {
			Card card = cardDAO.load(cardId);
			p.setCard(card);
			p.setAmount(card.getMoney().doubleValue());
		} else {
			ValidationUtils.assertTrue(amount != null, "金额不能为空");
			p.setAmount(amount);
			p.setOrder(new Order(orderId));
		}
		p.setCustomer(customerDAO.load(customerId));
		p.setPrepayId(prepayId);
		p.setPayNO(orderNo);
		p.setActualPayAmount(0d);
		p.setType(PayType.WX.getValue());
		p.setCreateTime(new Date());
		p.setPayUpdateTime(new Date());
		p.setStatus(PayStatus.NotPay.getValue());
		payDAO.create(p);
	}
	
	public static void main(String[] args) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = dateFormat.parse("2017-01-31");
		date = DateUtils.addMonths(date, 1);
		System.out.println(date);
	}

	/**
	 * 真的进行返利
	 * @param profitPhaseId
	 */
	@Transactional
	public WxPayUser profitPay(Long profitPhaseId, boolean auto) {
		ProfitPhase profitPhase = profitPhaseDAO.load(profitPhaseId);
		// 1，创建profitdetail
		String openid = profitPhase.getProfit().getProfitCustomer().getOpenid();
		double amount = profitPhase.getProfit().getProfitPerMonth();
		WxPayUser wxPayUser = wxService.payUser(openid, 
				amount, "PP000000" + profitPhaseId, "返利" + profitPhase.getPhase() + "/" + profitPhase.getProfit().getTotalPhases());
		ProfitDetail detail = new ProfitDetail();
		detail.setType(ProfitDetailType.Auto.getValue());
		detail.setCustomer(profitPhase.getProfit().getProfitCustomer());
		detail.setProfit(profitPhase.getProfit());
		detail.setProfitTime(new Date());
		detail.setStatus(wxPayUser.isSuccess() ? ProfitDetailStatus.Succeed.getValue() : ProfitDetailStatus.Failed.getValue());
		detail.setAmount(amount);
		detail.setPhase(profitPhase.getPhase());
		detail.setTotalPhases(profitPhase.getProfit().getTotalPhases());
		detail.setCreateTime(new Date());
		if (auto) {
			detail.setRemark("自动运行");
		} else {
			detail.setRemark("手动返利");
		}
		detail.setFailMessage(wxPayUser.getErrorMsg());
		profitDetailDAO.create(detail);

		// 2, 更新profitPhase
		profitPhase.setActualTime(new Date());
		profitPhase.setFailMessage(wxPayUser.getErrorMsg());
		profitPhase.setStatus(wxPayUser.isSuccess() ? ProfitPhaseStatus.Succeed.getValue() : ProfitPhaseStatus.Failed.getValue());
		profitPhaseDAO.update(profitPhase);
		
		// 3, 更新profit
		Profit profit = profitDAO.load(profitPhase.getProfit().getId());
		profit.setLastUpdateTime(new Date());
		if (wxPayUser.isSuccess()) {
			profit.setNotProfitPhases(profit.getNotProfitPhases() - 1); // 未结算的-1
		}
		profitDAO.update(profit);
		return wxPayUser;
	}
}
