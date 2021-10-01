<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap"
	rel="stylesheet">

<style>

body {
	font-family: 'IBM Plex Sans KR', sans-serif;
	background-color: #598eff;
	display: flex;
	justify-content: center;
	align-items: center;
}

ul {
	padding: 0;
}

.nav_icon {
	color: white;
}

.navbarTwo {
	width: 30%;
	padding-bottom: 30px;
	display: flex;
	justify-content: space-between;
	flex-direction: row;
}

#home {
	cursor: pointer;
}

.nav-link, .store, #addBtn0 {
	color: black;
	text-decoration: none;
}

.offcanvas {
	transform: translateX(100%);
	transition: transform 0.5s ease-out;
	background-color: #fff;
}

.offcanvas-header {
	padding: 0 10px;
}

#offcanvasNavbar {
	border: 1px solid white;
}

.offcanvas h5 {
	color: #000;
	margin-top: 20px;
	display: inline-block;
	width: 100%;
	text-align: center;
}

.offcanvas a {
	text-decoration: none;
	font-size: 23px;
	font-weight: 500;
	color: #598eff;
	display: block;
	transition: 0.3s ease-in-out;
	display: inline-block;
	width: 210px;
}

.offcanvas ul .li_ {
	list-style: none;
	text-align: center;
}

#logoutBtn {
	width: 300px;
	font-size: 16px;
	font-weight: 100;
    display: flex;
    justify-content: end;
    margin-top: 30px;
    color: gray;
}

#logoutBtn:hover {
	color: #f20000;
	font-weight: 500;
}


.container {
	margin-top: 30px; 
	text-align: center;
	display: flex;
	flex-direction: column;
	border: 1px solid lightgray;
	border-radius: 10px;
    padding: 10px;
    width: 70%;
}

.container > button {
	padding: 10px 0;
}

.container > button:hover {
	background-color: #598eff;
	color: white;
	border-radius: 10px;
}

.dropdown {
	text-align: center;
	margin-top: 20px;
}

.nav_wrapper {
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
    align-items: center;
    height: 100%;
}

.dropdown-menu {
    width: 100%;
    border-radius: 10px;
}

.dropdown-menu > li {
	display: block;
	padding: 10px 0;
}

li > .list_ {
	font-weight: 100;
    font-size: 16px;
    color: black;
	border-radius: 10px;
}

</style>

<nav class="navbarTwo">

	<i class="fas fa-home fa-2x nav_icon" id="home"></i>

	<button id="bars" data-bs-toggle="offcanvas"
		data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
		<i class="fas fa-bars fa-2x nav_icon"></i>
	</button>

	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
		aria-labelledby="offcanvasNavbarLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasNavbarLabel">
				<c:choose>
					<c:when test="${email ne null }">
						<img id="userProfile" alt="프로필 이미지"
							style="width: 60px; height: 60px; border-radius: 100%;">
						<span id="userName" style="font-weight: bold; font-size: 33px;"></span> 님 로그인 중..
               		</c:when>
					<c:otherwise>
						<span style="color: #000; font-size: 1.8em;">반갑습니다 😊</span>
					</c:otherwise>
				</c:choose>
			</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div class="nav_wrapper">
			<section class="nav_top">
				<div >
					<c:choose>
						<c:when test="${email ne null }">
							<a class="a1"
								href="${pageContext.request.contextPath}/users/info.do"
								style="line-height: 2.5;">마이페이지</a>
						</c:when>
						<c:otherwise>
							<a class="a1"
								href="${pageContext.request.contextPath}/users/loginform.do"
								style="line-height: 2.5;">로그인</a>
						</c:otherwise>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${email !=null && myStoreList.size() == 0}">
						<div class="dropdown" style="margin-top: 30px; display: none; text-align:center;">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-bs-toggle="dropdown"
								aria-expanded="false">
								매장 목록 </a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1"
								style="text-align: center; width: 100%; height: 200px; overflow: auto;">
							</ul>
						</div>
					</c:when>
					<c:when test="${email != null && myStoreList.size() != 0}">
						<div class="dropdown">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-bs-toggle="dropdown"
								aria-expanded="false">
								매장 목록 </a>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1"
								style="text-align: center; overflow: auto;">

								<c:forEach var="tmp" items="${myStoreList }">
									<li><a data-num=${tmp.num } class="list_"
										href="${pageContext.request.contextPath}/store/myStore.do?num=${tmp.num }">${tmp.storeName }</a>
								</c:forEach>
							</ul>
						</div>
					</c:when>
				</c:choose>
				</section>
				<section class="nav_bottom">
					<div class="container">
					<c:if test="${sessionScope.email ne null }">
							<button id="manageStore">매장관리</button>
							<button id="manageMenu1">메뉴관리</button>
							<button id="storeReview1">리뷰관리</button>
							<button id="storeOrder1">주문확인</button>
							<button id="storeSeat1">자리관리</button>
					</c:if>
					</div>
					<c:if test="${email ne null }">
							<a id="logoutBtn" href='${pageContext.request.contextPath}/users/logout.do'>
								로그아웃
							</a>
					</c:if>
				</section>
			</div>
		</div>
	</div>
</nav>
<script
	src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://kit.fontawesome.com/2ebe86210e.js"
	crossorigin="anonymous"></script>
<script>
	document.querySelector("#manageStore").addEventListener("click",function(){
		location.href="${pageContext.request.contextPath}/store/myStore.do?num=${num}";
	});
	document.querySelector("#manageMenu1").addEventListener("click",function(){
		location.href="${pageContext.request.contextPath}/store/manageMenu.do?num=${num}";
	});
	document.querySelector("#storeReview1").addEventListener("click",function(){
		location.href="${pageContext.request.contextPath}/store/storeReview.do?num=${num}";
	});
	document.querySelector("#storeOrder1").addEventListener("click",function(){
		location.href="${pageContext.request.contextPath}/store/storeOrder.do?num=${num}";
	});
	document.querySelector("#storeSeat1").addEventListener("click",function(){
		location.href="${pageContext.request.contextPath}/store/storeSeat.do?num=${num}";
	});
   if(${sessionScope.email ne null }){
      // session 정보로 이름 정보 가져오기
      ajaxPromise("${pageContext.request.contextPath}/users/getData.do").then(
            function(response) {
               return response.json()
            }).then(function(data) {
         document.querySelector("#userName").innerText = data.dto.name;
         if(data.dto.profile == 'profile'){
        	 document.querySelector("#userProfile").setAttribute("src","${pageContext.request.contextPath}/resources/img/user1.png");
        	 document.querySelector("#userProfile").setAttribute('style','width: 55px; height: 50px;');
         }else{
        	 document.querySelector("#userProfile").setAttribute("src","${pageContext.request.contextPath}"+data.dto.profile);
         }
      });
   }
   
   document.querySelector("#home").addEventListener("click", function() {
      location.href = "${pageContext.request.contextPath}/main.do?area=&keyword=";
   });
   
   
   // 매장 추가 관리 영역
   let dataNum = 0;
   let storePath = "${pageContext.request.contextPath}/store/myStore.do?num=";
   
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
</script>