package com.star.seat.order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.star.seat.order.dto.OrderDto;

public interface OrderService {
	public ModelAndView getList(ModelAndView mView, HttpServletRequest request,HttpSession session);
	public void orderInsert(OrderDto dto);
}
