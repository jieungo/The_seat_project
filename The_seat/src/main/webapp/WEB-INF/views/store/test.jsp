<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/storeReview.css?ver=1"
	type="text/css" />
</head>
<body>
	<div class="container">
		<c:forEach var="tmp" items="${list }">
			<p>${tmp.num }</p>
			<p>${tmp.storeName }</p>
			<button data-num="${tmp.num }" class="reviewListBtn" data-bs-toggle="modal" data-bs-target="#modal-reviewList">리뷰 보기</button>
			<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewBtn" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰 작성</button>
			<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewUpdateBtn" data-bs-toggle="modal" data-bs-target="#reviewUpdateModal">리뷰 수정</button>
			<!-- 
			<c:choose>
				<c:when test="">
					<button data-num="${tmp.num }" class="reviewListBtn" data-bs-toggle="modal" data-bs-target="#modal-reviewList">리뷰 보기</button>
					<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewBtn" data-bs-toggle="modal" data-bs-target="#reviewModal" style="display:none">리뷰 작성</button>
					<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewUpdateBtn" data-bs-toggle="modal" data-bs-target="#reviewUpdateModal">리뷰 수정</button>
				</c:when>
				<c:when test="">
					<button data-num="${tmp.num }" class="reviewListBtn" data-bs-toggle="modal" data-bs-target="#modal-reviewList">리뷰 보기</button>
					<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewBtn" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰 작성</button>
					<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewUpdateBtn" data-bs-toggle="modal" data-bs-target="#reviewUpdateModal" style="display:none">리뷰 수정</button>
				</c:when>
			</c:choose>
			-->
		</c:forEach>
	</div>
	
	<!-- 리뷰 작성 modal -->
	<div data-num="" class="modal" tabindex="-1" id="reviewModal" aria-labelledby="menuAddForm" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title"><strong>리뷰 등록</strong> </h4>
	                <button id="addCloseBtn" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	            	<a id="reviewImgLink" href="javascript:">
		                <img src="#" alt="" id="reviewImg" name="review" class="image mt-3"
		                style="width: 150px; height: 150px; "/>
		            </a>
	                <form data-num2="" id="reviewAddForm" action="${pageContext.request.contextPath}/store/addReview.do" method="post" enctype="multipart/form-data">                 
	                    <select name="star" id="">
	                    	<c:forEach var="tmp" items="1,2,3,4,5">
	                    		<option name="starOption" value="${tmp }">${tmp }</option>
	                    	</c:forEach>
	                    </select>
	                    <input id="inputImg" name="imageFile" type="file" style="display:none;"/>
	                    <input type="hidden" name="storeNum" id="insertNum" value="" />
	                    <input type="hidden" name="orderNum" id="insertOrderNum" value="" />
	                    <textarea name="content" id="content" cols="30" rows="10" placeholer="리뷰를 작성해주세요."></textarea>
	                    <button id="addBtn" type="submit">작성 완료</button>
	                </form>
	            </div>
	        </div>
	    </div>
    </div>
    
    <!-- 리뷰 수정 modal -->
	<div class="modal" tabindex="-1" id="reviewUpdateModal" aria-labelledby="menuAddForm" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title"><strong>리뷰 수정</strong> </h4>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	            	<a id="updateImgLink" href="javascript:">
		                <img src="#" alt="" id="updateImg" name="review" class="image mt-3"
		                style="width: 150px; height: 150px; "/>
		            </a>
	                <form id="reviewUpdateForm" action="${pageContext.request.contextPath}/store/updateReview.do" method="post" enctype="multipart/form-data">                 
	                    <select name="star" id="">
	                    	<c:forEach var="tmp" items="1,2,3,4,5">
	                    		<option name="starOption" value="${tmp }">${tmp }</option>
	                    	</c:forEach>
	                    </select>
	                    <input id="inputImg" name="imageFile" type="file" style="display:none;"/>
	                    <input type="hidden" name="storeNum" id="updateNum" value="" />
	                    <input type="hidden" name="orderNum" id="updateOrderNum" value="" />
	                    <textarea name="content" id="content" cols="30" rows="10"></textarea>
	                    <button id="updateBtn" type="submit">수정 완료</button>
	                </form>
	            </div>
	        </div>
	    </div>
    </div>
    
    <!-- 리뷰 list modal -->
	<div class="modal" tabindex="-1" id="modal-reviewList" aria-labelledby="modal-reviewList" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title"><strong>리뷰 목록</strong> </h4>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div id="reviewBox" class="modal-body">
	            	
	            </div>
	        </div>
	    </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
	document.querySelector("#reviewImgLink").addEventListener("click", function(){
		document.querySelector("#inputImg").click();
	});
	
	viewThumbNail("#inputImg", "#reviewImg");
	
	// 이미지 파일을 선택했을 때 동작하는 method
	function viewThumbNail(rel, imageID){
		document.querySelector(rel).addEventListener("change", function(e){
			console.log("rel1: "+rel);
			readImage(e.target, imageID);
		});
	}
	
	function readImage(input, imageID) {
		console.log("rel2: "+imageID);
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        let reader=new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload=function(e){
	            let previewImg=document.querySelector(imageID);
	            previewImg.src=e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	addReview("#reviewAddForm");
	
	// 리뷰 등록 버튼을 클릭했을 때 발생하는 동작
	let reviewBtns=document.querySelectorAll(".reviewBtn");
	for(let i=0; i<reviewBtns.length; i++){
		reviewBtns[i].addEventListener("click", function(e){
			e.preventDefault();
			
			// 버튼에 있는 해당 매장의 DB 번호 정보
			let num=this.getAttribute("data-num");
			// 주문 번호
			let num2=this.getAttribute("data-num2");
			console.log(num);
			console.log(num2);
			// 번호정보를 form에서 넘기는 값에 저장
			document.querySelector("#insertNum").value=num;
			document.querySelector("#insertOrderNum").value=num2;
			document.querySelector("#reviewAddForm").setAttribute("data-num2", num2);
		});
	}
	
	
	// 매장에 대한 리뷰 등록 시 동작하는 method
	function addReview(rel){
		document.querySelector(rel).addEventListener("submit", function(e){
			// 일단 form 제출을 막음
			e.preventDefault();
			
			let num=this.getAttribute("data-num2");
			console.log(num);
			
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beAdded){
					document.querySelector("#addCloseBtn").click();
					alert("리뷰를 등록하였습니다.");
					document.querySelector("button.reviewBtn[data-num2=\'"+num+"\']").style.display="none";
					document.querySelector("button.reviewUpdateBtn[data-num2=\'"+num+"\']").style.display="block";
				}
			});
		});
	}
	
	let test=``;
	// 마이페이지 해당 매장의 리뷰 목록을 불러오는 method
	let reviewListBtns=document.querySelectorAll(".reviewListBtn");
	for(let i=0; i<reviewListBtns.length; i++){
		reviewListBtns[i].addEventListener("click", function(e){
			//e.preventDefault();
			
			// 기존 내용을 reset
			let reviewBox=document.querySelector("#reviewBox");
			while (reviewBox.hasChildNodes()) {	
				reviewBox.removeChild(reviewBox.firstChild );
			}
			test=``;
			
			// 버튼에 저장된 매장의 번호를 불러옴
			let storeNum=this.getAttribute("data-num");
			
			ajaxPromise("${pageContext.request.contextPath}/store/getReview.do", "post", "storeNum="+storeNum)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beTaken){
					let reviewList=data.reviewList;
					console.log(reviewList);
					for(let j=0; j<reviewList.length; j++){
						console.log(j);
						if(reviewList[j].targetNum==0){
							let testPrime=
								`
									<div class="user-review" >
									    <div class="user-review__title">
									        <h5><strong>`+reviewList[j].writer+` </strong></h5>
									        <small>`+reviewList[j].regdate+` </small>
									    </div>
									    <div class="user-review__body arrow_box-user">
									        <div class="user-review__text"> 
									
									            <!-- 별점이랑 리뷰내용 출력하기 -->
									            <div class="fiveStar">
									                <i class="starIcon fas fa-star"></i>
									                <i class="starIcon fas fa-star"></i>
									                <i class="starIcon fas fa-star"></i>
									                <i class="starIcon fas fa-star"></i>
									                <i class="starIcon far fa-star"></i>
									            </div>
									            <p>
									            	`+reviewList[j].content+`
									            </p>
									
									            <!-- 버튼 클릭시 글 작성 가능한 사장님 답글 말풍선 생성-->
									            <button href="javascript:" id="userReview">
									                <span class="user-review__reply">답글보기</span>
									            </button>
									        </div>
									        <div class="img__wrapper">
									            <img src="#" alt="" id="image_logo" name="logo" class="image"/>
									        </div>
									    </div>
									</div>
								`;
							test=test+testPrime;
						} else {
							let testPrime=
								`
								<div class="owner-review" id="ownerReview" style="display: none;">
								    <div class="owner-review__title">
								        <small>21/08/22 </small>
								    </div>
								    <div class="owner-review__body arrow_box-owner">
								        <div class="edit-btn">
								            <i class="fas fa-edit" id="updateBtn" style="display: none;"></i>
								            <button id="update">수정 완료</button>
								            <button id="updateCancel">취소</button>
								        </div>
								        <div class="owner-review__text">
								            <h5><strong>사장님</strong></h5>
								            <textarea name="#" id="" placeholder="답글을 입력해 주세요 :)">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod, minus optio magni et sunt ipsam sed at porro quidem labore ipsum dolorum provident velit, nulla fugiat nobis! Temporibus, nam doloribus!</textarea>
								        </div>
								    </div>
								</div>
								`;
							test=test+testPrime;
						}
						
						//document.querySelector("#reviewBox").innerHTML=test;
					}
					document.querySelector("#reviewBox").innerHTML=test;
				}
			});
		});	
	}
	
	// 댓글달기 버튼 클릭하면 사장님 답글 창 생성
	   
	let review = document.querySelectorAll('#userReview');
	let ownerReview = document.querySelectorAll('#ownerReview');
	
	for (let i=0; i<review.length; i++) {
	    review[i].addEventListener('click', function(){
	        ownerReview[i].style.display="block";
	    });
	}
	
	// 리뷰 수정 버튼을 눌렀을 때 동작하는 부분
	let reviewUpdateBtns=document.querySelectorAll(".reviewUpdateBtn");
	for(let i=0; i<reviewUpdateBtns.length; i++){
		reviewUpdateBtns[i].addEventListener("click", function(e){
			e.preventDefault();
			
			// 버튼에 있는 해당 매장의 DB 번호 정보
			let num=this.getAttribute("data-num");
			// 주문 번호
			let num2=this.getAttribute("data-num2");
			console.log(num);
			console.log(num2);
			// 번호정보를 form에서 넘기는 값에 저장
			document.querySelector("#updateNum").value=num;
			document.querySelector("#updateOrderNum").value=num2;
			document.querySelector("#reviewUpdateForm").setAttribute("data-num2", num2);
		
			//
		});
	}
	
</script>
</html>