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
<body>
<div class="container">
	<jsp:include page="../nav/navbar.jsp" />
	
<!--------------------- 마이페이지 상단 프로필 -------------------------->
	<header>
		<div class="my-page__profile mt-2 mb-2">
			<img class="me-5" src="${pageContext.request.contextPath}${dto.profile }" alt="프로필 이미지"
				style="width: 100px; border-radius: 100%;">
			<div>
				<h3>${dto.name}님의 마이페이지
					<c:choose>
						<c:when test="<%-- {dto.storeName ne null } --%>"> 
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
	
<!--------------------------- 마이페이지 하단 주문내역 ------------------------------->
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
			      	<p>${tmp.orderNum }</p>
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
			      <img src="${pageContext.request.contextPath}${tmp.storeLogo }" class="card-img-top" alt="...">
			      <div class="card-body">
			        <button>주문내역 상세보기</button>
			        <br />
			        <span>결제 금액</span> <span>${tmp.amount }</span>
			        <p class="card-text"></p>
			        <div>
					<!-- 리뷰작성 Btn -->
						<button type="button" class="circle-btn" data-bs-toggle="modal"data-bs-target="#modal-write_review" style="display:inline;">리뷰작성</button>
					<!-- 리뷰보기 Btn -->	
						<button type="button" class="circle-btn" data-bs-toggle="modal"data-bs-target="#modal-check_review" style="display:inline;">리뷰확인</button>
					</div>
				  </div>
				</div>
		      </div>
			</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>

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
								value="${ dto.profile eq 'profile' ? 'profile' : dto.profile}"/>
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

<div class="modal animate__animated animate__bounce animate__fadeInDown"
	tabindex="-1" id="modal-check_review"
	aria-labelledby="modal-check_review" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">
					<strong>리뷰확인</strong>
				</h3>
				<button type="button" class="btn-close"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="checkReview"
					action="${pageContext.request.contextPath}/users/info.do"
				method="post">
				<!-- 리뷰 for문 출력-->
				</form>
			</div>
		</div>
	</div>
</div>

<!----------모달창------------- 마이페이지 하단 주문내역 (리뷰 작성) ---------------------------->

<div class="modal animate__animated animate__bounce animate__fadeInDown" tabindex="-1" id="modal-write_review" aria-labelledby="modal-write_review" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title">
					<strong>리뷰작성</strong>
				</h3>
				<button type="button" class="btn-close"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="writeReview" name="writeReview"
					action="${pageContext.request.contextPath}/users/info.do"
					method="post">
					<button class="form-control" type="button" name="imageBtn"
						id="imageBtn" required="required">+ 이미지 업로드</button>
					<textarea class="form-control" name="reviewArea"
						id="reviewArea" cols="50" rows="10"
						placeholder="리뷰를 작성해주세요!" required="required"></textarea>
					<button type="submit" class="btn-white">작성완료</button>
				</form>
			</div>
		</div>
	</div>
<!------------------------------ footer 불러오기 --------------------------->
<jsp:include page="/WEB-INF/views/nav/footer.jsp" />
</div>
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
</script>
</body>
</html>