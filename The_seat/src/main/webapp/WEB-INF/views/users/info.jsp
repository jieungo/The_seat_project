<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<!-- 스타일 링크 -->
<link rel="stylesheet"
href="${pageContext.request.contextPath}/resources/css/info.css"
type="text/css" />
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/summer.jpg">

</head>
<body style="margin-top:150px;">
<div class="container">
	<jsp:include page="/WEB-INF/views/nav/navbar.jsp" />
	
<!--------------------- 마이페이지 상단 프로필 -------------------------->
	<header>
		<div class="my-page__profile mt-2 mb-2">
			<img class="me-5" src="${pageContext.request.contextPath}${dto.profile }" alt="프로필 이미지"
				style="width: 100px; border-radius: 100%;">
			<div>
				<h3>${dto.name}님의 마이페이지
					<c:choose>
						<c:when test="${myStoreList ne null }"> 
							<span>(Owner)</span>
						</c:when>
						<c:otherwise>
							<span>(Guest)</span>
						</c:otherwise>
					</c:choose>
				</h3>
				<h4><span>#</span>${dto.tag }</h4>
			</div>
		</div>	
		<!---------- 프로필 편집 버튼 ------------------->
		<button type="button" class="text-btn my-page__edit" data-bs-toggle="modal" data-bs-target="#modal-updateForm">
			프로필 편집
			<!-- 버튼 이미지 -->
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
				<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
			</svg>
		</button>
	</header>
	
	<div class="divide-line out-divide-line" style="text-align: center;"></div>
	
<!--------------------------- 마이페이지 하단 주문내역 ---------------------------------->
<!--------------------------- 카드로 만들기 c:forEach  사용------------------------------>

	<c:choose>
		<c:when test="${empty list }">
			<h1>아직 이용 내역이 없습니다. ㅠㅠ </h1><span><a href="${pageContext.request.contextPath}/main.do">->이용하러가기</a></span>
		</c:when>
		<c:otherwise>
			<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="tmp" items="${list }">
			  <div class="col">
			    <div class="card">
			      <div class="card-head">
			      	<p>주문번호 ${tmp.orderNum }</p>
			      	<h3>${tmp.storeName }</h3>
			      	<p>${tmp.regdate }</p>
			      </div>
			      <div>
				  <!-- 매장평점 -->
				  <span>매장평점:
					  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
		                   <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
		              </svg>
		          </span> 
				  <!-- 내가 준 평점 -->
				  <span> / 내가 준 평점:
					  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
		                  	<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
		              </svg>
		          </span>
		   		  </div>
		   		  <div>
		   		  	<img src="${pageContext.request.contextPath}${tmp.storeLogo }" class="card-img-top" alt="...">
		   		  </div>
			      <div class="card-body">
			      	<button class="orderDetailBtn" value="${tmp.orderNum }" style="display:block">주문내역 상세 보기</button>
			      	<button class="orderDetailOffBtn" style="display:none">주문내역 상세 접기</button>
			      	<table class="orderTable" style="display:none;">
			      		<thead>
			      			<tr>
				      			<th>메뉴</th>
				      			<th>수량</th>
				      			<th>가격</th>
			      			</tr>
			      		</thead>
			      		<tbody class="orderDetail">
			      		
			      		</tbody>
			      	</table>
			        <br/>
			        <span>결제 금액</span> <span>${tmp.amount }</span>
			        <p class="card-text"></p>
			        <div>
					<!-- 리뷰작성 Btn -->
					<!-- 리뷰보기 Btn -->	
						<c:choose>
							<c:when test="${tmp.reviewExist == 'YES' }">
								<button data-num="${tmp.num }" class="reviewListBtn circle-btn" data-bs-toggle="modal" data-bs-target="#modal-reviewList">리뷰 보기</button>
								<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewBtn circle-btn" data-bs-toggle="modal" data-bs-target="#reviewModal" style="display:none">리뷰 작성</button>
								<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewUpdateBtn circle-btn" data-bs-toggle="modal" data-bs-target="#reviewUpdateModal">리뷰 수정</button>
								<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewDeleteBtn circle-btn">리뷰 삭제</button>
							</c:when>
							<c:when test="${tmp.reviewExist == 'NO' }">
								<button data-num="${tmp.num }" class="reviewListBtn circle-btn" data-bs-toggle="modal" data-bs-target="#modal-reviewList">리뷰 보기</button>
								<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewBtn circle-btn" data-bs-toggle="modal" data-bs-target="#reviewModal">리뷰 작성</button>
								<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewUpdateBtn circle-btn" data-bs-toggle="modal" data-bs-target="#reviewUpdateModal" style="display:none">리뷰 수정</button>
								<button data-num="${tmp.num }" data-num2="${tmp.orderNum }" class="reviewDeleteBtn circle-btn" style="display:none">리뷰 삭제</button>
							</c:when>
						</c:choose>	
					</div>
				  </div>
				</div>
		      </div>
			</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
