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
	
	// 사장님의 매장 정보 목록을 불러오는 method
	@Override
	public List<StoreDto> getMyStores(String email) {
		List<StoreDto> list=session.selectList("getMyStores", email);
		return list;
	}
	
	// 사장님의 매장 정보 하나를 불러오는 method(이메일과 rnum 이용)
	@Override
	public StoreDto getMyStore(StoreDto dto) {
		
		StoreDto myDto=session.selectOne("getMyStore", dto);
		
		return myDto;
	}
	
	// 사장님의 매장 정보 하나를 불러오는 method(해당 매장 DB 번호 이용)
	@Override
	public StoreDto getMyStore_num(StoreDto dto) {
		StoreDto myDto=session.selectOne("getMyStore_num", dto);
		
		return myDto;
	}
	
	// 매장 검색 목록 불러오는 method
	@Override
	public List<StoreDto> getList(StoreDto dto) {

		return session.selectList("getList", dto);
	}
	
	// 매장 태그를 추가하는 method
	// 사실상 update 이용하는 것
	@Override
	public void addTag(StoreDto dto) {
		session.update("addTag", dto);
	}
	
	// 매장 태그를 삭제하는 method
	// 사실상 update를 이용하는 것
	@Override
	public void deleteTag(StoreDto dto) {
		session.update("addTag", dto);
	}
}
