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
	public void getMyStores(HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		email="test";
		
		List<StoreDto> list=dao.getMyStores(email);
		//System.out.println(list);
		request.setAttribute("list", list);
	}
	
	@Override
	public void getMyStore(HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		email="test";
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		StoreDto dto=new StoreDto();
		dto.setNum(num); // rnum으로 들어감
		dto.setOwner(email);
		
		StoreDto myDto=dao.getMyStore(dto);

		request.setAttribute("dto", myDto);
	}
}
