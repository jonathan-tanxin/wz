package com.daxia.wz.web.controller.admin;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import com.daxia.wz.common.OrderStatusQuery;
import com.daxia.wz.dto.*;
import com.daxia.wz.util.ExcelExporter;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.xmlbeans.impl.jam.mutable.MPackage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daxia.wz.common.DistributeStatus;
import com.daxia.wz.common.OrderStatus;
import com.daxia.wz.model.Order;
import com.daxia.wz.model.OrderItem;
import com.daxia.wz.service.CustomerService;
import com.daxia.wz.service.OrderItemService;
import com.daxia.wz.service.OrderService;
import com.daxia.wz.service.AddressService;
import com.daxia.wz.support.Page;
import com.daxia.wz.web.controller.BaseController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/admin/order", produces="text/html;charset=UTF-8")
public class AdminOrderController extends BaseController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private AddressService addressService;
	
	@Autowired
	private OrderItemService orderItemService;

	@RequestMapping(value = "/detail")
	public String detail(Map<String, Object> map, Long id) {
		if (id != null) {
			OrderDTO dto = orderService.load(id);
			map.put("n", dto);
		}
		Order order = new Order();
		order.setId(id);
		OrderItemDTO orderItemDTO = new OrderItemDTO();
		orderItemDTO.setOrder(order);
		List<OrderItemDTO> orderItemList = orderItemService.find(orderItemDTO, new Page());
		
		map.put("orderItem",orderItemList);
//		List<CustomerDTO> customerList = customerService.findAll();
//		map.put("customerList", customerList);
		return "admin/order/order_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/save")
	@PreAuthorize("hasRole('order')")
	public String save(OrderDTO dto) throws Exception {
		if (dto.getId() == null) {
			orderService.create(dto);
		} else {
			OrderDTO old = orderService.load(dto.getId());
			old.setDistributeStatus(dto.getDistributeStatus());
			orderService.updateAllFields(old);
			
		}
		return ok();
	}

    @PreAuthorize("hasRole('order')")
	@ResponseBody
	@RequestMapping(value = "/delete") 
	public String delete(Long[] ids) throws IOException {
		orderService.deleteByIds(ids);
		return ok();
	}
	
	@RequestMapping(value = "/list")
	public String list(OrderDTO dto, Map<String, Object> map, Page page) {
		List<OrderDTO> dtos = orderService.find(dto, page);
		map.put("list", dtos);
		map.put("query", dto);
		map.put("distributeStatusList", DistributeStatus.values());
		map.put("statusList", OrderStatus.values());
		return "admin/order/order_list";
	}
	
	@RequestMapping(value = "/sendList")
	public String sendLsit(OrderDTO dto, Map<String, Object> map, Page page){
		List<OrderDTO> dtos = orderService.find(dto, page);
		//根据每条order信息中的用户获取用户收货地址信息
		for (OrderDTO orderDTO : dtos) {
			AddressDTO addDto = addressService.findByCustomer(orderDTO.getCustomer().getId());
			orderDTO.setAddress(addDto);
		}
		map.put("list", dtos);
		map.put("query", dto);
		map.put("distributeStatusList", DistributeStatus.values());
		map.put("statusList", OrderStatusQuery.values());
		return "admin/order/ordersend_list";
	}
	
	@RequestMapping(value = "/setSend")
	public String setSend(Map<String, Object> map, Long id){
		if (id != null) {
			OrderDTO dto = orderService.load(id);
			map.put("n", dto);
		}
		map.put("distributeStatusList", DistributeStatus.values());
		return "admin/order/order_set_send";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateStatusToSend")
	public String updateStatusToSend(HttpServletRequest request){
		String idStr = request.getParameter("id");

		if (idStr != null && !idStr.equals("")) {
			Long id = Long.valueOf(idStr);
			OrderDTO old = orderService.load(id);
			old.setDistributeStatus(Integer.valueOf(request.getParameter("distributeStatus")));
			orderService.updateAllFields(old);
		}
		return ok();
		
	}

	@RequestMapping(value = "/exportExcel")
	public void exportExcel(OrderDTO dto, HttpServletRequest request, HttpServletResponse response) throws IOException{
		List<OrderDTO> dtos = orderService.list(dto);
		List<OrderExcelDTO> list = new ArrayList<>();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (OrderDTO orderDTO : dtos) {
			OrderExcelDTO excelDTO = new OrderExcelDTO();
			excelDTO.setId(orderDTO.getId().toString());
			excelDTO.setNickName(orderDTO.getCustomer().getNickName());
			AddressDTO addDto = addressService.findByCustomer(orderDTO.getCustomer().getId());
			if(orderDTO.getCreateTime() != null){
				excelDTO.setCreateTime(formatter.format(orderDTO.getCreateTime()));
			}
			if(addDto != null){
				excelDTO.setAddress(addDto.getAddress());
				excelDTO.setOrderNo(orderDTO.getOrderNo());
				excelDTO.setAddrMoblie(addDto.getMobile());
				excelDTO.setAddrName(addDto.getName());
				if(addDto.getDistributionCenter() != null){
					excelDTO.setDistributionCenterName(addDto.getDistributionCenter().getName());
				} else {
					excelDTO.setDistributionCenterName("");
				}

			}

			if(orderDTO.getOrderItems() != null){
				String orderItemStr = "";
				for( OrderItem item : orderDTO.getOrderItems()){
					orderItemStr += item.getDish().getName() + "*" + item.getNum() + "(" + item.getDish().getUnit()+")；";
				}
				excelDTO.setOrderItemStr(orderItemStr);
			}

			excelDTO.setStatusName(OrderStatus.getByValue(orderDTO.getStatus()).getRemark());
			excelDTO.setDistributeStatusName(DistributeStatus.getByValue(orderDTO.getDistributeStatus()).getRemark());
			list.add(excelDTO);
		}

		String exportPath = request.getSession().getServletContext().getRealPath("/") + "temp";

		String dateString = formatter.format(new Date());
		String filePath = exportPath + File.separator + dateString;
		String fileName =  "export-" + dateString + ".xls";
		File file = new File(filePath + File.separator + fileName);
		// 判断目标文件所在的目录是否存在
		if (!file.getParentFile().exists()) {
			// 如果目标文件所在的目录不存在，则创建父目录
			file.getParentFile().mkdirs();
		}
		file.createNewFile();
		HSSFWorkbook workbook = new HSSFWorkbook();
		String[] strs = new String[] {"id","用户", "订单号", "收货人姓名", "收货人手机号", "收货人地址", "配送中心", "配送状态", "状态","创建时间", "订单详情[菜品名称*数量(单位)]"};
		ExcelExporter.makeSheet(workbook, "配送管理", strs, list, "yyyy-MM-dd HH:mm:ss");
		FileOutputStream fileOps = null;
		OutputStream o = null;
		FileInputStream in = null;
		try {
			fileOps = new FileOutputStream(file);;
			ExcelExporter.writeExcel(workbook, fileOps);
			o = response.getOutputStream();
			response.reset();
			response.setContentType("application/x-msexcel");
			response.setHeader("Content-Length", String.valueOf(file.length()));
			response.setHeader("content-disposition", "attachment; filename=" + fileName);
			in = new FileInputStream(file);
			int n;
			byte b[] = new byte[500];
			while ((n = in.read(b)) != -1) {
				o.write(b, 0, n);
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			if (fileOps != null) {
				fileOps.close();
			}
			if (in != null) {
				in.close();
			}
			if (o != null) {
				o.close();
			}
			if(!file.delete()){
				file.deleteOnExit();
			}
		}
	}
	
}
