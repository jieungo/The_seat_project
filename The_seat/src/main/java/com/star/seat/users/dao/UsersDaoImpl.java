package com.star.seat.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.star.seat.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao {
	
	@Autowired
	private SqlSession session;
	
	//user 추가
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}
	//user 정보 가져오기
	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}
	//user 비밀번호 변경
	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.pwdUpdate", dto);
	}
	//user 정보 변경
	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}
	//user 삭제
	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}
	@Override
	public boolean isExist(String inputId) {
		//인자로 전달 받은 아이디가 존재 하는지 select 해 본다.
		String id=session.selectOne("users.isExist", inputId);
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}
}
