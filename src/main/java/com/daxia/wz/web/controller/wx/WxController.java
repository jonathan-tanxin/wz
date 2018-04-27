package com.daxia.wz.web.controller.wx;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.daxia.core.exception.BizException;
import com.daxia.kwx.dto.OrderQueryResult;
import com.daxia.kwx.dto.UnifiedorderParams;
import com.daxia.kwx.dto.UnifiedorderResult;
import com.daxia.kwx.dto.WxMenu;
import com.daxia.wz.common.SystemConfigType;
import com.daxia.wz.config.AllConfig;
import com.daxia.wz.dto.AddressDTO;
import com.daxia.wz.dto.CardDTO;
import com.daxia.wz.dto.CustomerDTO;
import com.daxia.wz.dto.DishDTO;
import com.daxia.wz.dto.DishNumDTO;
import com.daxia.wz.dto.HealthChartDTO;
import com.daxia.wz.dto.PayDTO;
import com.daxia.wz.dto.ProfitDTO;
import com.daxia.wz.dto.ProfitSetDTO;
import com.daxia.wz.model.Dish;
import com.google.common.collect.Lists;

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;

@Controller
@RequestMapping(value = "/wx/", produces = "text/html;charset=UTF-8")
public class WxController extends WxBaseController {

	@ResponseBody
	@RequestMapping("updateMenu")
	public String updateMenu() throws Exception {
		String host = "http://www.wzsw28.com";
		JSONObject json = new JSONObject();
		JSONArray buttons = new JSONArray();

		{
			JSONObject button = new JSONObject();
			button.put("name", "打折呀");
			JSONArray subArray = new JSONArray();
			JSONObject subButton = new JSONObject();
			subButton.put("type", "view");
			subButton.put("name", "打折呀");
			subButton.put("url", wxService.getAuthUrl(host + "/wx/index"));
			System.out.println(wxService.getAuthUrl(host + "/wx/index"));
			subArray.add(subButton);

			button.put("sub_button", subArray);
			buttons.add(button);
		}

		json.put("button", buttons);

		List<WxMenu> wxMenus = new ArrayList<>();
		// 菜单 - 会员点菜，菜品展示
		{
			WxMenu m = new WxMenu();
			m.setName("菜单");
			m.setSub_button(new ArrayList<WxMenu>());

			{
				WxMenu s = new WxMenu();
				s.setName("会员点菜");
				s.setType("view");
				s.setUrl(wxService.getAuthUrl(host + "/wx/dishSelect"));
				m.getSub_button().add(s);
			}

			{
				WxMenu s = new WxMenu();
				s.setName("菜品展示");
				s.setType("view");
				s.setUrl(wxService.getAuthUrl(host + "/wx/dishList"));
				m.getSub_button().add(s);
			}
			wxMenus.add(m);
		}

		{
			WxMenu m = new WxMenu();
			m.setName("会员健康");
			m.setSub_button(new ArrayList<WxMenu>());

			{
				WxMenu s = new WxMenu();
				s.setName("健康讲座");
				s.setType("view");
				s.setUrl(wxService.getAuthUrl(host + "/wx/courseList"));
				m.getSub_button().add(s);
			}

			{
				WxMenu s = new WxMenu();
				s.setName("会员健康");
				s.setType("view");
				s.setUrl(wxService.getAuthUrl(host + "/wx/courseList"));
				m.getSub_button().add(s);
			}
			wxMenus.add(m);
		}

		{
			WxMenu m = new WxMenu();
			m.setName("个人中心");
			m.setSub_button(new ArrayList<WxMenu>());

			{
				WxMenu s = new WxMenu();
				s.setName("会员中心");
				s.setType("view");
				s.setUrl(wxService.getAuthUrl(host + "/wx/memberCenter"));
				m.getSub_button().add(s);
			}

			{
				WxMenu s = new WxMenu();
				s.setName("配送中心");
				s.setType("view");
				s.setUrl(wxService.getAuthUrl(host + "/wx/distributionCenter"));
				m.getSub_button().add(s);
			}
			wxMenus.add(m);
		}

		wxService.updateMenu(wxMenus);

	
		return "ok";
	}
	
