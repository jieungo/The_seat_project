package com.star.seat.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.star.seat.order.service.OrderService;
import com.star.seat.review.dto.ReviewDto;
import com.star.seat.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	@Autowired
	private OrderService oService;
	
	// 리뷰 작성 테스트 페이지로 이동(테스트라 나중에 지울 것임)
	// 테스트 페이지 안에 모달
	@RequestMapping("/store/test.do")
	public ModelAndView test(ModelAndView mView, ReviewDto dto, HttpServletRequest request, HttpSession session) {
		
		oService.getList(mView, request, session);

		
		mView.setViewName("store/test");
		
		return mView;
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

	// 해당 리뷰를 삭제하는 method
	@RequestMapping(value = "/store/deleteReview.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReview(ReviewDto dto){
		
		service.deleteReview(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beDeleted", true);
		
		return map;
	}
	
	// 해당 리뷰 정보를 가져오는 method
	@RequestMapping(value = "/store/getReviewData.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getReviewData(ReviewDto dto){
		
		ReviewDto rDto=service.getReviewData(dto);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beSuccess", true);
		map.put("reviewData", rDto);
		
		return map;
	}
	
	// 해당 리뷰를 수정하는 method
	@RequestMapping(value = "/store/updateReview.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateReview(ReviewDto dto, HttpServletRequest request){
		
		service.updateReview(dto, request);
		
		Map<String, Object> map=new HashMap<>();
		map.put("beUpdated", true);
		
		return map;
	}
}