package com.star.seat.users.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.star.seat.order.dto.OrderDto;
import com.star.seat.order.service.OrderService;
import com.star.seat.users.dto.UsersDto;
import com.star.seat.users.service.UsersService;


@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	

	
	//로그인 폼 요청 처리
	@RequestMapping("/users/loginform")
	public ModelAndView loginform(ModelAndView mView) {
		
		mView.setViewName("users/loginform");
		return mView;
	}
	
	//로그인 요청 처리
	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ajaxLogin( UsersDto dto, HttpSession session) {
		
		Map<String, Object> login = service.loginProcess(dto, session);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("url","${pageContext.request.contextPath}/main.do");
		map.put("login", login);
		
		return map;
	}
	
	//아이디 중복 확인을 해서 json 문자열을 리턴해주는 메소드 
	@RequestMapping("/users/checkemail")
	@ResponseBody
	public Map<String, Object> checkEmail(@RequestParam String inputEmail){
		//UsersService 가 리턴해주는 Map 을 리턴해서 json 문자열을 응답한다. 
		return service.isExistEmail(inputEmail);
	}

	//회원 가입 요청 처리 ( post 방식 요청은 요청 method 를 명시하는것이 좋다.
	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> signup(UsersDto dto) {
		
		service.addUser(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSignup",true);
		
		return map;
	}
	
	//회원 탈퇴 요청 처리
	@RequestMapping("/users/delete")
	@ResponseBody
	public Map<String, Object> Delete(HttpSession session, 
			HttpServletRequest request) {
		// 회원탈퇴한 email 정보를 전달 
		return service.deleteUser(session);
	}
	
	//개인정보 수정 반영 요청 처리
	@RequestMapping(value = "/users/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> Update(UsersDto dto, HttpSession session,
			HttpServletRequest request) {
		//서비스를 이용해서 개인정보를 수정하고 
		service.updateUser(dto, session);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isUpdate",true);
		return map;
	}
	
	//ajax 프로필 사진 업로드 요청처리
	@RequestMapping(value = "/users/ajax_profile_upload",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> AjaxProfileUpload(HttpServletRequest request,
			@RequestParam MultipartFile image){
		
		//서비스를 이용해서 이미지를 upload 폴더에 저장하고 리턴되는 Map 을 리턴해서 json 문자열 응답하기
		return service.saveProfileImage(request, image);
	}
	
	//비밀번호 변경
	@RequestMapping(value = "/users/pwd_update",
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> PwdUpdate(UsersDto dto, 
			 HttpSession session) {
		
		return service.updateUserPwd(session, dto);
	}
	
	//로그인된 회원정보와 함께 info 페이지로 이동
	@RequestMapping("/users/info")
	public ModelAndView Info(HttpSession session, ModelAndView mView,
			HttpServletRequest request) {
		
		service.getInfo(session, mView);
		
	//	List<OrderDto> list= service_order.getList(request, session);
	//	mView.addObject(list);
	//	mView.setViewName("users/info");
		return mView;
	}
	
	@RequestMapping("/users/getData")
	@ResponseBody
	public Map<String, Object> getUser(HttpSession session) {
		
		return service.getData(session);
	}
	
	//로그아웃
	@RequestMapping("/users/logout")
	public ModelAndView logout(ModelAndView mView, HttpSession session) {
		//세션에서 id 라는 키값으로 저장된 값 삭제 
		session.removeAttribute("email");
		session.removeAttribute("name");
		mView.setViewName("redirect:/main.do");
		return mView;
	}
}