<!------------------------------ footer 불러오기 --------------------------->
<jsp:include page="/WEB-INF/views/nav/footer.jsp" />
</div>

<!------------모달창------------------프로필 편집------------------------------------->

<div class="modal animate__animated animate__bounce animate__fadeInDown" tabindex="-1" id="modal-updateForm" aria-labelledby="updateForm" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					<strong>프로필 편집</strong>
				</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<!-- 프로필 이미지 변경 -->
				<a id="profileLink" href="javascript:" >
					<c:choose>
						<c:when test="${dto.profile eq 'profile'}">
							<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" style="width:100px; border-radius: 100%;" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
								  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
							</svg>
						</c:when>
						<c:otherwise>
							<img id="profileImage" style="width:100px; border-radius: 100%;" src="${pageContext.request.contextPath}${dto.profile}" />
						</c:otherwise>
					</c:choose>
				</a>
				<!-- 정보 변경 -->
				<form id="updateForm" action="${pageContext.request.contextPath}/users/update.do" method="post" class="needs-validation">
					<div>
						<label for="image">클릭해서 이미지 변경!</label>
			         	<input type="hidden" name="profile" 
								value="${dto.profile eq 'profile' ? 'profile' : dto.profile}"/>
					</div>
					<div>
						<input class="form-control" type="text" name="name" id="name"
							value="${dto.name}" required="required">
					</div>
					<div>
						<input name="email" id="email" class="form-control"
							value="${dto.email}" disabled />
					</div>
					<div>
						<input class="form-control" type="tel" maxlength="13"
							name="phoneNumber" id="phoneNumber"
							value="${dto.phoneNumber}" required="required">
					</div>
					<div>
						<input class="form-control" type="tel" maxlength="13"
							name="tag" id="tag"
							value=" ${dto.tag}" required="required">
					</div>
					<div style="display: flex; justify-content:flex-end;">
						<button type="submit">정보 수정</button>
					</div>
				</form>
				<!-- 비밀번호 변경 -->
				<form id="pwdUpdate" method="post" action="${pageContext.request.contextPath}/users/pwd_update.do">
					<div>
						<input class="form-control" type="password" name="pwd"
							placeholder="기존 비밀번호" required="required">
					</div>
					<div>
						<input class="form-control" type="password" name="newPwd" id="newPwd"
							placeholder="새 비밀번호" required="required"> <small
							class="form-text">5글자~10글자 이내로 입력하세요.</small>
						<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
					</div>
					<div>
						<input class="form-control" type="password" name="newPwd2" id="newPwd2"
							placeholder="새 비밀번호 재입력" required="required">
						<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
					</div>
					<div style="display: flex; justify-content:flex-end;">
						<button type="submit">비밀번호 변경</button>
					</div>
				</form>
				<div style="display: flex; justify-content:flex-end;" >
					<button id="withdrawal">회원탈퇴</button>
				</div>
			</div>
			
		</div>
	</div>
