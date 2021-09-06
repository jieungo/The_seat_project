package com.star.seat.review.dao;

import java.util.List;

import com.star.seat.order.dto.OrderDto;
import com.star.seat.review.dto.ReviewDto;

public interface ReviewDao {
	// sequence의 다음 숫자를 가져오는 method
	public int getSequence();
	
	// 작성한 리뷰 정보를 추가하는 method
	public void addReview(ReviewDto dto);
	
	// 해당 매장 리뷰 정보를 가져오는 method
	public List<ReviewDto> getReviewList(ReviewDto dto);
	
	// 해당 DB번호의 리뷰 정보를 삭제하는 method
	public void deleteReview(ReviewDto dto);
	
	// 해당 DB번호의 리뷰 정보를 가져오는 method
	public ReviewDto getReviewData(ReviewDto dto);
	
	// 해당 DB번호의 리뷰 정보를 수정하는 method
	public void updateReview(ReviewDto dto);
	
	// 해당 주문 번호에 해당하는 review 존재 여부를 조정하는 method;
	public void reviewExist(OrderDto dto);
}
