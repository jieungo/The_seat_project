<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto.storeName }</title>
<!-- 외부 css 링크 로딩하기 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<!------------------ 타이틀 로고 -------------------->
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/snow.jpg">
<style>

	/*************리뷰 보는 버튼 css************/
	#reviewBtn {
		background-color: rgb(142, 192, 242);
		margin-top: 20px;
		width: 140px;
		height: 60px;
		border: none;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 600;
		color: #ffffff;
		border-radius: 15px;
		box-shadow: 1px 8px 11px rgba(172, 172, 172, 0.699);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
	}
	
	#reviewBtn:hover {
		background-color: rgb(142, 192, 242);
		box-shadow: 0px 15px 20px rgb(142, 192, 242);
		color: #fff;
		transform: translateY(-7px);
	}
	
	/************ 자리 잡는 버튼 css ************/
	#seatBtn {
		background-color: rgb(108, 156, 252);
		color: white;
		margin-top: 10px;
		width: 400px;
		height: 50px;
		border-radius: 5px;
		border: none;
		font-size: 1.5em;
		font-weight: bold;
	  	transition: all .3s ease;
	  	letter-spacing: 2px;
	  	text-transform: uppercase;
	  	outline: none;
	  	align-self: center;
	  	cursor: pointer;
	}
	
	#seatBtn:hover{
		animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
	}
	
	@keyframes random-bg {
	  	from {
	    filter: hue-rotate(0);
	  }
	  to {
	    filter: hue-rotate(360deg);
	  }
	}
	
	@keyframes grow {
	  0% {
	    transform: scale(1);
	  }
	  14% {
	    transform: scale(1.3);
	  }
	  28% {
	    transform: scale(1);
	  }
	  42% {
	    transform: scale(1.3);
	  }
	  70% {
	    transform: scale(1);
	  }
	}
	
	/********** 메뉴 이름 버튼 css ************/
	#menuBtn {
		background-color: white;
		border: none;
		font-size: 1.5em;
		font-weight: bold;
		color: rgb(96, 92, 99);
	}
	
	/************** 베스트 메뉴 보이는 이미지 css **************/
	#bestMenu {
		display: flex;
		justify-content: space-around;
	}
	
	/********* 클래스 하나에만 적용하는 투명 스크롤바 css ********/
	.carousel-inner::-webkit-scrollbar {
	  	display: none;
	}

	/********* 자리 잡는 모달에서 select 박스 css ********/
	#seatChoice {
	    margin-left: 10px;
	    width: 60px;
	    border: 1px solid lightgray;
	    border-radius: 5px;
	    padding-left: 15px;
	}
	
	#seatChoice:focus{
		outline: none;
	}
	
	/****** 베스트 메뉴 hover 하면 메뉴명과 가격 보이게 하는 css *****/
	.banner_img {
  		display:inline-block;
  		position: relative;
	}
	.banner_img:hover:after,
	.banner_img:hover > .hover_text {
	  	display:block;
	}
	.banner_img:after, .hover_text{
  		display:none;
	}
	.banner_img:after {
	  	content:'';
	  	position: absolute;
	  	top: 0;
	  	right: 0;
	  	bottom: 0;
	  	left: 0;
	  	background: rgba(0, 0, 0, 0.5);
	  	z-index: 10;
	}
	.banner_img {
  		overflow: hidden;
	}
	.banner_img img{
 		height: 300px;
	}
	.banner_img:hover img{
  		transform: scale(1.2);
  		transition: 1s;
	}
	.hover_text {
  		position: absolute;
  		top: 120px;
  		left: 50px;
	  	color: #ffffff;
	  	border-bottom: solid 2px #fff;
	  	z-index: 20;
	  	font-weight: 600;
	  	font-size: 20px;
	}
	
	/******* 스크롤바 css *******/
	::-webkit-scrollbar {
    	width: 15px;
  	}
  	::-webkit-scrollbar-thumb {
    	background-color: rgb(196, 196, 196);
    	border-radius: 10px;
    	background-clip: padding-box;
    	border: 2px solid transparent;
  	}
  	::-webkit-scrollbar-track {
    	background-color: rgb(229, 229, 229);
   	 	border-radius: 10px;
    	box-shadow: inset 0px 0px 5px white;
  	}
 
 	/* 매장 대표 이미지 꽉 채워서 보이게 하는 css */
 	.mainImg {
 		width: 100%;
 		height: 500px;
 		object-fit: fill;
 	}
  