</div>

<!------------모달창------------- 마이페이지 하단 주문내역 (리뷰 확인) ---------------------------->

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
                    <select name="star">
                    	<c:forEach var="tmp" items="1,2,3,4,5">
                    		<option name="starOption" value="${tmp }">${tmp }</option>
                    	</c:forEach>
                    </select>
                    <input id="inputImg" name="imageFile" type="file" style="display:none;"/>
                    <input type="hidden" name="storeNum" id="insertNum" value="" />
                    <input type="hidden" name="orderNum" id="insertOrderNum" value="" />
                    <textarea name="content" id="inputContent" cols="30" rows="10" placeholer="리뷰를 작성해주세요."></textarea>
                    <button id="addBtn" type="submit">작성 완료</button>
                </form>
            </div>
        </div>
    </div>
</div>
    
<!--------------------------- 리뷰 수정 modal --------------------------------------->
<div class="modal" tabindex="-1" id="reviewUpdateModal" aria-labelledby="menuAddForm" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><strong>리뷰 수정</strong> </h4>
                <button id="updateCloseBtn" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            	<a id="updateImgLink" href="javascript:">
	                <img src="#" alt="" id="updateImg" name="review" class="image mt-3"
	                style="width: 150px; height: 150px; "/>
	            </a>
                <form id="reviewUpdateForm" action="${pageContext.request.contextPath}/store/updateReview.do" method="post" enctype="multipart/form-data">                 
                    <select name="star">
                    	<c:forEach var="tmp" items="1,2,3,4,5">
                    		<option class="updateStar" name="starOption" value="${tmp }">${tmp }</option>
                    	</c:forEach>
                    </select>
                    <input id="inputUpdateImg" name="imageFile" type="file" style="display:none;"/>
                    <input type="hidden" name="storeNum" id="updateNum" value="" />
                    <input type="hidden" name="orderNum" id="updateOrderNum" value="" />
                    <textarea name="content" id="updateContent" cols="30" rows="10"></textarea>
                    <button id="updateBtn" type="submit">수정 완료</button>
                </form>
            </div>
        </div>
    </div>
</div>
   
<!----------------------------- 리뷰 list modal ------------------------------------------------>
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

<!-- 프로필 이미지 넣는용 지우지마용 -->
<form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" 
	  id="imageForm" enctype="multipart/form-data" style="visibility:hidden;'">
	<input type="file" name="image" id="image" 
		accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
