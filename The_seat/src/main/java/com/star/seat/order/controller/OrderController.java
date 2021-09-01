package com.star.seat.order.controller;



import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.star.seat.order.dto.OrderDto;
import com.star.seat.order.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@RequestMapping("/order/insert")
	@ResponseBody
	public Map<String, Object> getList(OrderDto dto){
		
		service.orderInsert(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess",true);
		return map;
	}
	
	// 매장 주문 확인 페이지로 이동
	@RequestMapping("/store/storeOrder")
	public ModelAndView storeOrder(ModelAndView mView){
		mView.setViewName("store/storeOrder");
		return mView;
	}
}
