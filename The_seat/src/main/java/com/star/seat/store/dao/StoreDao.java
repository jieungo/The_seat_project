package com.star.seat.store.dao;

import java.util.List;

import com.star.seat.store.dto.StoreDto;

public interface StoreDao {
	
	// 새로운 매장을 추가하는 method
	public void addStore(String email);
	
	// 사장님의 매장 정보를 불러오는 method
	public List<StoreDto> getMyStore(String email);
	
	// 매장 검색목록 불러오는 method
	public List<StoreDto> getList();
}
