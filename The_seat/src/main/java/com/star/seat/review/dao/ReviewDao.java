package com.star.seat.review.dao;

import com.star.seat.review.dto.ReviewDto;

public interface ReviewDao {
	// 작성한 리뷰 정보를 추가하는 method
	public void addReview(ReviewDto dto);
}
