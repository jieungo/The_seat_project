package com.star.seat.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.star.seat.store.dto.StoreDto;
import com.star.seat.store.service.StoreService;

@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	
	@RequestMapping("/main.do")
	public String getList(StoreDto dto, HttpServletRequest request) {
		//area group keyword
		

		request.setAttribute("dto", dto);
		
		service.getMyStores(request);
		
		return "main";
	}
	
	@RequestMapping("/newStore.do")
	@ResponseBody
	public Map<String, Object> addStore(HttpServletRequest request){
		Map<String, Object> map=new HashMap<>();
		
		// service로 보내서 매장 정보 DB에 email 정보를 더해줌.
		service.addStore(request);
		
		map.put("beSuccess", true);
		
		return map;
	}
	
	@RequestMapping(value="/myStore.do", method=RequestMethod.GET)
	public String myStore(@RequestParam int num, HttpServletRequest request) {
		service.getMyStore(request);
		
		return "myStore";
	}
	
}
