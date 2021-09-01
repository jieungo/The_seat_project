package com.star.seat.menu.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.star.seat.menu.dao.MenuDao;
import com.star.seat.menu.dto.MenuDto;
import com.star.seat.store.dao.StoreDao;
import com.star.seat.store.dto.StoreDto;

@Service
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuDao dao;
	@Autowired
	private StoreDao sDao;
	
	// 해당 매장의 메뉴 정보를 추가하는 method
	@Override
	public void addMenu(int num, MenuDto dto, HttpServletRequest request) {
		
		System.out.println(dto.getMenuName());
		System.out.println(dto.getPrice());
		System.out.println(dto.getContent());
		
		StoreDto sDto=new StoreDto();
		sDto.setNum(num);
		sDto=sDao.getMyStore_num(sDto);
		System.out.println(sDto.getStoreName());
		
		dto.setStoreName(sDto.getStoreName());
		
		// 파일을 저장할 실제 경로 얻어오기
		String realPath=request.getServletContext().getRealPath("/upload");
		// 저장할 파일의 상제 경로
		String filePath=realPath+File.separator;
		System.out.println("realPath: "+realPath);
		
		// 해당 경로에 접근할 수 있는 File 객체 생성
		File f=new File(realPath);
		// 만일 폴더가 존재하지 않으면 만듦
		if(!f.exists()) {
			f.mkdir();
		}
		
		// upload할 image 정보
		MultipartFile imageFile=dto.getImageFile();
		System.out.println(imageFile);
		
		// 원본 파일 명
		String orgImageName=imageFile.getOriginalFilename();
		// 저장할 파일 명
		String saveImageName=System.currentTimeMillis()+orgImageName;
		System.out.println(orgImageName);
		System.out.println(saveImageName);
		
		try {
			// folder에 image를 저장
			imageFile.transferTo(new File(filePath+saveImageName));
			System.out.println(filePath+saveImageName);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		dto.setMenuImage("/upload/"+saveImageName);
		
		dao.addMenu(dto);
	}
	
	// 해당 매장의 메뉴 정보를 가져오는 method (사장님)
	@Override
	public void getMenuList(StoreDto sDto, HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		System.out.println("storeNum : "+sDto.getNum());
		System.out.println("storeName : "+sDto.getStoreName());
		System.out.println("category : "+sDto.getCategory());
		String category=sDto.getCategory();
		sDto.setOwner(email);

		sDto=sDao.getMyStore_num(sDto);
		MenuDto mDto=new MenuDto();
		mDto.setCategory(category);
		//List<MenuDto> list=dao.getMenuList(sDto);
		Map<String, Object> map=new HashMap<>();
		map.put("sDto", sDto);
		map.put("mDto", mDto);
		System.out.println(category==null);
		List<MenuDto> list=null;
		if(category!=null) {
			list=dao.getMenuList(map);
		} else if(category==null){
			list=dao.getMenuList2(sDto);
		}
		System.out.println(list);
		request.setAttribute("menuList", list);
		request.setAttribute("storeData", sDto);
	}
	
	// 해당 매장의 메뉴 정보를 가져오는 method (유저)
	@Override
	public void getMenuList_user(StoreDto sDto, HttpServletRequest request) {
		List<MenuDto> list=dao.getMenuList_num(sDto);
		request.setAttribute("menuList", list);
	}
	
	// 해당 매장의 메뉴 정보를 삭제하는 method
	public void deleteMenu(MenuDto dto) {
		dao.deleteMenu(dto);
	}
	
	// 해당 매장의 메뉴를 best로 설정 및 취소하는 method
	@Override
	public boolean bestOnOff(MenuDto dto, HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		StoreDto sDto=new StoreDto();
		int storeNum=Integer.parseInt(request.getParameter("storeNum"));
		String storeName=request.getParameter("storeName");
		sDto.setNum(storeNum);
		sDto.setStoreName(storeName);
		sDto.setOwner(email);
		
		int bestCount=(dao.bestCount(sDto));
		System.out.println(bestCount);
		boolean beFour=false;
		if(bestCount==4 && dto.getBest().equals("yes")) {
			beFour=true;
		} else if(bestCount==4 && dto.getBest().equals("no")){
			beFour=false;
			dao.bestOnOff(dto);
		} else if(bestCount<4) {
			dao.bestOnOff(dto);
			beFour=false;
		}
		
		return beFour;
	}
}
