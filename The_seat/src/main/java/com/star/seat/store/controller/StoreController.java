package com.star.seat.store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
	
	// 검색 결과 메인 페이지를 요청할 때의 method
	@RequestMapping("/main.do")
	public String getList(StoreDto dto, HttpServletRequest request) {
		
		// dto에 지역, 메뉴, 검색어 넣어서 dto라는 이름으로 저장.
		request.setAttribute("dto", dto);
		
		// 검색 결과 목록을 얻어옴
		service.getList(request, dto);
		
		String email=(String)request.getSession().getAttribute("email");
		if(email != null) {
			// 내가 관리하는 매장 정보를 얻어옴
			service.getMyStores(request);
		}
		
		return "main";
	}
	
	// 매장 추가 링크를 눌러서 요청되는 경로에 대한 method
	@RequestMapping("/newStore.do")
	@ResponseBody
	public Map<String, Object> addStore(HttpServletRequest request){
		Map<String, Object> map=new HashMap<>();
		
		// serviced에서 매장 정보 DB에 email 정보를 더해줌.
		service.addStore(request);
		
		map.put("beSuccess", true);
		
		return map;
	}
	
	// 매장 관리 링크를 눌러서 요청되는 경로에 대한 method
	@RequestMapping(value="/myStore.do", method=RequestMethod.GET)
	public String myStore(@RequestParam int num, HttpServletRequest request) {
		
		// service에서 매장 정보를 DB에서 꺼내와서 request에 넣고
		service.getMyStore(request);
		
		// 페이지 return
		return "myStore";
	}
	
	// 매장 태그 추가 링크를 눌러서 요청되는 경로에 대한 method
	@RequestMapping(value = "/addTag.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addTag(StoreDto dto){
		System.out.println(dto.getNum());
		System.out.println(dto.getStoreTag());
		
		// service에서 DB에 매장 태그를 추가하고
		service.addTag(dto);
		
		Map<String, Object> map=new HashMap<>();
		
		map.put("beAdded", true);

		return map;
	}
	
	// 매장을 태그를 삭제하는 method
	@RequestMapping(value = "deleteTag.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteTag(StoreDto dto) {
		
		service.deleteTag(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beDeleted", true);
		
		return map;
	}
	
	// 관리 매장 정보 수정
	@RequestMapping(value = "/storeUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> storeUpdate(StoreDto dto, HttpServletRequest request){

		service.updateStore(dto, request);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beUpdated", true);
		
		return map;
	}
	
	// 매장 상세 정보 페이지로 이동
	@RequestMapping(value = "/storeDetail.do", method = RequestMethod.GET)
	public String goStoreDetail(StoreDto dto, HttpServletRequest request) {
		
		service.getMyStore_num(dto, request);
		
		return "storeDetail";
	}
}