</form>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//-----------------------------------리뷰작성 전송폼-------------------------------

	/* // ajaxFormPromise  요청하기 
	document.querySelector('#writeReview').addEventListener("submit", (e)=>{
	  
	  
	  const writeReview = document.querySelector('#writeReview');
	     
	     ajaxFormPromise(writeReview)
	     .then(function(response){
	        return response.json();
	     })
	     .then(function(data){
	        alert("리뷰가 작성되었습니다.");
	        location.href="${pageContext.request.contextPath}/users/info.do";
	     });                        
	  }); */

	//------------------------ 프로필 전송폼 ---------------------------------
	
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	  
	//프로필 이미지를 새롭게 넣으면
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			// 클릭하는 자리에 이미지 넣어주기
			let img=`<img id="profileImage" style="width:100px; border-radius: 100%;" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			document.querySelector("input[name=profile]").value=data.imagePath;
		});
	});
	// 회원 정보 수정 ajax 요청하기 
	
	document.querySelector("#updateForm").addEventListener("submit",function(e) {
		e.preventDefault();
		const updateForm = document.querySelector('#updateForm');
		ajaxFormPromise(updateForm)
		.then(function(response) {
			return response.json();
		})
		.then(function(data) {
			alert("회원 정보가 수정되었습니다.");
			location.href = "${pageContext.request.contextPath}/users/info.do";
		});
	});
	
	//비밀 번호를 확인 하는 함수 
	
	let isPwdValid = false;
	function checkPwd() {

		document.querySelector("#newPwd").classList.remove("is-valid");
		document.querySelector("#newPwd").classList.remove("is-invalid");

		const pwd = document.querySelector("#newPwd").value;
		const pwd2 = document.querySelector("#newPwd2").value;

		// 최소5글자 최대 10글자인지를 검증할 정규표현식
		const reg_pwd = /^.{5,10}$/;
		if (!reg_pwd.test(pwd)) {
			isPwdValid = false;
			document.querySelector("#newPwd").classList.add("is-invalid");
			return; //함수를 여기서 종료
		};

		if (pwd != pwd2) {//비밀번호와 비밀번호 확인란이 다르면
			//비밀번호를 잘못 입력한것이다.
			isPwdValid = false;
			document.querySelector("#newPwd").classList.add("is-invalid");
		} else {
			isPwdValid = true;
			document.querySelector("#newPwd").classList.add("is-valid");
		};
	};
	// 비밀번호 변경 ajax
	document.querySelector("#pwdUpdate").addEventListener("submit",function(e) {
		e.preventDefault();
		if(isPwdValid){
			const pwdUpdateForm = document.querySelector('#pwdUpdate');
			
			ajaxFormPromise(pwdUpdateForm)
			.then(function(response) {
				return response.json();
			})
			.then(function(data) {
				alert("비밀번호가 변경 되었습니다. 다시 로그인 해주세요.");
				location.href = "${pageContext.request.contextPath}/users/loginform.do";
			});
		} else {
			alert("비밀번호가 동일하지 않습니다.");
		}
	});

	//비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
	document.querySelector("#newPwd").addEventListener("input", checkPwd);
	document.querySelector("#newPwd2").addEventListener("input", checkPwd);

	//------------------------------회원 탈퇴--------------------------------------------
	
	document.querySelector("#withdrawal").addEventListener("click",function(){
		
		ajaxPromise("${pageContext.request.contextPath}/users/delete.do")
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			alert(data.email+" 님이 탈퇴 되었습니다.!");
			location.href="${pageContext.request.contextPath}/main.do";
		});
	});

	//---------------------------연락처 자동 하이픈---------------------------------

	const autoHypenPhone = function(str) {
		str = str.replace(/[^0-9]/g, '');
		let tmp = '';
		if (str.length < 4) {
			return str;
		}
		if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}

	let phoneNum = document.querySelector('#phoneNumber');

	phoneNum.onkeyup = function() {
		this.value = autoHypenPhone(this.value);
	}
	
	//--------------------------------주문 내역 상세정보 띄우기-----------------
	let orderDetailBtn = document.querySelectorAll(".orderDetailBtn");
	let orderDetailOffBtn = document.querySelectorAll(".orderDetailOffBtn");
	let orderDetail = document.querySelectorAll(".orderDetail");
	let orderTable = document.querySelectorAll(".orderTable");
	
	
	
	for(let i=0; i<orderDetailBtn.length; i++){
		
		//클릭하면
		orderDetailBtn[i].addEventListener("click",function(){
			let orderNum = this.value;
			//버튼이 갖고 있던 ordernum 정보를 ajax 로 넘겨주고
			ajaxPromise("${pageContext.request.contextPath}/order/orderMenu.do","post","orderNum="+orderNum)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				// orderNum 이 일치하는 메뉴와 수량, 가격을 리스트로 받아온다.
				let td;
				for(let j=0; j<data.list.length; j++){
					// orderTable 에 td로 차례로 넣어주고
					let menu = data.list[j].menu;
					let menuCount = data.list[j].menuCount;
					let price = data.list[j].price;
					let td = document.createElement( "TD" ); 
				     td.innerHTML = menu;  
				     let td1 = document.createElement( "TD" );
				     td1.innerHTML = menuCount; ; 
				     let td2 = document.createElement( "TD" );
				     td2.innerHTML = price; 
				 //    td.style.border = "1px solid #92acbb"; 
				 //    td.style.padding = "3px"; 
				     
					let tr = document.createElement( "TR" ); 
					     tr.appendChild( td );
					     tr.appendChild( td1 ); 
					     tr.appendChild( td2 ); 
					orderDetail[i].appendChild( tr ); 
				};
				// 테이블을 보이게 한다.
				orderTable[i].style.display="block";
				orderDetailOffBtn[i].style.display="block";
				orderDetailBtn[i].style.display="none";
			});
		});
		
		orderDetailOffBtn[i].addEventListener("click",function(){
			// 클릭하면 생성되었던 td 를 전부 지우고
			while (orderDetail[i].hasChildNodes()) {	
				orderDetail[i].removeChild(orderDetail[i].firstChild );
			};
			//테이블을 안보이게 한다.
			orderTable[i].style.display="none";
			orderDetailOffBtn[i].style.display="none";
			orderDetailBtn[i].style.display="block";
		});
		
	}
	
	
	//--------------------------리뷰-----------------------------------------------------------------------------------------------------------
	document.querySelector("#reviewImgLink").addEventListener("click", function(){
		document.querySelector("#inputImg").click();
	});
	document.querySelector("#updateImgLink").addEventListener("click", function(){
		document.querySelector("#inputUpdateImg").click();
	});
	
	viewThumbNail("#inputImg", "#reviewImg");
	viewThumbNail("#inputUpdateImg", "#updateImg");
	
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
					document.querySelector("button.reviewDeleteBtn[data-num2=\'"+num+"\']").style.display="block";
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
	
	// 리뷰 삭제 버튼을 눌렀을 때 동작하는 부분
	let reviewDeleteBtns=document.querySelectorAll(".reviewDeleteBtn");
	for(let i=0; i<reviewDeleteBtns.length; i++){
		reviewDeleteBtns[i].addEventListener("click", function(e){
			e.preventDefault();
			
			let wantDelete=confirm("이 주문에 대한 리뷰를 삭제하시겠습니까?");
			if(wantDelete){
				let orderNum=this.getAttribute("data-num2");
				console.log(orderNum);
				
				ajaxPromise("${pageContext.request.contextPath}/store/deleteReview.do", "post", "orderNum="+orderNum)
				.then(function(response){
					return response.json();
				}).then(function(data){
					console.log(data);
					if(data.beDeleted){
						alert("리뷰를 삭제하였습니다.");
						document.querySelector("button.reviewBtn[data-num2=\'"+orderNum+"\']").style.display="block";
						document.querySelector("button.reviewUpdateBtn[data-num2=\'"+orderNum+"\']").style.display="none";
						document.querySelector("button.reviewDeleteBtn[data-num2=\'"+orderNum+"\']").style.display="none";
					}			
				});	
			}
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
		
			// ajax로 해당 리뷰의 내용을 가져옴
			ajaxPromise("${pageContext.request.contextPath}/store/getReviewData.do", "post", "orderNum="+num2)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beSuccess){
					console.log(data.reviewData);
					let path="${pageContext.request.contextPath}"+data.reviewData.imagePath;
					document.querySelector("#updateImg").setAttribute("src", path);
					document.querySelector("#updateOrderNum").value=data.reviewData.orderNum;
					document.querySelector("#updateContent").innerText=data.reviewData.content;
					document.querySelector("option.updateStar[value=\'"+data.reviewData.star+"\']").selected=true;
				}
			});
		});
	}
	
	updateReview("#reviewUpdateForm");
	
	// 수정 완료 버튼을 눌렀을 때 동작하는 부분
	function updateReview(rel){
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
				if(data.beUpdated){
					document.querySelector("#updateCloseBtn").click();
					alert("리뷰를 수정하였습니다.");
				}
			});
		});
	}
</script>
</body>
</html>