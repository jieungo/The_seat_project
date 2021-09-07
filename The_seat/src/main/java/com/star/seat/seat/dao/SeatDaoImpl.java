package com.star.seat.seat.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.star.seat.seat.dto.SeatDto;

@Repository
public class SeatDaoImpl implements SeatDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insertSeat(SeatDto dto) {
		
		session.insert("insertSeat", dto);
	}

	@Override
	public void updateSeat(SeatDto dto) {
		session.update("updateSeat", dto);
	}

	@Override
	public SeatDto getSeat(SeatDto dto) {
		return session.selectOne("getSeat", dto);
	}

}