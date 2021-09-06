package com.star.seat.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.star.seat.order.dao.OrderDao;
import com.star.seat.order.dto.OrderDto;



@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao dao;
	
	//갤러리 이미지 list
	@Override
	public ModelAndView getList(ModelAndView mView, HttpServletRequest request,HttpSession session) {
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=6;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
	   
		//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
		int pageNum=1;
		//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
		String strPageNum = request.getParameter("pageNum");
		//만일 페이지 번호가 파라미터로 넘어 온다면
		if(strPageNum != null){
			//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
	   
		//보여줄 페이지의 시작 ROWNUM
		int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
		//보여줄 페이지의 끝 ROWNUM
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		//list 를 뽑을 로그인중 인 email 을 dto 에 담고
	    String email = (String)session.getAttribute("email");
		//startRowNum 과 endRowNum  을 OrderDto 객체에 담고
		OrderDto dto = new OrderDto();
		dto.setEmail(email);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
	   
		//email 이 담긴 dto객체로 OrderDao 객체를 이용해서 주문 목록을 얻어온다.
		List<OrderDto> list = dao.getList(dto);
	   
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	   
		//전체 row 의 갯수
		int totalRow = dao.getCount(email);
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum = totalPageCount; //보정해 준다. 
		}

		mView.addObject("list", list);	//order list
		mView.addObject("startPageNum", startPageNum);	//시작 페이지 번호
		mView.addObject("endPageNum", endPageNum);	//끝 페이지 번호
		mView.addObject("pageNum", pageNum);	//현재 페이지 번호
		mView.addObject("totalPageCount", totalPageCount);	//모든 페이지 count
		
		return mView;
	}

	@Override
	public void orderInsert(OrderDto dto) {
		dao.insert(dto);
	}

	@Override
	public Map<String, Object> getOrderMenuList(OrderDto dto) {
		List<OrderDto> list = dao.getOrderMenuList(dto);
		System.out.println(list);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list",list);
		return map;
	}
}
