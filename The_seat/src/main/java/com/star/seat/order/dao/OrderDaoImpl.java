package com.star.seat.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.star.seat.order.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao{

	@Autowired
	private SqlSession session;

	//email 이 같은 주문내역 불러오기
	@Override
	public List<OrderDto> getList(OrderDto dto) {
		return session.selectList("Order.getList", dto);
	}
	
	//email 로 총 주문내역 갯수 구하기 
	@Override
	public int getCount(String email) {
		return session.selectOne("Order.getCount", email);
	}
	
	//email 이 같고 orderNum 이 같은 주문내역 불러오기
	public List<OrderDto> getListOne(String orderNum) {
		return session.selectList("Order.getListOne",orderNum);
	}
	
	//주문하기
	@Override
	public void insert(OrderDto dto) {
		session.insert("Order.insert", dto);
	}
	
	//주문취소
	public void delete(int orderNum) {
		session.delete("Order.delete",orderNum);
	}
	
}
