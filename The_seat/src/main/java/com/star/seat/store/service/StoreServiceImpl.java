package com.star.seat.store.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.star.seat.store.dao.StoreDao;
import com.star.seat.store.dto.StoreDto;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao dao;
	
	@Override
	public void addStore(HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		email="test";
		dao.addStore(email);
	}
	
	@Override
	public void getMyStore(HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		email="test";
		
		List<StoreDto> list=dao.getMyStore(email);
		request.setAttribute("list", list);
	}
}
