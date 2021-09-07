package com.star.seat.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.star.seat.review.dto.ReviewDto;

public interface ReviewService {
	// 작성한 리뷰 정보를 추가하는 method
	public void addReview(ReviewDto dto, HttpServletRequest request);
	
	// 해당 매장 리뷰 정보를 가져오는 method
	public List<ReviewDto> getReviewList(ReviewDto dto);
	
	// 해당 DB번호의 리뷰 정보를 삭제하는 method
	public void deleteReview(ReviewDto dto);
	
	// 해당 DB번호의 리뷰 정보를 가져오는 method
	public ReviewDto getReviewData(ReviewDto dto);
	
	// 해당 DB번호의 리뷰 정보를 수정하는 method
	public void updateReview(ReviewDto dto, HttpServletRequest request);
	
	// 해당 리뷰 번호로 되어있는 targetNum 정보가 있는지 여부를 알아내는 method
	public boolean getMyReview(ReviewDto dto);
}
