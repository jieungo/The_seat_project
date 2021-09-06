package com.star.seat.order.controller;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.seat.menu.service.MenuService;
import com.star.seat.order.dto.OrderDto;
import com.star.seat.order.service.OrderService;
import com.star.seat.store.dto.StoreDto;
import com.star.seat.store.service.StoreService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	@Autowired
	private StoreService sService;
	@Autowired
	private MenuService mService;
	
	
	@RequestMapping(value = "/order/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(OrderDto dto){
		System.out.println(dto.getOrderNum());
		service.orderInsert(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess",true);
		return map;
	}
	
	// 좌석 선택 후 매장 주문 페이지로 이동
	@RequestMapping(value = "/order/order.do", method = RequestMethod.GET)
	public String order(StoreDto dto, HttpServletRequest request){
		sService.getMyStore_num(dto, request);
		mService.getMenuList_user(dto, request);
		int tableNum = Integer.parseInt(request.getParameter("tableNum"));
		request.setAttribute("tableNum", tableNum);
		long orderNum = Long.parseLong(request.getParameter("orderNum"));
		request.setAttribute("orderNum", orderNum);
		return "order/order";
	}
	
	// 주문내역 메뉴 상세 AJAX
	@RequestMapping(value = "/order/orderMenu.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> orderMenuDetail (OrderDto dto){
		System.out.println(dto.getOrderNum());
		return service.getOrderMenuList(dto);
	}
	
}
