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
</head>
<body>
	<button class="reviewListBtn" data-bs-toggle="modal" data-bs-target="#modal-reviewList">리뷰 보기</button>
	<button class="reviewBtn" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰 작성</button>
	
	<!-- 리뷰 작성 modal -->
	<div class="modal" tabindex="-1" id="reviewModal" aria-labelledby="menuAddForm" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title"><strong>리뷰 등록</strong> </h4>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	            	<a id="reviewImgLink" href="javascript:">
		                <img src="#" alt="" id="reviewImg" name="review" class="image mt-3"
		                style="width: 150px; height: 150px; "/>
		            </a>
	                <form id="reviewAddForm" action="${pageContext.request.contextPath}/store/addReview.do" method="post" enctype="multipart/form-data">                 
	                    <select name="star" id="">
	                    	<c:forEach var="tmp" items="1,2,3,4,5">
	                    		<option name="starOption" value="${tmp }">${tmp }</option>
	                    	</c:forEach>
	                    </select>
	                    <input id="inputImg" name="imageFile" type="file" style="display:none;"/>
	                    <input type="hidden" name="storeNum" value="182" />
	                    <input type="hidden" name="storeName" value="Default2" />
	                    <textarea name="content" id="content" cols="30" rows="10" placeholer="리뷰를 작성해주세요."></textarea>
	                    <button id="addBtn" type="submit">작성 완료</button>
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
	            <div class="modal-body reviewBox">
	            	<div>
            			<img src="#" alt="" />
            			<p>작성자</p>
            			<p>별점</p>
            			<p>내용</p>
            			<p>등록일</p>
            		</div>
            		<div class="card">
            			<img id="reviewWriter" src="" alt="" />
            			<p id="reviewWriter"></p>
            			<p id="reviewStar"></p>
            			<p id="reviewContent"></p>
            			<p id="reviewRegdate"></p>
            		</div>
	            </div>
	        </div>
	    </div>
    </div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	document.querySelector("#reviewImgLink").addEventListener("click", function(){
		document.querySelector("#inputImg").click();
	});
	
	viewThumbNail("#inputImg", "#reviewImg");
	updateImage("#reviewAddForm",);
	
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
	
	// 매장 로고 등록 시 동작하는 method
	function updateImage(rel){
		document.querySelector(rel).addEventListener("submit", function(e){
			// 일단 form 제출을 막음
			e.preventDefault();

			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beAdded){
					document.querySelector("#reviewBtn").click();
					alert("리뷰를 등록하였습니다.");
				}
			});
		});
	}
	
	// 마이페이지 해당 매장의 리뷰 목록을 불러오는 method
	let reviewListBtns=document.querySelectorAll(".reviewListBtn");
	for(let i=0; i<reviewListBtns.length; i++){
		reviewListBtns[i].addEventListener("click", function(e){
			//e.preventDefault();
			
			let storeNum=182;
			
			ajaxPromise("${pageContext.request.contextPath}/store/getReview.do", "post", "storeNum="+storeNum)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beTaken){
					let reviewList=data.reviewList;
					console.log(reviewList);
				}
			});
		});	
	}
</script>
</html>