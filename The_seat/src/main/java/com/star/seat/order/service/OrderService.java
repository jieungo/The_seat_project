package com.star.seat.order.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.star.seat.order.dto.OrderDto;

public interface OrderService {
	public List<OrderDto> getList(HttpServletRequest request,HttpSession session);
}
