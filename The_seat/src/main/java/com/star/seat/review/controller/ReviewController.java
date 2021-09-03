package com.star.seat.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.star.seat.review.dto.ReviewDto;
import com.star.seat.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	
	// 리뷰 작성 테스트 페이지로 이동(테스트라 나중에 지울 것임)
	// 테스트 페이지 안에 모달
	@RequestMapping("/store/test.do")
	public String test() {
		return "store/test";
	}
	
	// 작성한 리뷰 정보를 추가하는 method
	@RequestMapping(value = "/store/addReview.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addReview(ReviewDto dto, HttpServletRequest request){
		
		System.out.println(dto.getStoreNum());
		System.out.println(dto.getStoreName());
		System.out.println(dto.getStar());
		System.out.println(dto.getContent());
		System.out.println(dto.getImageFile());
		
		service.addReview(dto, request);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beAdded", true);
		
		return map;
	}
	
	// 해당 매장 리뷰 목록을 불러오는 method
	@RequestMapping(value = "/store/getReview.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getReviewList(ReviewDto dto){
		System.out.println(dto.getStoreNum());
		
		List<ReviewDto> list=service.getReviewList(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beTaken", true);
		map.put("reviewList", list);
		
		return map;
	}
	
}