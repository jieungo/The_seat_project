package com.star.seat.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.seat.order.dao.OrderDao;
import com.star.seat.order.dto.OrderDto;
import com.star.seat.order.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	@Autowired
	private OrderDao dao;
	
	@RequestMapping("/order/list")
	@ResponseBody
	public List<OrderDto> getList(HttpServletRequest request, HttpSession session){
		return service.getList(request, session);
	}
	
}
