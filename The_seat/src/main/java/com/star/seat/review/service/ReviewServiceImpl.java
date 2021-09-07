package com.star.seat.review.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.star.seat.order.dao.OrderDao;
import com.star.seat.order.dto.OrderDto;
import com.star.seat.review.dao.ReviewDao;
import com.star.seat.review.dto.ReviewDto;
import com.star.seat.store.dao.StoreDao;
import com.star.seat.store.dto.StoreDto;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao dao;
	@Autowired
	private StoreDao sDao;
	
	// 작성한 리뷰 정보를 추가하는 method
	@Override
	public void addReview(ReviewDto dto, HttpServletRequest request) {
		// Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제 경로 얻어오기
		String realPath=request.getServletContext().getRealPath("/upload");
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		System.out.println("realPath:"+realPath);
		//해당 경로를 access 할수 있는 파일 객체 생성
		File f=new File(realPath);
		if(!f.exists()){ //만일  폴더가 존재 하지 않으면
			f.mkdir(); //upload 폴더 만들기 
		}
		
		// upload할 image 정보
		MultipartFile reviewImage=dto.getImageFile();
		System.out.println(reviewImage);
		//원본 파일명 
		String orgFileName=reviewImage.getOriginalFilename();
		//upload 폴더에 저장된 파일명 
		String saveFileName=System.currentTimeMillis()+orgFileName;
		System.out.println(orgFileName);
		System.out.println(saveFileName);
		try {
			//upload 폴더에 파일을 저장한다.
			reviewImage.transferTo(new File(filePath+saveFileName));
			System.out.println(filePath+saveFileName);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		dto.setImagePath("/upload/"+saveFileName);
		String email=(String)request.getSession().getAttribute("email");
		dto.setWriter(email);
		
		StoreDto sDto=new StoreDto();
		sDto.setNum(dto.getStoreNum());
		// 해당 매장의 정보를 불러옴
		sDto=sDao.getMyStore_num(sDto);
		dto.setStoreName(sDto.getStoreName());
		
		// sequence의 다음 숫자를 미리 읽어와서 넣어줌.
		int num=dao.getSequence();
		dto.setNum(num);
		dto.setGroupNum(num);
		
		// 해당 댓글 작성자의 이메일과 사장님의 이메일이 다르면
		// targetNum에 0을 넣지 않기 위해 해당 review num을 넣어줌
		if(email.equals(sDto.getOwner())){
			dto.setTargetNum(num);
		}
		
		OrderDto oDto=new OrderDto();
		oDto.setOrderNum((int)dto.getOrderNum());
		oDto.setReviewExist("YES");
		
		dao.addReview(dto);
		dao.reviewExist(oDto);
	}
	
	// 해당 매장 리뷰 정보를 가져오는 method
	@Override
	public List<ReviewDto> getReviewList(ReviewDto dto) {
		
		List<ReviewDto> list=dao.getReviewList(dto);
		System.out.println(dto.getStoreNum());
		for(int i=0; i<list.size(); i++) {
			// 해당 댓글의 DB 번호를 불러옴
			int num=list.get(i).getNum();
			// 그 번호를 dto의 targetNum에 넣어줌
			dto.setNum(num);
			System.out.println("test: "+list.get(i).getReviewCheck());
			// 만약 그 targetNum으로 된 것이 있으면 yes, 없으면 no
			if(dao.getMyReview(dto)!=null) {
				list.get(i).setReviewCheck("yes");
			} else {
				list.get(i).setReviewCheck("no");
			}
		}
		
		return list;
	}
	
	// 해당 DB번호의 리뷰 정보를 삭제하는 method
	@Override
	public void deleteReview(ReviewDto dto) {
		OrderDto oDto=new OrderDto();
		oDto.setOrderNum((int)dto.getOrderNum());
		oDto.setReviewExist("NO");
		
		dao.deleteReview(dto);
		dao.reviewExist(oDto);
	}
	
	// 해당 DB번호의 리뷰 정보를 가져오는 method
	@Override
	public ReviewDto getReviewData(ReviewDto dto) {
		
		return dao.getReviewData(dto);
	}
	
	// 해당 DB번호의 리뷰 정보를 수정하는 method
	@Override
	public void updateReview(ReviewDto dto, HttpServletRequest request) {
		// Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제 경로 얻어오기
		String realPath=request.getServletContext().getRealPath("/upload");
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		System.out.println("realPath:"+realPath);
		
		// upload할 image 정보
		MultipartFile reviewImage=dto.getImageFile();
		System.out.println(reviewImage);
		//원본 파일명 
		String orgFileName=reviewImage.getOriginalFilename();
		//upload 폴더에 저장된 파일명 
		String saveFileName=System.currentTimeMillis()+orgFileName;
		System.out.println(orgFileName);
		System.out.println(saveFileName);
		try {
			//upload 폴더에 파일을 저장한다.
			reviewImage.transferTo(new File(filePath+saveFileName));
			System.out.println(filePath+saveFileName);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		dto.setImagePath("/upload/"+saveFileName);
		
		dao.updateReview(dto);	
	}
	
	// 해당 리뷰 번호로 되어있는 targetNum 정보가 있는지 여부를 알아내는 method
	@Override
	public boolean getMyReview(ReviewDto dto) {
		
		//dto.setTargetNum(dto.getNum());
		
		boolean result=false;
		
		if(dao.getMyReview(dto)!=null) {
			result=true;
		}
		
		return result;
	}
}