	@RequestMapping("dishDetail")
	public String dishDetail(Long id, Map<String, Object> map) throws Exception {
		Dish d = dishService.load(id);
		map.put("n", d);
		if (StringUtils.isNotBlank(d.getImages())) {
			map.put("image", d.getImages().split(",")[0]);
			map.put("images", d.getImages().split(","));
		}
		return "wx/wx_dishDetail";
	}
	
	@RequestMapping("index")
	public String index(Map<String, Object> map) throws Exception {
		return "wx/wx_index";
	}

	@RequestMapping("dishList")
	public String dishList(Map<String, Object> map, String code) throws Exception {
		checkAuth(code);
		title("菜品展示");
		return "wx/wx_dishList";
	}

	@RequestMapping("dishSelect")
	public String dishSelect(String code, Map<String, Object> map) throws Exception {
		super.checkAuth(code);
		map.put("customer", getCurrentCustomer());
		map.put("address", addressService.findByCustomer(getCurrentCustomer().getId()));
		map.put("remark", systemConfigService.get(SystemConfigType.DishNotice));
		return "wx/wx_dishSelect";
	}

	@RequestMapping("addressAdd")
	public String addressAdd(Map<String, Object> map) throws Exception {
		title("收货地址");
		map.put("provinces", provinceService.findHasIsHOtProvince());
		map.put("centers", distributionCenterService.findAll());
		return "wx/wx_addressAdd";
	}

	@RequestMapping("addressEdit")
	public String addressEdit(Map<String, Object> map) throws Exception {
		title("修改地址");
		map.put("provinces", provinceService.findHasIsHOtProvince());
		map.put("n", addressService.findByCustomer(getCurrentCustomer().getId()));
		return "wx/wx_addressEdit";
	}

	@RequestMapping("addressList")
	public String addressList(Map<String, Object> map) throws Exception {
		// 每个人只能有一个收货地址
		AddressDTO address = addressService.findByCustomer(getCurrentCustomer().getId());
		if (address == null) {
			return "redirect:/wx/addressAdd";
		}
		map.put("address", address);
		return "wx/wx_addressList";
	}

	@RequestMapping("courseList")
	public String courseList(Map<String, Object> map) throws Exception {
		title("健康讲座");
		map.put("courseList", courseService.findValid());
		 return "wx/wx_courseList";
		//return "wx/wx_wait";
	}

	@RequestMapping("distributionCenter")
	public String distributionCenter(Map<String, Object> map, String code) throws Exception {
		checkAuth(code);
		map.put("customer", getCurrentCustomer());
		map.put("address", addressService.findByCustomer(getCurrentCustomer().getId()));
		return "wx/wx_distributionCenter";
	}

	@RequestMapping("foot")
	public String foot(Map<String, Object> map) throws Exception {
		return "wx/wx_foot";
	}

	@RequestMapping("head")
	public String head(Map<String, Object> map) throws Exception {
		return "wx/wx_head";
	}

	@RequestMapping("health")
	public String health(String code, Map<String, Object> map) throws Exception {
		checkAuth(code);
		map.put("customer", getCurrentCustomer());
		List<CustomerDTO> customers = customerService.find(200);
		List<HealthChartDTO> charts = new ArrayList<>();
		for (CustomerDTO customerDTO : customers) {
			HealthChartDTO chartDTOs = healthService.find7daysByCustomer(customerDTO.getId());
			if (StringUtils.isBlank(chartDTOs.getDays())) {
				continue;
			}
			charts.add(chartDTOs);
		}
		map.put("charts", charts);
		return "wx/wx_health";
	}

