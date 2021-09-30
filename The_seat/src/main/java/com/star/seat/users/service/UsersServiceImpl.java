package com.star.seat.users.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.star.seat.users.dao.UsersDao;
import com.star.seat.users.dto.UsersDto;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDao dao;
	
	@Override
	public void addUser(UsersDto dto) {
		//사용자가 입력한 비밀 번호를 읽어와서 
		String pwd=dto.getPwd();
		//암호화 한 후에 
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		//dto 에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		
		dao.insert(dto);
	}

	@Override
	public Map<String, Object> loginProcess(UsersDto dto, HttpSession session) {
		//입력한 정보가 맞는여부
		boolean isValemail=false;
		
		//1. 로그인 폼에 입력한 아이디를 이용해서 해당 정보를 select 해 본다. 
		UsersDto result=dao.getData(dto.getEmail());
		if(result != null) {//만일 존재하는 아이디 라면
			//비밀번호가 일치하는지 확인한다.
			String encodedPwd=result.getPwd(); //DB 에 저장된 암호화된 비밀번호 
			String inputPwd=dto.getPwd(); //로그인폼에 입력한 비밀번호
			//Bcrypt 클래스의 static 메소드를 이용해서 일치 여부를 얻어낸다.
			isValemail=BCrypt.checkpw(inputPwd, encodedPwd);
		}
		String encodedPwd=result.getPwd(); //DB 에 저장된 암호화된 비밀번호 
		String inputPwd=dto.getPwd();
		isValemail=BCrypt.checkpw(inputPwd, encodedPwd);
		if(isValemail) {//만일 유효한 정보이면 
			//로그인 처리를 한다.
			session.setAttribute("email", dto.getEmail());
		};
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("result",result);
		map.put("dto",dto);
		map.put("isValemail", isValemail);
		return map;
	}

	@Override
	public void getInfo(ModelAndView mView, HttpSession session) {
		//로그인된 아이디를 읽어온다.
		
		if(session.getAttribute("email") != null) {
			String email=(String)session.getAttribute("email");
			//DB 에서 회원 정보를 얻어와서 
			UsersDto dto=dao.getData(email);
			//ModelAndView 객체에 담아준다.
			mView.addObject("dto", dto);
		}
		
	}
	
	@Override
	public Map<String, Object> getData(HttpSession session) {
		//로그인된 아이디를 읽어온다. 
		String email=(String)session.getAttribute("email");
		//DB 에서 회원 정보를 얻어와서 
		UsersDto dto=dao.getData(email);
		//ModelAndView 객체에 담아준다.
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("dto", dto);
		
		return map;
	}

	@Override
	public Map<String, Object> updateUserPwd(HttpSession session, UsersDto dto) {
		//세션 영역에서 로그인된 아이디 읽어오기
		String email=(String)session.getAttribute("email");
		//DB 에 저장된 회원정보 얻어오기
		UsersDto resultDto=dao.getData(email);
		//DB 에 저장된 암호화된 비밀 번호
		String encodedPwd=resultDto.getPwd();
		//클라이언트가 입력한 비밀번호
		String inputPwd=dto.getPwd();
		//두 비밀번호가 일치하는지 확인
		boolean isValid=BCrypt.checkpw(inputPwd, encodedPwd);
		//만일 일치 한다면
		if(isValid) {
			//새로운 비밀번호를 암호화 한다.
			BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
			String encodedNewPwd=encoder.encode(dto.getNewPwd());
			//암호화된 비밀번호를 dto 에 다시 넣어준다.
			dto.setNewPwd(encodedNewPwd);
			//dto 에 로그인된 아이디도 넣어준다.
			dto.setEmail(email);
			//dao 를 이용해서 DB 에 수정 반영한다.
			dao.updatePwd(dto);
			//로그아웃 처리
			session.removeAttribute("email");
		}
		Map<String, Object> map=new HashMap<String, Object>();
		//작업의 성공여부를 ModelAndView 객체에 담아 놓는다(결국 HttpServletRequest 에 담긴다)
		map.put("isSuccess", isValid);
		//로그인된 아이디도 담아준다.
		map.put("email", email);
		return map;
	}

	@Override
	public Map<String, Object> saveProfileImage(HttpServletRequest request, MultipartFile mFile) {
		//업로드된 파일에 대한 정보를 MultipartFile 객체를 이용해서 얻어낼수 있다.	
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//upload 폴더에 저장할 파일명을 직접구성한다.
		// 1234123424343xxx.jpg
		String saveFileName=System.currentTimeMillis()+orgFileName;
		
		// webapp/upload 폴더까지의 실제 경로 얻어내기 
		String realPath=request.getServletContext().getRealPath("/upload");
		// upload 폴더가 존재하지 않을경우 만들기 위한 File 객체 생성
		File upload=new File(realPath);
		if(!upload.exists()) {//만일 존재 하지 않으면
			upload.mkdir(); //만들어준다.
		}
		try {
			//파일을 저장할 전체 경로를 구성한다.  
			String savePath=realPath+File.separator+saveFileName;
			//임시폴더에 업로드된 파일을 원하는 파일을 저장할 경로에 전송한다.
			mFile.transferTo(new File(savePath));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// json 문자열을 출력하기 위한 Map 객체 생성하고 정보 담기 
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imagePath", "/upload/"+saveFileName);
		
		return map;
	}

	@Override
	public void updateUser(UsersDto dto, HttpSession session) {
		//수정할 회원의 아이디
		String email=(String)session.getAttribute("email");
		//UsersDto 에 아이디도 담아 주고
		dto.setEmail(email);
		//UsersDao 를 이용해서 수정 반영한다.
		dao.update(dto);
	}

	@Override
	public Map<String, Object> deleteUser(HttpSession session) {
		//로그인된 아이디를 얻어와서 
		String email=(String)session.getAttribute("email");
		//해당 정보를 DB 에서 삭제하고
		dao.delete(email);
		//로그아웃 처리도 한다.
		session.removeAttribute("email");
		//ModelAndView 객체에 탈퇴한 회원의 아이디를 담아준다.
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("email", email);
		return map;
	}

	@Override
	public Map<String, Object> isExistEmail(String inputEmail) {
		//Map 객체를 생성해서 
		Map<String, Object> map=new HashMap<String, Object>();
		//isExist 라는 키값으로 아이디가 존재하는지 여부를 담고 
		map.put("isExist", dao.isExist(inputEmail));
		//Map 객체를 리턴해 준다. 
		return map;
	}

	@Override
	public Map<String, Object> getOrderData(HttpServletRequest request) {
		
		//로그인된 아이디를 읽어온다. 
		String email=(String)request.getParameter("email");
		//DB 에서 회원 정보를 얻어와서 
		UsersDto dto=dao.getData(email);
		//ModelAndView 객체에 담아준다.
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("dto", dto);
		return map;
	}
}
