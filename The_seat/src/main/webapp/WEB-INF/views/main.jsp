<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리.. 있어요?</title>
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
	a:link {
		color: black;
		text-decoration: none;
	}
	
	a:visited {
		color: black;
		text-decoration: none;
	}
	
	#area, #group {
		width: 110px;
		margin-left: 30px;
		height: 45px;
		margin-top: 30px;
		border: solid 2px gray;
		border-radius: 5px;
		text-align-last: center;
		text-align: center;
	}
	
	#area, #group:focus {
		outline: none;
	}
	
	#keyword {
		width: 200px;
		height: 35px;
		margin-left: 30px;
		margin-bottom: 30px;
		border-radius: 5px;
		border: solid 2px gray;
		text-align-last: center;
		text-align: center;
	}
	
	img {
		width: 100px;
		height: 100px;
	}
	
	.main-card {
		/* border: 1px solid lightgray; */
		border-radius: 5px;
		background-color: white;
		transition: all 0.2s ease-in-out;
		max-width: 500px;
		min-width: 300px;
		min-height: 200px;
		margin: auto;
		display:flex;
		align-items:center;
		padding:15px;
	}
	
	.main-card:hover {
		transform: scale(1.1);
		box-shadow: 4px 6px 11px rgba(172, 172, 172, 0.699);
	}
	
	.main-card {
		display: flex;
		justify-content:space-between;
		padding:15px;
		margin-bottom: 20px;
	}
</style>
</head>
<body style="margin-top:200px; background-color:#f6f6f6;">
	<!------------------------------ navbar 불러오기 --------------------------->
	<jsp:include page="/WEB-INF/views/nav/navbar.jsp" />
	
	<div class="container">
		<c:choose>
			<c:when test="${searchData.area == '' and searchData.keyword == ''}">
				<p>
					<strong>뭘 좋아하는 지 몰라서 전부 준비해봤어~ (찡긋)</strong>
					<br>
					${list.size() } 개의 매장이 검색되었습니다.
				</p>
			</c:when>
			<c:when test="${searchData.area != ''}">
				<p>
					<strong>'${searchData.area }'</strong> 지역으로
					<br>
					${list.size() } 개의 매장이 검색되었습니다.
				</p>
			</c:when>
			<c:when test="${searchData.keyword != ''}">
				<p>
					<strong>'${searchData.keyword }'</strong> 검색어로 검색된 내용 자세히 보기
					<br>
					${list.size() } 개의 매장이 검색되었습니다.
				</p>
			</c:when>
			<c:otherwise>
				<p>
					<strong>'${searchData.area }'</strong> 지역,
					<strong>'${searchData.keyword }'</strong> 검색어로 검색된 내용 자세히 보기
					${list.size() } 개의 매장이 검색되었습니다.
				</p>
			</c:otherwise>
		</c:choose>
	</div>

	<!-- 검색 결과 -->
	<div class="container" style="margin-top: 20px; width:80%;">
		<div class="row row-cols-3 row-cols-md-2 g-4" >
			<c:forEach var="tmp" items="${list }">
				<a href="${pageContext.request.contextPath}/store/storeDetail.do?num=${tmp.num}">
					<div class="row g-0 main-card">
						<div class="col-md-6" style="height:100%">
							<img src="${pageContext.request.contextPath}${tmp.image_logo } "
								class="img" style="object-fit:fill; width:100%; height:180px;" alt="storeImageLogo">
						</div>
						<div class="col-md-6">
							<div class="card-body">
								<h5 class="card-title">이름 : ${tmp.storeName }</h5>
								<p class="card-text">주소 : ${tmp.storeAddr }</p>
								<p class="card-text">별점 : ${tmp.avgStar }
								<p class="card-text">
									<c:forEach var="tag" begin="1" items="${tmp.storeTag }">
										#${tag }
									</c:forEach>
								</p>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<!------------------------------ footer 불러오기 --------------------------->
	<jsp:include page="/WEB-INF/views/nav/footer.jsp" />
</body>
</html>