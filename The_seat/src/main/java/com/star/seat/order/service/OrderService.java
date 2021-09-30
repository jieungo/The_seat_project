package com.star.seat.order.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.star.seat.order.dto.OrderDto;

public interface OrderService {
	// email로 회원이 주문한 내역 정보 가져오기
	public ModelAndView getList(ModelAndView mView, HttpServletRequest request,HttpSession session);
	// num 이 같은 주문 내역 정보 가져오기
	public ModelAndView getStoreList(ModelAndView mView, HttpServletRequest request,HttpSession session);
	//orderNum 이 같은 주문내역의 menu, menuCount, price 가져오기
	public Map<String, Object> getOrderMenuList(OrderDto dto);
	//주문 상태정보 수정
	public Map<String, Object> updateState(OrderDto dto);
	// 주문정보 입력하기
	public void orderInsert(OrderDto dto);
	// emaill의 주문 내역 삭제하기
	public void deleteEmailOrder(OrderDto dto);
}
