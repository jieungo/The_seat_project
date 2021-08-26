package com.star.seat.store.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.star.seat.store.dao.StoreDao;
import com.star.seat.store.dto.StoreDto;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao dao;
	
	// 새로운 매장을 추가하는 method
	@Override
	public void addStore(HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		//email="test";
		dao.addStore(email);
	}
	
	// 사장님의 매장 정보 목록을 불러오는 method
	@Override
	public void getMyStores(HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		//email="test";
		System.out.println(email);
		List<StoreDto> list=dao.getMyStores(email);
		System.out.println(list);
		request.setAttribute("myStoreList", list);
	}
	
	// 사장님의 매장 정보 하나를 불러오는 method(이메일과 rnum 이용)
	@Override
	public void getMyStore(HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		//email="test";
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		StoreDto dto=new StoreDto();
		dto.setNum(num); // rnum으로 들어감
		dto.setOwner(email);
		
		StoreDto myDto=dao.getMyStore(dto);
		
		// 만약 DB에 매장 tag 정보가 있다면
		// 새로운 array를 만들어서 거기에 하나씩 담아줌.
		List<String> list=new ArrayList();
		if(myDto.getStoreTag()!=null) {
			String[] tags=myDto.getStoreTag().split(",");
			for(int i=0; i<tags.length; i++) {
				System.out.println(tags[i]);
				list.add(tags[i]);
			}
		}
		
		request.setAttribute("dto", myDto);
		request.setAttribute("list", list);
	}
	
	// 사장님의 매장 정보 하나를 불러오는 method(해당 매장 DB 번호 이용)
	@Override
	public void getMyStore_num(StoreDto dto) {		
		dao.getMyStore_num(dto);	
	}
	
	// 매장 검색목록 불러오는 method
	@Override
	public void getList(HttpServletRequest request, StoreDto dto) {
		List<StoreDto> list=dao.getList(dto);
		System.out.println("area : "+dto.getArea());
		System.out.println("group : "+dto.getGroup());
		System.out.println("keyword : "+dto.getKeyword());
		System.out.println(dao.getList(dto));
		request.setAttribute("list", list);
	}
	
	// 매장 태그를 추가하는 method
	@Override
	public void addTag(StoreDto dto) {
		// 해당 매장에 해당하는 DB 번호를 받아서 dto에 넣고
		
		// DB에서 해당 번호의 정보를 받아옴.
		StoreDto myDto=dao.getMyStore_num(dto);
		System.out.println(myDto.getStoreTag());
		
		// 만약 DB에 매장 tag 정보가 없다면
		if(myDto.getStoreTag()==null) {
			// 이스터 에그를 추가해주고
			myDto.setStoreTag("easter egg");
		}
		System.out.println(myDto.getStoreTag());
		
		// DB의 내용을 , 로 구분해서 String array로 만들어주고
		String[] tags=myDto.getStoreTag().split(",");
		// 새로운 array를 만들어서 거기에 하나씩 담아줌.
		List<String> list=new ArrayList();
		for(int i=0; i<tags.length; i++) {
			System.out.println(tags[i]);
			list.add(tags[i]);
		}
		
		// 입력한 tag의 정보를 읽어서
		String newTag=dto.getStoreTag();
		// array에 담아준 다음
		list.add(newTag);
		// array 각 성분이 , 로 구분된 String으로 바꿔서
		String strList=String.join(",", list);
		System.out.println(strList);
		
		// DB에서 받아온 dto에 넣은 다음에
		myDto.setStoreTag(strList);
		// dto를 넣어서 update
		dao.addTag(myDto);
	}
	
	// 매장 태그를 삭제하는 method
	@Override
	public void deleteTag(StoreDto dto) {
		
		// DB에서 해당 번호의 정보를 받아옴.
		StoreDto myDto=dao.getMyStore_num(dto);
		
		// DB의 내용을 , 로 구분해서 String array로 만들어주고
		String[] tags=myDto.getStoreTag().split(",");
		// 새로운 array를 만들어서 거기에 하나씩 담아줌.
		List<String> list=new ArrayList();
		for(int i=0; i<tags.length; i++) {
			list.add(tags[i]);
		}
		
		// 입력한 tag의 정보를 읽어서
		String tag=dto.getStoreTag();
		// array에서 없앤다음
		list.remove(list.indexOf(tag));
		
		// array 각 성분이 , 로 구분된 String으로 바꿔서
		String strList=String.join(",", list);
		System.out.println(strList);
		// DB에서 받아온 dto에 넣은 다음에
		myDto.setStoreTag(strList);
		// dto를 넣어서 update
		dao.deleteTag(myDto);	
	}
}
