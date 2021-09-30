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
		
		session.insert("seat.insertSeat", dto);
	}

	@Override
	public void updateSeat(SeatDto dto) {
		session.update("seat.updateSeat", dto);
	}
	
	@Override
	public void updateEmptySeat(SeatDto dto) {
		session.update("seat.updateEmptySeat", dto);
	}

	@Override
	public SeatDto getSeat(SeatDto dto) {
		return session.selectOne("seat.getSeat", dto);
	}

	@Override
	public void seatDelete(SeatDto dto) {
		session.delete("seat.seatDelete", dto);
	}

}
