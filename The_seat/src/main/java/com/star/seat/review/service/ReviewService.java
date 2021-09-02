package com.star.seat.review.service;

import javax.servlet.http.HttpServletRequest;

import com.star.seat.review.dto.ReviewDto;

public interface ReviewService {
	// 작성한 리뷰 정보를 추가하는 method
	public void addReview(ReviewDto dto, HttpServletRequest request);
}
