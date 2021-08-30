package com.star.seat.menu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.star.seat.menu.dto.MenuDto;
import com.star.seat.menu.service.MenuService;
import com.star.seat.store.dto.StoreDto;

@Controller
public class MenuController {
	@Autowired
	private MenuService service;
	
	// 임시 메뉴관리 페이지 이동
	@RequestMapping(value = "/store/manageMenu.do", method = RequestMethod.GET)
	public ModelAndView getList(StoreDto sDto, HttpServletRequest request) {

		System.out.println(sDto.getNum());
		System.out.println(sDto.getStoreName());
		int num=sDto.getNum();
		String storeName=sDto.getStoreName();
		
		// 해당 매장의 메뉴 정보를 가져오는 method
		service.getMenuList(sDto, request);
		
		ModelAndView mView=new ModelAndView();
		mView.addObject("storeDBNum", sDto.getNum());
		mView.setViewName("store/manageMenu");
		
		return mView;
	}
	
	// 해당 매장의 메뉴를 추가하는 method
	@RequestMapping(value = "/store/addMenu.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addMenu(@RequestParam int num, MenuDto dto, HttpServletRequest request) {
		
		service.addMenu(num, dto, request);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beAdded", true);
		
		return map;
	}
	
	// 해당 매장의 메뉴 정보를 삭제하는 method
	@RequestMapping("/store/deleteMenu.do")
	@ResponseBody
	public Map<String, Object> deleteMenu(MenuDto dto){
		
		service.deleteMenu(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beDeleted", true);
		
		return map;
	}
}
