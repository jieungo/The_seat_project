package com.star.seat.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.star.seat.store.dto.StoreDto;

@Repository
public class StoreDaoImpl implements StoreDao{
	@Autowired
	private SqlSession session;
	
	// 새로운 매장을 추가하는 method
	@Override
	public void addStore(String email) {
		session.insert("addStore", email);
	}
	
	// 사장님의 매장 정보를 불러오는 method
	@Override
	public List<StoreDto> getMyStore(String email) {
		List<StoreDto> list=session.selectList("getStore", email);
		return list;
	}
	
	// 매장 검색 목록 불러오는 method
	@Override
	public List<StoreDto> getList() {
		
		//session.select("getList", handle);
		
		return null;
	}
}
