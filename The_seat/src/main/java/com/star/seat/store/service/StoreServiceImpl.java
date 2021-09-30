package com.star.seat.store.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.star.seat.menu.dao.MenuDao;
import com.star.seat.menu.dto.MenuDto;
import com.star.seat.order.dao.OrderDao;
import com.star.seat.order.dto.OrderDto;
import com.star.seat.review.dao.ReviewDao;
import com.star.seat.review.dto.ReviewDto;
import com.star.seat.seat.dao.SeatDao;
import com.star.seat.seat.dto.SeatDto;
import com.star.seat.store.dao.StoreDao;
import com.star.seat.store.dto.StoreDto;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao dao;
	@Autowired
	private SeatDao stDao;
	@Autowired
	private MenuDao mDao;
	@Autowired
	private ReviewDao rDao;
	@Autowired
	private OrderDao oDao;
	
	// 새로운 매장을 추가하는 method
	@Override
	public void addStore(HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		//email="test";
		dao.addStore(email);
		
		// 해당 email로 된 매장의 정보를 모두 불러온 다음
		List<StoreDto> list=dao.getMyStores(email);
		// 매장 수가 곧 새로 만들어진 매장에 해당하는 index+1
		int num=list.size();
		// 이 index에 해당하는 매장의 번호를 가져와서 매장 번호를 추출
		num=list.get(num-1).getNum();
		SeatDto stDto=new SeatDto();
		stDto.setNum(num);
		// 해당 매장에 대한 자리 정보를 table에 default로 형성
		// 나중에 update 방식으로 변경해준다고 함.
		stDao.insertSeat(stDto);
	}
	
	// 사장님의 매장 정보 목록을 불러오는 method
	@Override
	public List<StoreDto> getMyStores(HttpServletRequest request, HttpSession session) {
		String email=(String)request.getSession().getAttribute("email");
		//email="test";
		List<StoreDto> list=dao.getMyStores(email);
		session.setAttribute("myStoreList", list);
		
		return list;
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
			for(int i=1; i<tags.length; i++) {
				list.add(tags[i]);
			}
		}
		
		request.setAttribute("num", myDto.getNum());
		request.setAttribute("dto", myDto);
		request.setAttribute("list", list);
	}
	
	// (사장님의) 매장 정보 하나를 불러오는 method(해당 매장 DB 번호 이용)
	@Override
	public void getMyStore_num(StoreDto dto, HttpServletRequest request) {		

		  StoreDto theDto=dao.getMyStore_num(dto);   
	      
	      // 카테고리 리스트를 만들어서 request에 넣을 준비
	      // DB의 내용을 , 로 구분해서 String array로 만들어주고
	      String[] categories=theDto.getCategory().split(",");
	      // 새로운 array를 만들어서 거기에 하나씩 담아줌.
	      List<String> catList=new ArrayList();
	      for(int i=1; i<categories.length; i++) {
	         catList.add(categories[i]);
	      }
	      
	      // 태그 리스트를 만들어서 request에 넣을 준비
	      // DB의 내용을 , 로 구분해서 String array로 만들어주고
	      String[] tags=theDto.getStoreTag().split(",");
	      // 새로운 array를 만들어서 거기에 하나씩 담아줌.
	      List<String> tagList=new ArrayList();
	      for(int i=1; i<tags.length; i++) {
	         tagList.add(tags[i]);
	      }
	      
	      request.setAttribute("tagList", tagList);
	      request.setAttribute("categoryList", catList);
	      request.setAttribute("dto", theDto);
	}
	
	// 매장 검색목록 불러오는 method
	@Override
	public void getList(HttpServletRequest request, StoreDto dto) {
		
		/*
		게시글 paging 처리
		*/
	
		// 한 페이지에 표시할 게시물 수
		final int page_row_count=8;
		// 하단 페이지를 표시할 수
		final int page_display_count=5;
		
		// 보여줄 페이지의 번호를 초기값으로 1로 지정
		int pageNum=1;
		
		// page 번호가 parameter로 전달되는지 확인
		String strPageNum=request.getParameter("pageNum");
		// 넘어온다면
		if(strPageNum!=null){
			// String을 숫자로 바꿔서 page 번호로 저장한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		
		// 보여줄 page의 시작 rownum
		int startRowNum=1+(pageNum-1)*page_row_count;
		// 보여줄 page의 끝 rownum
		int endRowNum=pageNum*page_row_count;
		
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<StoreDto> list=dao.getList(dto);
		request.setAttribute("list", list);
		
		// 전체 게시글 개수
		int totalRow=0;
		
		// 별점정보를 list에 담는 method
		ReviewDto rDto=new ReviewDto();
		for(int i=0; i<list.size(); i++) {
	    	// 각 주문번호 정보에 해당 매장의 평균 별점과
	    	// 해당 주문 번호에 대한 내 별점 담기
	    	int num=list.get(i).getNum(); // 매장 DB 번호
	    	rDto.setStoreNum(num);
	    	// 해당 매장의 번호로 평균 별점을 가져옴
	    	float avgStar=(float)(Math.round(rDao.getAvgStar(rDto)*100)/100.0);
	    	list.get(i).setAvgStar(avgStar);
	    }
		totalRow=dao.getListCount(dto);
		
		
		// 하단의 시작 page 번호
		int startPageNum=1+((pageNum-1)/page_display_count)*page_display_count;
		int endPageNum=startPageNum+page_display_count-1;
		
		// 전체 page의 수
		int totalPageCount=(int)Math.ceil(totalRow/(double)page_row_count);
		// 끝 page의 번호가 전체 page 수 보다 크다면 잘못된 값
		if(endPageNum > totalPageCount){
			endPageNum=totalPageCount; // 보정
		}
		
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalRow", totalRow);
	}
	
	// 매장 태그를 추가하는 method
	@Override
	public void addTag(StoreDto dto) {
		// 해당 매장에 해당하는 DB 번호를 받아서 dto에 넣고
		
		// DB에서 해당 번호의 정보를 받아옴.
		StoreDto myDto=dao.getMyStore_num(dto);
		
		// 만약 DB에 매장 tag 정보가 없다면
		if(myDto.getStoreTag()==null) {
			// 이스터 에그를 추가해주고
			myDto.setStoreTag("easter egg");
		}
		
		// DB의 내용을 , 로 구분해서 String array로 만들어주고
		String[] tags=myDto.getStoreTag().split(",");
		// 새로운 array를 만들어서 거기에 하나씩 담아줌.
		List<String> list=new ArrayList();
		for(int i=0; i<tags.length; i++) {
			list.add(tags[i]);
		}
		
		// 입력한 tag의 정보를 읽어서
		String newTag=dto.getStoreTag();

		// array에 담아준 다음
		list.add(newTag);
		// array 각 성분이 , 로 구분된 String으로 바꿔서
		String strList=String.join(",", list);
		
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
		// DB에서 받아온 dto에 넣은 다음에
		myDto.setStoreTag(strList);
		// dto를 넣어서 update
		dao.deleteTag(myDto);	
	}
	
	// 매장 정보(이름, 주소, 시간)를 수정하는 method
	@Override
	public void updateStore(StoreDto dto, HttpServletRequest request) {
		
		dao.updateStore(dto);
		mDao.updateStoreOfMenu(dto);
		
		request.setAttribute("newDto", dto);
	}
	
	// 이미지를 업로드하는 method
	@Override
	public void uploadImage(StoreDto dto, HttpServletRequest request) {
		// Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제 경로 얻어오기
		String realPath=request.getServletContext().getRealPath("/upload");
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//해당 경로를 access 할수 있는 파일 객체 생성
		File f=new File(realPath);
		if(!f.exists()){ //만일  폴더가 존재 하지 않으면
			f.mkdir(); //upload 폴더 만들기 
		}
		
		// upload할 image 정보
		MultipartFile myImage=dto.getImageFile();
		//원본 파일명 
		String orgFileName=myImage.getOriginalFilename();
		//upload 폴더에 저장된 파일명 
		String saveFileName=System.currentTimeMillis()+orgFileName;
		try {
			//upload 폴더에 파일을 저장한다.
			myImage.transferTo(new File(filePath+saveFileName));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//업로드한 클라이언트의 아이디
		String email=(String)request.getSession().getAttribute("email");
		
		//업로드된 파일 정보를 StoreDto 에 담아서
		StoreDto myDto=new StoreDto();
		myDto.setNum(dto.getNum());
		myDto.setOwner(email);
		if("check".equals(dto.getImage_logo())) {
			myDto.setImage_logo("/upload/"+saveFileName);
			myDto.setImageCheck("logo");
		} else if("check".equals(dto.getImage_1())) {
			myDto.setImage_1("/upload/"+saveFileName);
			myDto.setImageCheck("img1");
		} else if("check".equals(dto.getImage_2())) {
			myDto.setImage_2("/upload/"+saveFileName);
			myDto.setImageCheck("img2");
		} else if("check".equals(dto.getImage_3())) {
			myDto.setImage_3("/upload/"+saveFileName);
			myDto.setImageCheck("img3");
		} else if("check".equals(dto.getImage_4())) {
			myDto.setImage_4("/upload/"+saveFileName);
			myDto.setImageCheck("img4");
		}
		
		dao.imageCheck(myDto);
		
		dao.updateImage(myDto);
	}
	
	// 매장 On Off method
	@Override
	public void storeOnOff(StoreDto dto) {
		
		dao.storeOnOff(dto);
	}
	
	// 매장 카테고리를 추가하는 method
	@Override
	public void addCategory(StoreDto dto) {
		// 해당 매장에 해당하는 DB 번호를 받아서 dto에 넣고
		
		// DB에서 해당 번호의 정보를 받아옴.
		StoreDto myDto=dao.getMyStore_num(dto);
		
		// 만약 DB에 매장 tag 정보가 없다면
		if(myDto.getCategory()==null) {
			// 이스터 에그를 추가해주고
			myDto.setCategory("easter egg");
		}
		
		// DB의 내용을 , 로 구분해서 String array로 만들어주고
		String[] categories=myDto.getCategory().split(",");
		// 새로운 array를 만들어서 거기에 하나씩 담아줌.
		List<String> list=new ArrayList();
		for(int i=0; i<categories.length; i++) {
			list.add(categories[i]);
		}
		
		// 입력한 tag의 정보를 읽어서
		String newCategory=dto.getCategory();

		// array에 담아준 다음
		list.add(newCategory);
		// array 각 성분이 , 로 구분된 String으로 바꿔서
		String strList=String.join(",", list);
		
		// DB에서 받아온 dto에 넣은 다음에
		myDto.setCategory(strList);
		// dto를 넣어서 update
		dao.addCategory(myDto);
	}
	
	// 매장 메뉴의 카테고리를 삭제하는 method
	@Override
	public void deleteCategory(StoreDto dto) {
		// 해당 매장에 해당하는 DB 번호를 받아서 dto에 넣고
		
		// DB에서 해당 번호의 정보를 받아옴.
		StoreDto myDto=dao.getMyStore_num(dto);
		
		// DB의 내용을 , 로 구분해서 String array로 만들어주고
		String[] categories=myDto.getCategory().split(",");
		// 새로운 array를 만들어서 거기에 하나씩 담아줌.
		List<String> list=new ArrayList();
		for(int i=0; i<categories.length; i++) {
			list.add(categories[i]);
		}
		
		// 입력한 tag의 정보를 읽어서
		String category=dto.getCategory();
		// array에서 없앤다음
		list.remove(list.indexOf(category));

		// array 각 성분이 , 로 구분된 String으로 바꿔서
		String strList=String.join(",", list);
		// DB에서 받아온 dto에 넣은 다음에
		myDto.setCategory(strList);
		// dto를 넣어서 update
		dao.deleteCategory(myDto);
	}
	
	// 매장 정보를 삭제하는 method
	@Override
	public void deleteStore(StoreDto dto, HttpServletRequest request) {
		String email=(String)request.getSession().getAttribute("email");
		dto.setOwner(email);
		
		SeatDto sDto = new SeatDto();
		sDto.setNum(dto.getNum());
		
		MenuDto mDto=new MenuDto();
		mDto.setStoreNum(dto.getNum());
		
		ReviewDto rDto=new ReviewDto();
		rDto.setStoreNum(dto.getNum());
		
		OrderDto oDto=new OrderDto();
		oDto.setNum(dto.getNum());
		
		// 매장 정보를 지우고
		dao.deleteStore(dto);
		// 매장 자리 정보도 지움
		stDao.seatDelete(sDto);
		// 매장 메뉴 정도도 지움
		mDao.deleteAllMenu(mDto);
		// 매장 리뷰 정보도 지움
		rDao.deleteAllReview(rDto);
		// 매장에서 주문했던 내역도 지움
		oDao.deleteAllOrder(oDto);
	}
}
