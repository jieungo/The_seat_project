package com.star.seat.menu.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.star.seat.menu.dto.MenuDto;
import com.star.seat.store.dto.StoreDto;

@Repository
public class MenuDaoImpl implements MenuDao{
	@Autowired
	private SqlSession session;
	
	// 해당 매장의 메뉴 정보를 추가하는 method
	@Override
	public void addMenu(MenuDto dto) {
		session.insert("addMenu", dto);
	}
	
	// 해당 매장의 메뉴 정보를 가져오는 method (사장님)
	@Override
	public List<MenuDto> getMenuList(StoreDto dto) {
		
		return session.selectList("getMenuList", dto);
	}
	
	// 해당 매장의 메뉴 정보를 가져오는 method (유저)
	@Override
	public List<MenuDto> getMenuList_num(StoreDto dto) {
		
		return session.selectList("getMenuList_num", dto);
	}
	
	// 해당 매장의 메뉴 정보를 삭제하는 method
	@Override
	public void deleteMenu(MenuDto dto) {
		session.delete("deleteMenu", dto);	
	}
}