	@RequestMapping("memberCenter")
	public String memberCenter(Map<String, Object> map, String code) throws Exception {
		checkAuth(code);
		map.put("customer", getCurrentCustomer());
		map.put("hasWaterCard", customerService.hasWaterCard(getCurrentCustomer().getId()));
		map.put("hasDishCard", customerService.hasDishCard(getCurrentCustomer().getId()));
		return "wx/wx_memberCenter";
	}

	@Transactional
	@RequestMapping("/pay/memberPay")
	public String memberPay(long cardId, Map<String, Object> map) throws Exception {
		CardDTO card = cardService.load(cardId);
		map.put("card", card);
		wxService.setJsSdkSinatureInfo(getRequestUrlWithQueryString(), map);
		
		UnifiedorderParams p = new UnifiedorderParams();
		p.setBody("购买会员卡");
		String orderNo = "tes123" + System.currentTimeMillis();
		p.setOut_trade_no(orderNo);
		p.setTotal_fee((int) (card.getMoney().doubleValue() * 100)); // 1分
		p.setSpbill_create_ip("8.8.8.8");
		String notifyUrl = AllConfig.WX_PAY_NOTICE_URL;
		p.setNotify_url(notifyUrl);
		p.setTrade_type("JSAPI");
		p.setOpenid(getCurrentCustomer().getOpenid());
		
		
		UnifiedorderResult unifiedorderResult = wxService.unifiedorder(p);
		
		coreService.createPay(orderNo, cardId, getCurrentCustomer().getId(), unifiedorderResult.getPrepayId(), null, null);
		
		map.put("prepayId", unifiedorderResult.getPrepayId());
		map.put("nonce_str_pay", unifiedorderResult.getNonceStr());
		
		Map<String, Object> signMap = new HashMap<String, Object>();
		signMap.put("appId", wxService.getAppid());
		signMap.put("timeStamp", map.get("timestamp"));
		signMap.put("nonceStr", unifiedorderResult.getNonceStr());
		signMap.put("package", "prepay_id=" + unifiedorderResult.getPrepayId());
		signMap.put("signType", "MD5");
		map.put("sign", wxService.sign(signMap));
		return "wx/wx_memberPay";
	}

	@RequestMapping("memberType")
	public String memberType(Integer cardType, Map<String, Object> map) throws Exception {
		map.put("hasWaterCard", customerService.hasWaterCard(getCurrentCustomer().getId()));
		map.put("hasDishCard", customerService.hasDishCard(getCurrentCustomer().getId()));
		map.put("cardType", cardType);
		map.put("cards", cardService.findByType(cardType));
		map.put("hasAddress", addressService.findByCustomer(getCurrentCustomer().getId()) != null);
		return "wx/wx_memberType";
	}

	@RequestMapping("orderList")
	public String orderList(Map<String, Object> map) throws Exception {
		return "wx/wx_orderList";
	}

