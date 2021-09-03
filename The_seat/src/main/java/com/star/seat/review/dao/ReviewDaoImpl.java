package com.star.seat.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.star.seat.review.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	private SqlSession session;
	
	// 작성한 리뷰 정보를 추가하는 method
	@Override
	public void addReview(ReviewDto dto) {
		session.insert("addReview", dto);	
	}
	
	// 모든 매장 리뷰 정보를 가져오는 method
	// 아예 마이페이지로 갈 때 뿌려주면 됨
	@Override
	public List<ReviewDto> getAllReview() {
		return session.selectList("getAllReview");	
	}
	
	// 해당 매장 리뷰 정보를 가져오는 method
	@Override
	public List<ReviewDto> getReviewList(ReviewDto dto) {
		return session.selectList("getReviewList", dto);
	}
}
