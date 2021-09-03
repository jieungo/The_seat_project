package com.star.seat.review.dao;

import java.util.List;

import com.star.seat.review.dto.ReviewDto;

public interface ReviewDao {
	// 작성한 리뷰 정보를 추가하는 method
	public void addReview(ReviewDto dto);
	
	// 모든 매장 리뷰 정보를 가져오는 method
	// 아예 마이페이지로 갈 때 뿌려주면 됨
	public List<ReviewDto> getAllReview();
	
	// 해당 매장 리뷰 정보를 가져오는 method
	public List<ReviewDto> getReviewList(ReviewDto dto);
}
