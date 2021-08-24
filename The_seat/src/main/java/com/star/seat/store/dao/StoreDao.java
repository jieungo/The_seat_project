package com.star.seat.store.dao;

import java.util.List;

import com.star.seat.store.dto.StoreDto;

public interface StoreDao {
	
	// 새로운 매장을 추가하는 method
	public void addStore(String email);
	
	// 사장님의 매장 정보 목록을 불러오는 method
	public List<StoreDto> getMyStores(String email);
	
	// 사장님의 매장 정보 하나를 불러오는 method
	public StoreDto getMyStore(StoreDto dto);
	
	// 매장 검색목록 불러오는 method
	public List<StoreDto> getList();
}
