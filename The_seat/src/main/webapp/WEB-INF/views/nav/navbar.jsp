<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<style>

	*{
		font-family: 'IBM Plex Sans KR', sans-serif;
	}
	#area, #group{
		width: 110px;
		margin-left: 30px;
		height: 45px;
		margin-top: 30px;
		border: solid 2px gray;
		border-radius: 5px;
		text-align-last: center;
		text-align: center;
	}
	#area, #group:focus{
		outline: none;
	}
	#keyword{
		width: 200px;
		height: 35px;
		margin-left: 30px;
		margin-bottom: 30px;
		border-radius: 5px;
		border: solid 2px gray;
	}
</style>
<nav class="navbar navbar-light bg-light">
	<img id="chair" style="width: 50px; height: 50px;"
		src="${pageContext.request.contextPath}/resources/img/chair.png"
		alt="chair" /> <a class="navbar-brand" style="font-family: 'Do Hyeon', sans-serif;"
		href="${pageContext.request.contextPath}/main.do">자리..<br>있어요?
	</a>
	<form action="${pageContext.request.contextPath}/main.do" method="get">
		<div style="margin-right: 500px">
			<select name="area" id="area">
				<option value="area" ${area eq 'area' ? 'selected' : '' }>지역</option>
				<option value="Gangnam-gu"
					${area eq 'Gangnam-gu' ? 'selected' : '' }>강남구</option>
				<option value="Gangdong-gu"
					${area eq 'Gangdong-gu' ? 'selected' : '' }>강동구</option>
				<option value="Seocho-gu" ${area eq 'Seocho-gu' ? 'selected' : '' }>서초구</option>
				<option value="Songpa-gu" ${area eq 'Songpa-gu' ? 'selected' : '' }>송파구</option>
				<option value="Eunpyeong-gu"
					${area eq 'Eunpyeong-gu' ? 'selected' : '' }>은평구</option>
			</select> <select name="group" id="group">
				<option value="menu" ${menu eq 'menu' ? 'selected' : '' }>메뉴</option>
				<option value="KoreanFood"
					${menu eq 'KoreanFood' ? 'selected' : '' }>한식</option>
				<option value="JapaneseFood"
					${menu eq 'JapaneseFood' ? 'selected' : '' }>일식</option>
				<option value="ChineseFood"
					${menu eq 'ChineseFood' ? 'selected' : '' }>중식</option>
				<option value="WesternFood"
					${menu eq 'WesternFood' ? 'selected' : '' }>양식</option>
				<option value="Dessert" ${menu eq 'Dessert' ? 'selected' : '' }>후식</option>
			</select> <input type="text" id="keyword" name="keyword"
				placeholder="오늘은 뭐 먹을까?" value="${keyword }" />
			<button id="searchBtn" type="submit" class="btn btn-dark"
				onclick="location.href='${pageContext.request.contextPath}/main.do'">검색</button>
		</div>
	</form>
	<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
		data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
		aria-labelledby="offcanvasNavbarLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasNavbarLabel">
				<c:choose>
					<c:when test="${sessionScope.email ne null }">
						<img id="userProfile" alt="프로필 이미지"
								style="width: 60px; height: 60px; border-radius:100%;">
						<span id="userName" style="font-weight: bold; font-size: 33px;"></span>님 로그인 중..
					</c:when>
					<c:otherwise>
						<span>반갑습니다.</span>
					</c:otherwise>
				</c:choose>
			</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#"></a></li> 

				<li class="nav-item"><c:choose>
						<c:when test="${sessionScope.email ne null }">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/users/info.do">마이페이지</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link"
								href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
						</c:otherwise>
					</c:choose></li>
				<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>

				<div class="toggle">
					<c:choose>
						<c:when test="${sessionScope.email !=null && myStoreList.size() != 0}">
							<c:forEach var="tmp" items="${myStoreList }" varStatus="status">
								<li><a href="${pageContext.request.contextPath}/myStore.do?num=${status.count }"
								   class="store">${tmp.storeName }</a></li>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
				<br>
				<br>
				<br>
				<br>
				
				<li><a data-num="0" id="addBtn0" href="#">+매장 추가</a></li>
				<br>
				<br>
				<c:if test="${sessionScope.email ne null }">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/users/logout.do">
							로그아웃 </a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
<script
	src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	if(${sessionScope.email ne null }){
		// session 정보로 이름 정보 가져오기
		ajaxPromise("${pageContext.request.contextPath}/users/getData.do").then(
				function(response) {
					return response.json()
				}).then(function(data) {
			document.querySelector("#userName").innerText = data.dto.name;
			document.querySelector("#userProfile").setAttribute("src","${pageContext.request.contextPath}"+data.dto.profile);
		});
	}
	
	document.querySelector("#chair").addEventListener("click", function() {
		location.href = "${pageContext.request.contextPath}/main.do";
	});
	
	
	// 매장 추가 관리 영역
	let dataNum = 0;
	let storePath = "${pageContext.request.contextPath}/myStore.do?num=";
	
	document.querySelector("#addBtn0").addEventListener("click", function(e) {
		// 일단 링크 이동을 막고
		e.preventDefault();
		// 매장 추가 여부를 확인하고
		let callAdd = confirm("매장을 추가하시겠습니까?");
		// 확인을 눌렀다면
		if (callAdd) {
			dataNum++;
			let strDataNum = dataNum.toString();
			
			// ajax 응답으로 새 매장 정보를 DB에 추가
			
			ajaxPromise("${pageContext.request.contextPath}/newStore.do")
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
			});
			
			
			let newAnchor = document.createElement("a");
			newAnchor.innerText = "Default Name";
			newAnchor.setAttribute("data-num", dataNum);
			newAnchor.setAttribute("class", "store");
			
			newAnchor.setAttribute("id", "addBtn" + strDataNum);
			document.querySelector(".toggle").appendChild(newAnchor);
			resetDataNum();
		}
	});
	
	// 전체의 data-num을 조정하는 function
	function resetDataNum() {
		let array = document.querySelectorAll("a[class='store']");
		for (let i = 0; i < array.length; i++) {
			let num=i+1;
			array[i].setAttribute("data-num", num);
			array[i].setAttribute("href", storePath + num);
		}
	}


	// 네비바의 의자 로고 누르면 메인페이지로 이동
	
	document.querySelector("#chair").addEventListener("click", function() {
		location.href = "${pageContext.request.contextPath}/main.do";
	});
</script>