	/**
	 * 
	 * @param prepayId
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("paySuccess")
	public String paySuccess(String prepayId, Map<String, Object> map) throws Exception {
		PayDTO pay = payService.findByPrepayId(prepayId);
		OrderQueryResult result = wxService.queryOrder(pay.getPayNO());
		if (result.isSuccess()) {
			coreService.onPaySuccess(prepayId);
		} else {
			throw new BizException(result.getErrorMsg());
		}
		return "wx/wx_paySuccess";
	}

	@RequestMapping("profit")
	public String profit(Map<String, Object> map) throws Exception {
		map.put("customer", getCurrentCustomer());
		List<ProfitDTO> profits = profitService.findByCustomer(getCurrentCustomer().getId());
		map.put("profits", profits);
		map.put("profitSet", profitSetService.findOne(new ProfitSetDTO()));
		return "wx/wx_profit";
	}

	@RequestMapping("shareHealth")
	public String shareHealth(Map<String, Object> map) throws Exception {
		return "wx/wx_shareHealth";
	}
	
	@RequestMapping("myHealth")
	public String myHealth(Map<String, Object> map) throws Exception {
		map.put("customer", getCurrentCustomer());
		HealthChartDTO chartDTO = healthService.find7daysByCustomer(getCurrentCustomer().getId());
		map.put("chartDTO", chartDTO);
		return "wx/wx_myHealth";
	}
	
	@RequestMapping("newHealth")
	public String newHealth(Map<String, Object> map) throws Exception {
		map.put("customer", getCurrentCustomer());
		return "wx/wx_newHealth";
	}

	@ResponseBody
	@RequestMapping("queryOrder")
	public String queryOrder(String orderNo) throws Exception {
		wxService.queryOrder(orderNo);
		return "ok";
	}
	
	@RequestMapping("myQrCode")
	public String myQrCode(HttpServletResponse response) throws Exception {
		// String url = getCtx() + "/wx/index";
		String url = getCtx() + "/wx/invitedBy?id=" + getCurrentCustomer().getId();
		url = wxService.getAuthUrl(url);
		QRCode.from(url).to(ImageType.JPG).writeTo(response.getOutputStream());
		return null;
	}
	
	/**
	 * 被id邀请了
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("invitedBy")
	public String invitedBy(Long id, String code) throws Exception {
		checkAuth(code, id);
		
		return "wx/wx_invitedBy";
	}
	
	/**
	 * 
	 * @param id dish id
	 * @param num 数量
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pay/directBuy")
	public String directBuy(Long id, Integer num, Map<String, Object> map) throws Exception {
		map.put("dishId", id);
		map.put("num", num);
		AddressDTO address = addressService.findByCustomer(getCurrentCustomer().getId());
		if (address == null) {
			map.put("provinces", provinceService.findAll());
			return "wx/wx_directBuy_addAddress";
		}
		DishDTO dish = dishService.load(id);
		map.put("dish", dish);
		
		wxService.setJsSdkSinatureInfo(getRequestUrlWithQueryString(), map);
		
		UnifiedorderParams p = new UnifiedorderParams();
		p.setBody("购买菜品");
		String orderNo = "dish123" + System.currentTimeMillis();
		p.setOut_trade_no(orderNo);
		p.setTotal_fee((int) (dish.getPrice() * num * 100)); // 1分
		p.setSpbill_create_ip("8.8.8.8");
		String notifyUrl = AllConfig.WX_PAY_NOTICE_URL;
		p.setNotify_url(notifyUrl);
		p.setTrade_type("JSAPI");
		p.setOpenid(getCurrentCustomer().getOpenid());
		
		
		UnifiedorderResult unifiedorderResult = wxService.unifiedorder(p);
		
		Long orderId = coreService.saveOrderDirectBuy(getCurrentCustomer().getId(), Lists.newArrayList(new DishNumDTO(id, num)), address.getId());
		
		coreService.createPay(orderNo, null, getCurrentCustomer().getId(), unifiedorderResult.getPrepayId(), dish.getPrice() * num, orderId);
		
		map.put("prepayId", unifiedorderResult.getPrepayId());
		map.put("nonce_str_pay", unifiedorderResult.getNonceStr());
		
		Map<String, Object> signMap = new HashMap<String, Object>();
		signMap.put("appId", wxService.getAppid());
		signMap.put("timeStamp", map.get("timestamp"));
		signMap.put("nonceStr", unifiedorderResult.getNonceStr());
		signMap.put("package", "prepay_id=" + unifiedorderResult.getPrepayId());
		signMap.put("signType", "MD5");
		map.put("sign", wxService.sign(signMap));
		
		return "wx/wx_directBuy";
	}
	
	@RequestMapping("directBuyPaySuccess")
	public String directBuyPaySuccess(String prepayId, Map<String, Object> map) throws Exception {
		PayDTO pay = payService.findByPrepayId(prepayId);
		OrderQueryResult result = wxService.queryOrder(pay.getPayNO());
		if (result.isSuccess()) {
			coreService.onPaySuccess(prepayId);
		} else {
			throw new BizException(result.getErrorMsg());
		}
		return "wx/wx_paySuccess";
	}

}
