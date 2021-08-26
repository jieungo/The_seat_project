<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>storeDetail.jsp</title>
<!-- bootstrap 외부 링크 참조 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<style>
</style>
</head>
<body>
	<div class="container">
		<!-- 네비바를 import 한다. -->
		<jsp:include page="nav/navbar.jsp" />
			<section class="d-grid gap-2 col-3 mx-auto">
				<!-- DB 연동해서 파라미터 값으로 칼럼 값을 받아온다.  -->
				<img src="${dto.image_logo }" alt="storeLogo" />
				<span style="font-size: 2em;">A TWOSOME PLACE</span>
			</section>
		<div id="carouselExampleDark" class="carousel carousel-dark slide"
			data-bs-ride="carousel" style="width: 500px;">
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
				<div class="carousel-inner">
					<div class="carousel-item active" data-bs-interval="10000">
						<img src="${pageContext.request.contextPath}/resources/img/coffee.jpg" class="d-block w-100" alt="FirstBestmenu">
						<div class="carousel-caption d-none d-md-block">
							<h5>First Best Menu</h5>
						</div>
					</div>
					<div class="carousel-item" data-bs-interval="2000">
						<img src="${pageContext.request.contextPath}/resources/img/cake.jpg" class="d-block w-100" alt="SecondBestmenu">
						<div class="carousel-caption d-none d-md-block">
							<h5>Second Best Menu</h5>
						</div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/resources/img/sandwich.jpg" class="d-block w-100" alt="ThirdBestmenu">
						<div class="carousel-caption d-none d-md-block">
							<h5>Third Best Menu</h5>
						</div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/resources/img/juice.png" class="d-block w-100" alt="ThirdBestmenu">
						<div class="carousel-caption d-none d-md-block">
							<h5>Fourth Best Menu</h5>
						</div>
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
		</div>
		
		<div class="card text-center">
			<!-- 파라미터 값으로 매장 정보를 받아온다. -->
			<h5>별점 : </h5>
  			<h3 class="card-header">#카페 #케이크 맛집</h3>
  			<div class="card-body">
    			<h5 class="card-title">주소 : 서울 강남구 테헤란로27길 16 BMY역삼타워</h5>
    			<h5 class="card-title">운영 시간 : 평일 08:00 - 23:00 주말 11:00 - 22:20</h5>
    			<h5 class="card-title">남은 자리 : 13 / 14 (예약 가능)</h5>
    			<a href="#" class="btn btn-primary">리뷰 : 123개</a>
  			</div>
  			<button class="btn btn-primary">자리 잡으러 가기!</button>
		</div>
	</div>
</body>
</html>