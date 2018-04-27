package com.daxia.wz.web.controller.wx;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.daxia.wz.common.OrderStatus;
import com.daxia.wz.dto.AddressDTO;
import com.daxia.wz.dto.CategoryDTO;
import com.daxia.wz.dto.DishDTO;
import com.daxia.wz.dto.DishNumDTO;
import com.daxia.wz.dto.DistributionCenterDTO;
import com.daxia.wz.dto.DistrictDTO;
import com.daxia.wz.dto.HealthCommentDTO;
import com.daxia.wz.dto.HealthDTO;
import com.daxia.wz.dto.OrderDTO;
import com.daxia.wz.model.City;
import com.daxia.wz.model.Customer;
import com.daxia.wz.model.District;
import com.daxia.wz.model.HealthComment;
import com.daxia.wz.model.OrderItem;
import com.daxia.wz.support.Page;
import com.daxia.wz.util.KJsonUtils;

@Controller
@RequestMapping(value = "/wx/", produces = "text/html;charset=UTF-8")
public class WxDataController extends WxBaseController {
	/**
	 * 获取所有的菜品分类和菜。只显示会员的
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getCategories")
	public String getCategories() throws Exception {
		List<CategoryDTO> categories = categoryService.findAll();
		JSONArray categoryArr = new JSONArray();
		for (CategoryDTO categoryDTO : categories) {
			JSONObject jsonC = KJsonUtils.java2jsonBasicType(categoryDTO);
			List<DishDTO> dishDTOs = dishService.findByCategoryAndMember(categoryDTO.getId());
			JSONArray array = new JSONArray();
			for (DishDTO dishDTO : dishDTOs) {
				JSONObject json = KJsonUtils.java2jsonBasicType(dishDTO);
				json.put("num", 0); // 当前选择数量
				
				array.add(json);
			}
			
			if (array.size() == 0) {
				continue;
			}
			jsonC.put("dishes", array);
			jsonC.put("isWater", categoryDTO.isWater());
			categoryArr.add(jsonC);
		}
		
		return categoryArr.toJSONString();
	}
	
	/**
	 * 获取所有的菜品分类和菜。会员非会员的一起展示
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getCategories2")
	public String getCategories2() throws Exception {
		List<CategoryDTO> categories = categoryService.findAll();
		JSONArray categoryArr = new JSONArray();
		for (CategoryDTO categoryDTO : categories) {
			JSONObject jsonC = KJsonUtils.java2jsonBasicType(categoryDTO);
			List<DishDTO> dishDTOs = dishService.findByCategory(categoryDTO.getId());
			JSONArray array = new JSONArray();
			for (DishDTO dishDTO : dishDTOs) {
				JSONObject json = KJsonUtils.java2jsonBasicType(dishDTO);
				json.put("num", 0); // 当前选择数量
				
				array.add(json);
			}
			
			if (array.size() == 0) {
				continue;
			}
			jsonC.put("dishes", array);
			jsonC.put("isWater", categoryDTO.isWater());
			categoryArr.add(jsonC);
		}
		
		return categoryArr.toJSONString();
	}
	
	/**
	 * 下单
	 * @param dishInfo dishId-num,dishId-num
	 * @param addressId
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("saveOrder")
	public String saveOrder(String dishInfo, Long addressId) throws Exception {
		assertTrue(StringUtils.isNotBlank(dishInfo), "请选择菜品");
		assertTrue(addressId != null, "请填写收货地址");
		
		List<DishNumDTO> dishNumList = new ArrayList<>();
		String[] arr = dishInfo.split(",");
		for (String string : arr) {
			String[] arr2 = string.split("-");
			dishNumList.add(new DishNumDTO(Long.parseLong(arr2[0]), Integer.parseInt(arr2[1])));
		}
		
		coreService.saveOrder(getCurrentCustomer().getId(), dishNumList, addressId);
		
		return okJson();
	}
	
	@ResponseBody
	@RequestMapping("saveAddress")
	public String saveAddress(Boolean directBuy, Long id, String name, String mobile, Long districtId, String address, Long centerId) throws Exception {
		if (directBuy == null) {
			directBuy = false;
		}
		required(name, "请输入姓名");
		required(mobile, "请输入手机号码");
		required(districtId, "请选择地区");
		required(address, "请输入地址");
		if (!directBuy) {
			required(centerId, "请选择配送中心");
		}
		AddressDTO a = null;
		
		if (id != null) {
			a = addressService.load(id);
		} else {
			a = new AddressDTO(); 
		}
		
		a.setCustomer(getCurrentCustomer());
		a.setName(name);
		a.setMobile(mobile);
		a.setAddress(address);
		
		DistrictDTO d = districtService.load(districtId);
		a.setProvince(d.getCity().getProvince());
		a.setCity(d.getCity());
		a.setDistrict(d);
		if (!directBuy) {
			a.setDistributionCenter(distributionCenterService.load(centerId));
		}
		if (id == null) {
			addressService.create(a);
		} else {
			addressService.updateAllFields(a);
		}
		
		return okJson();
	}
	
	@ResponseBody
	@RequestMapping("getOrderList")
	public String getOrderList(Page page) throws Exception {
		OrderDTO query = new OrderDTO();
		query.setCustomer(getCurrentCustomer());
		List<OrderDTO> orderDTOs = orderService.find(query, page);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		JSONArray array = new JSONArray();
		for (OrderDTO orderDTO : orderDTOs) {
			int buyDish = 0;
			int buyWater = 0;
			
			JSONArray itemArray = new JSONArray();
			for (OrderItem item : orderDTO.getOrderItems()) {
				if (item.getDish().getCategory().isWater()) {
					buyWater += item.getNum();
				} else {
					buyDish += item.getNum();
				}
				JSONObject itemJson = new JSONObject();
				itemJson.put("dishName", item.getDish().getName());
				itemJson.put("num", item.getNum());
				itemJson.put("unit", item.getDish().getUnit());
				itemArray.add(itemJson);
			}
			JSONObject json = new JSONObject();
			json.put("buyDish", buyDish);
			json.put("buyWater", buyWater);
			json.put("dishLeft", orderDTO.getDishLeft());
			json.put("waterLeft", orderDTO.getWaterLeft());
			json.put("showDetails", false);
			json.put("createTime", dateFormat.format(orderDTO.getCreateTime()));
			json.put("status", OrderStatus.getByValue(orderDTO.getStatus()).getRemark());
			json.put("items", itemArray);
			array.add(json);
			
		}
		return ok(array);
	}
	
	@ResponseBody
	@RequestMapping("getCenters")
	public String getCenters(Long districtId, Long cityId) throws Exception {
		JSONArray array = new JSONArray();
		DistributionCenterDTO query = new DistributionCenterDTO();
		query.setQueryForDistrict(new District());
		query.getQueryForDistrict().setId(districtId);
		query.setCity(new City());
		query.getCity().setId(cityId);
		//根据城市id和地区id选出符合条件的配送中心
		List<DistributionCenterDTO> centers = distributionCenterService.find(query, null);
		if (centers.size() > 0) {
			for (DistributionCenterDTO c : centers) {
				JSONObject json = new JSONObject();
				json.put("id", c.getId());
				json.put("name", c.getName());
				array.add(json);
			}
		}
		return ok(array);
	}
	
	/**
	 * 
	 * @param date yyyy/MM/dd
	 * @param xhdb
	 * @param xcg
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping("saveHealth")
	public String saveHealth(String date, String xhdb, String xzg, Double szy, Double ssy) throws Exception {
		assertTrue(StringUtils.isNotBlank(date), "请选择日期");
		assertTrue(StringUtils.isNotBlank(xhdb), "请输入糖化血红蛋白");
		assertTrue(StringUtils.isNotBlank(date), "请输入血常规");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		HealthDTO health = new HealthDTO();
		health.setCreateTime(new Date());
		health.setCustomer(getCurrentCustomer());
		health.setDate(dateFormat.parse(date));
		health.setXhdb(xhdb);
		health.setXzg(xzg);
		health.setSzy(szy);
		health.setSsy(ssy);
		
		healthService.create(health);
		
		return ok();
	}

	@ResponseBody
	@RequestMapping("saveHealthComment")
	public String saveHealthComment(Long customerId, String comment) throws Exception {
		assertTrue(StringUtils.isNotBlank(comment), "内容不能为空");
		HealthCommentDTO hc = new HealthCommentDTO();
		hc.setContent(comment);
		hc.setCreateTime(new Date());
		hc.setCustomer(new Customer(customerId));
		hc.setExpertCustomer(getCurrentCustomer());
		healthCommentService.create(hc);
		return ok();
	}
	
	@ResponseBody
	@RequestMapping("saveDirectBuyAddress")
	public String saveDirectBuyAddress(Long dishId, Integer num, String name, String mobile, Long districtId, String address, Long centerId) throws Exception {
		return null;
	}
}
