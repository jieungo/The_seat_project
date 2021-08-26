package com.star.seat.store.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.star.seat.store.dto.StoreDto;

public interface StoreService {
	// 새로운 매장을 추가하는 method
	public void addStore(HttpServletRequest request);
	
	// 사장님의 매장 정보 목록을 불러오는 method
	public void getMyStores(HttpServletRequest request);
	
	// 사장님의 매장 정보 하나를 불러오는 method(이메일과 rnum 이용)
	public void getMyStore(HttpServletRequest request);
	
	// (사장님의) 매장 정보 하나를 불러오는 method(해당 매장 DB 번호 이용)
	public void getMyStore_num(StoreDto dto, HttpServletRequest request);
	
	// 매장 검색목록 불러오는 method
	public void getList(HttpServletRequest request, StoreDto dto);
	
	// 매장 태그를 추가하는 method
	public void addTag(StoreDto dto);
	
	// 매장 태그를 삭제하는 method
	public void deleteTag(StoreDto dto);
	
	// 매장 정보(이름, 주소, 시간)를 수정하는 method
	public void updateStore(StoreDto dto, HttpServletRequest request);
}
