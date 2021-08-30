package com.star.seat.menu.dao;

import java.util.List;

import com.star.seat.menu.dto.MenuDto;
import com.star.seat.store.dto.StoreDto;

public interface MenuDao {
	// 해당 매장의 메뉴 정보를 추가하는 method
	public void addMenu(MenuDto dto);
	
	// 해당 매장의 메뉴 정보를 가져오는 method (사장님)
	public List<MenuDto> getMenuList(StoreDto dto);
	
	// 해당 매장의 메뉴 정보를 가져오는 method (유저)
	public List<MenuDto> getMenuList_num(StoreDto dto);
	
	// 해당 매장의 메뉴 정보를 삭제하는 method
	public void deleteMenu(MenuDto dto);
}
