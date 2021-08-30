package com.star.seat.order.dao;

import java.util.List;

import com.star.seat.order.dto.OrderDto;

public interface OrderDao {
	
	// 같은 email 주문내역 얻어오기
	public List<OrderDto> getList(OrderDto dto);
	// email 총 주문내역 수 얻어오기
	public int getCount(String email);
	// oderNum 으로 주문 메뉴 정보 얻어오기
	public List<OrderDto> getListOne(String orderNum);
	// 주문하기
	public void insert(OrderDto dto);
	//orderNum 으로 주문정보 삭제(주문 취소)
	public void delete(int orderNum);
}