</style>
</head>
<!---------------------- 네비바를 import 한다. ------------------------->
<jsp:include page="/WEB-INF/views/nav/navbar.jsp" />
<body style="margin-top:150px;">
<div class="container">
	
	<section style="text-align: center; margin-top: 10px;">
		<!---------------------- DB 연동해서 파라미터 값으로 칼럼 값을 받아온다.  --------------------->
		<img src="${pageContext.request.contextPath}${dto.image_logo }"
			alt="storeLogo" style="width:60px; border-radius: 100%;"/> <span
			style="font-size: 2.5em; font-weight: bold; color: rgb(85, 152, 252); text-shadow: 2px 6px 2px #d3d3d3; text-align: center;">  ${dto.storeName }</span>
	</section>
	<div class="row">
		<!--------------------- 매장의 대표 이미지 4개를 Carousel 로 띄우기  -------------------------->
		<div id="carouselExampleDark"
			class="col carousel carousel-dark slide" data-bs-ride="carousel"
			style="width: 500px; margin-top: 50px; margin-bottom: 30px;">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="3" aria-label="Slide 4"></button>
			</div>
			<div class="carousel-inner" style="width:100%; height: 500px; overflow: auto; box-shadow : 10px 7px 7px #999;">
				<div class="carousel-item active" data-bs-interval="10000">
					<img src="${pageContext.request.contextPath}${dto.image_1 }"
						class="d-block w-100 mainImg" alt="매장대표이미지1">
					<!-- <div class="carousel-caption d-none d-md-block"><h5>First</h5></div> -->
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="${pageContext.request.contextPath}${dto.image_2 }"
						class="d-block w-100 mainImg" alt="매장대표이미지2">
					<!-- <div class="carousel-caption d-none d-md-block"><h5>Second</h5></div> -->
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}${dto.image_3 }"
						class="d-block w-100 mainImg" alt="매장대표이미지3">
					<!-- <div class="carousel-caption d-none d-md-block"><h5>Third</h5></div> -->
				</div>
				<div class="carousel-item">
					<img src="${pageContext.request.contextPath}${dto.image_4 }"
						class="d-block w-100 mainImg" alt="매장대표이미지4">
					<!-- <div class="carousel-caption d-none d-md-block"><h5>Fourth</h5></div> -->
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>

			<!------------------------------ 매장 상세 정보 카드 ----------------------------------->
		</div>
		<div class="col card text-center"
			style="max-width: 570px; height: 400px; margin-top: 60px; margin-bottom: 30px; margin-left: 90px; border: none;">
			<!--------------- 파라미터 값으로 매장 정보를 받아온다. ----------------------->

				<div class="card-header bg-transparent border-dark-light">
					<h5>별점 : ⭐ 4.9 (100+)</h5>
					<h3 style="line-height: 1.8;">
					<c:if test="${not empty tagList  }">
						 <c:forEach var="tmp" items="${tagList }">
                        <span>#${tmp } </span>
                     </c:forEach>
					</c:if>
                    
               		</h3>
				</div>
				<div class="card-body" style="margin-top: 10px; line-height: 60px;">
					<h4 class="card-title" style="line-height: 2;">
						매장 주소 : <span>${dto.storeAddr }</span>
					</h4>
					<h4 class="card-title" style="line-height: 2;">
						영업 시간 : <span>${dto.openingTime }</span>
					</h4>
					<h4 class="card-title" style="line-height: 2;">남은 자리 : <span id="emptySeatNum"></span> / <span id="totalSeatNum"></span></h4>
					<button type="button" id="reviewBtn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">리뷰
						: 123개</button>
				</div>
				<div class="card-footer bg-transparent border-dark-light">
					<button type="button" id="seatBtn" data-bs-toggle="modal"
						data-bs-target="#Modalgrid">자리 잡으러 가기 ❕</button>
				</div>
		</div>
<!---------------------------------------- 메뉴판 만들기 ------------------------------------------->
	<!-- 베스트 메뉴 4가지 -->
	<div>
		<p style="font-size: 35px; font-weight: bold; color: rgb(84, 84, 84); text-shadow: 2px 6px 2px #d3d3d3;">Best Menu</p>
	</div>
	<div id="bestMenu">
		<c:forEach var="tmp" items="${menuList }" >
			<c:if test="${tmp.best == 'yes' }">
				<div class="banner_img" style="width:300px; overflow:hidden; box-shadow: 0 5px 18px -7px rgba(0,0,0,1);">
					<img src="${pageContext.request.contextPath}${tmp.menuImage }" class="rounded" style="width:100%; object-fit:cover;"/>
					<p class="hover_text">${tmp.menuName } <br> ${tmp.price } ￦</p>
				</div>
			</c:if>
		</c:forEach>
	</div>

	<!---------------------------------------- 메뉴판 만들기 ------------------------------------------->

	<!-- 메뉴 -->

	<div class="card mb-5"
		style="max-width: auto; height: 700px; margin-top: 30px; background-color: rgb(86, 162, 255); box-shadow: 0 17px 20px -18px rgba(0, 0, 0, 1); ">
		<span
			style="color: white; font-size: 45px; font-weight: bold; text-shadow: 2px 6px 2px gray; margin-left: 85px; margin-top: 25px;">Menu</span>
		<div class="card mb-5"
			style="width: 1130px; height: 600px; overflow: auto; margin-top: 30px; margin-left: 80px; border-radius: 10px; background-color: white;">
			<div class="col" style="margin-bottom: 30px;">
				<!-- 메뉴 리스트 오브잭트 배열 가져와서 꺼내기! -->
				<c:forEach var="tmp" items="${menuList }">
						<input type="hidden" class="menuName" />
						<button data-num="${tmp.num }" type="button" id="menuBtn"
							data-bs-toggle="modal" data-bs-target="#exampleModal"
							style="width: 400px; margin-left: 70px; margin-top: 50px;">${tmp.menuName }</button>
						<span
							style="width: 300px; margin-left: 300px; font-size: 1.5em; font-weight: bold; color: rgb(96, 92, 99);">${tmp.price } ￦</span>
						<!------------모달창-------------- 메뉴 이름 누르면 그에 맞는 이미지 Modal 활성화 -------------------------------->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">${tmp.menuName }</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="card">
											<img src="${pageContext.request.contextPath}${tmp.menuImage }"
												class="img-thumbnail" alt="MenuImage">
											<div class="card-body text-center">
												<p class="card-text">${tmp.content }</p>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">창닫기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<!------------------------------ footer 불러오기 --------------------------->
