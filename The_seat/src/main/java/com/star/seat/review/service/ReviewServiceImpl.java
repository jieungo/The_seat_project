package com.star.seat.review.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public float addReview(ReviewDto dto, HttpServletRequest request) {
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
		MultipartFile reviewImage=dto.getImageFile();
		if(reviewImage!=null) {
			//원본 파일명 
			String orgFileName=reviewImage.getOriginalFilename();
			//upload 폴더에 저장된 파일명 
			String saveFileName=System.currentTimeMillis()+orgFileName;
			dto.setImagePath("/upload/"+saveFileName);
			try {
				//upload 폴더에 파일을 저장한다.
				reviewImage.transferTo(new File(filePath+saveFileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
		} else {
			dto.setImagePath("null");
		}
	
		String email=(String)request.getSession().getAttribute("email");
		dto.setWriter(email);
		
		StoreDto sDto=new StoreDto();
		sDto.setNum(dto.getStoreNum());
		// 해당 매장의 정보를 불러옴
		sDto=sDao.getMyStore_num(sDto);
		dto.setStoreName(sDto.getStoreName());
		
		// 해당 댓글 작성자의 이메일과 사장님의 이메일이 같으면
		// targetNum에 0을 넣지 않기 위해 해당 review num을 넣어줌
		if(email.equals(sDto.getOwner())){
			int num=dao.getSequence();
			dto.setTargetNum(dto.getNum());
			dto.setGroupNum(dto.getNum());
			dto.setNum(num);
		} else {
			// 이메일이 달라서 유저인 것이 확인되면
			// sequence의 다음 숫자를 미리 읽어와서 넣어줌.
			int num=dao.getSequence();
			dto.setNum(num);
			dto.setGroupNum(num);
		}
		
		OrderDto oDto=new OrderDto();
		oDto.setOrderNum((int)dto.getOrderNum());
		oDto.setReviewExist("YES");
		
		dao.addReview(dto);
		dao.reviewExist(oDto);
		
		float newAvgStar=(float)(Math.round(dao.getAvgStar(dto)*100)/100.0);
		
		return newAvgStar;
	}
	
	// 해당 매장 리뷰 정보를 가져오는 method
	@Override
	public List<ReviewDto> getReviewList(ReviewDto dto, HttpServletRequest request) {
		List<ReviewDto> list=dao.getReviewList(dto);
		
		if(list!=null) {
			for(int i=0; i<list.size(); i++) {
				// 해당 댓글의 DB 번호를 불러옴
				int num=list.get(i).getNum();
				// 그 번호를 dto의 targetNum에 넣어줌
				dto.setNum(num);
				// 만약 그 targetNum으로 된 것이 있으면 yes, 없으면 no
				if(dao.getMyReview(dto)!=null) {
					list.get(i).setReviewCheck("yes");
				} else {
					list.get(i).setReviewCheck("no");
				}
			}
		}
		
		int totalReviewCount=dao.getTotalReviewCount(dto);
		float avgStar=(float)(Math.round(dao.getAvgStar(dto)*100)/100.0);

		request.setAttribute("totalReviewCount", totalReviewCount);
		request.setAttribute("avgStar", avgStar);
			
		return list;
	}
	
	// 해당 DB번호의 리뷰 정보를 삭제하는 method
	@Override
	public float deleteReview(ReviewDto dto) {
		OrderDto oDto=new OrderDto();
		oDto.setOrderNum((int)dto.getOrderNum());
		oDto.setReviewExist("NO");
		
		dao.deleteReview(dto);
		dao.reviewExist(oDto);
		
		float newAvgStar=(float)(Math.round(dao.getAvgStar(dto)*100)/100.0);
		
		return newAvgStar;
	}
	
	// 해당 DB번호의 리뷰 정보를 삭제하는 method(사장님은 사장님것만 삭제)
	@Override
	public void deleteReview_owner(ReviewDto dto) {
		
		dao.deleteReview_owner(dto);
	}
	
	// 해당 DB번호의 리뷰 정보를 가져오는 method
	@Override
	public ReviewDto getReviewData(ReviewDto dto) {
		
		return dao.getReviewData(dto);
	}
	
	// 해당 DB번호의 리뷰 정보를 수정하는 method
	@Override
	public float updateReview(ReviewDto dto, HttpServletRequest request) {
		// 이메일 정보 넣어주기
		String email=(String)request.getSession().getAttribute("email");
		dto.setWriter(email);
		
		// Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제 경로 얻어오기
		String realPath=request.getServletContext().getRealPath("/upload");
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		
		// upload할 image 정보
		MultipartFile reviewImage=dto.getImageFile();
		if(reviewImage!=null) {
			//원본 파일명 
			String orgFileName=reviewImage.getOriginalFilename();
			//upload 폴더에 저장된 파일명 
			String saveFileName=System.currentTimeMillis()+orgFileName;
			dto.setImagePath("/upload/"+saveFileName);
			try {
				//upload 폴더에 파일을 저장한다.
				reviewImage.transferTo(new File(filePath+saveFileName));
			}catch(Exception e) {
				e.printStackTrace();
			}
		} else {
			dto.setImagePath("null");
		}
		
		dao.updateReview(dto);
		float newAvgStar=(float)(Math.round(dao.getAvgStar(dto)*100)/100.0);
		
		return newAvgStar;
	}
	
	// 해당 리뷰 번호로 되어있는 targetNum 정보가 있는지 여부를 알아내는 method
	@Override
	public Map<String, Object> getMyReview(ReviewDto dto, HttpServletRequest request) {
		
		//dto.setTargetNum(dto.getNum());
		
		boolean result=false;
		ReviewDto rDto=new ReviewDto();
		if(dao.getMyReview(dto)!=null) {
			result=true;
			rDto=dao.getMyReview(dto);
		}
		
		Map<String, Object> map=new HashMap<>();
		map.put("beChecked", result);
		map.put("ownerReviewData", rDto);
		
		return map;
	}
}