<jsp:include page="/WEB-INF/views/nav/footer.jsp" />
	
<!--------------모달창-------------- 리뷰 보기 Modal -------------------------------->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">리뷰 보기 ⭐</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="card mb-3" style="max-width: 540px; border: none;">
					<div class="row g-0">
						<div class="col-md-4">
							<h5>신현미 님</h5>
							<!-- <p>★★★★★ 등록일 : 2021.08.19</p> -->
							<img
								src="${pageContext.request.contextPath}/resources/img/review1.jpg"
								class="img-fluid rounded-start" alt="TwosomeReview">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">★★★★★</h5>
								<p class="card-text">케이크가 정말 맛있어요 ๑❤‿❤๑</p>
								<p class="card-text">
									<small class="text-muted">등록일 : 2021.08.19</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="modal-body">...</div>
			<hr />
			<div class="modal-body">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">창닫기</button>
			</div>
		</div>
	</div>
</div>

<!-----------------모달창------------- 자리 잡기 Modal --------------------------------->
<div class="modal fade" id="Modalgrid" tabindex="-1" role="dialog"
	aria-labelledby="Modalgrid" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="ModalLabel">
					${dto.storeName } <br /><span id="emptySeatNum1"></span> / <span id="totalSeatNum1"></span>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<p style="text-align: right; font-size: 20px; font-weight: 500; margin-top: 20px; margin-right: 40px;">자리를 선택해 주세요 😉</p>
			<div class="modal-body">
				<div class="container-fluid">
					<img src="${pageContext.request.contextPath}${sDto.seatImage }" class="img-thumbnail" alt="seatImage">
					<hr />
					<p>자리 선택 
						<select name="자리 선택" id="seatChoice">
						<!-- storeSeat 테이블에서 지정한 만큼 -->
							<c:forEach var="tmp" items="${sDto.totalSeat }">
								<c:if test="${fn:contains(sDto.emptySeat, tmp) }">
		                        	<option value="${tmp}" >${tmp}(이용가능)</option>
		                        </c:if>
		                        <c:if test="${fn:contains(sDto.notEmptySeat, tmp) }">
		                            <option value="${tmp}" disabled>${tmp}(이용중)</option>
		                        </c:if>
		                        <c:if test="${fn:contains(sDto.notUse, tmp) }">
		                            <option value="${tmp}" disabled>${tmp}(이용불가)</option>
		                        </c:if>
							</c:forEach>
						</select>
					</p>
					<hr />
					<div class="card">
						<div class="card-header">✦ 알림사항</div>
						<div class="card-body">
							<p class="card-text">${sDto.seatContent }</p>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">창닫기</button>
				<button type="button" class="btn btn-warning" id="orderBtn">주문하기</button>
			</div>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
let totalSeat = [];
let emptySeat = [];
totalSeat.push(${sDto.totalSeat });
emptySeat.push(${sDto.emptySeat });

document.querySelector("#totalSeatNum").innerText = totalSeat.length;
document.querySelector("#emptySeatNum").innerText = emptySeat.length;
document.querySelector("#totalSeatNum1").innerText = totalSeat.length;
document.querySelector("#emptySeatNum1").innerText = emptySeat.length;

//--------------------주문하러 가기(버튼 누르면)
document.querySelector("#orderBtn").addEventListener("click", function(){
  let num = ${dto.num};
  //버튼 눌렀을때 millisecond 을 추출
  let str = String(Date.now());
  //너무 길어서 필요한 만큼만 orderNum 으로 가져간다.
  let orderNum = str.substring(str.length-6, str.length);
  //선택한 좌석 번호 tableNum 으로 가져간다.
  let tableNum = document.querySelector("#seatChoice").value;
  //get 방식으로 매장 고유번호를 num 으로 가져가고 orderNum,tableNum을 가져간다.
  location.href="${pageContext.request.contextPath}/order/order.do?num="+num+"&tableNum="+tableNum+"&orderNum="+orderNum;
})
</script>
</body>
</html>