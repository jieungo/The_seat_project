<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	// <input>태그의 name 속성값을 사용하여 사용자의 입력값을 수신한다.
	String search = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/main.jsp</title>
<!-- bootstrap 외부 링크 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<style>
	a:link{
		color: black;
		text-decoration: none;
	}
 	a:visited {
 		color: black;
 		text-decoration: none;
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
		text-align-last: center;
		text-align: center;
	}
	img{
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>
<div class="container">
	<jsp:include page="nav/navbar.jsp" />

	<c:if test="${ not empty dto.keyword }">
		<p>
			<strong>${dto.area }</strong> 지역, <strong>${dto.group }</strong> 메뉴,
			<strong>${dto.keyword }</strong> 검색어로 검색된 내용 자세히 보기
		</p>
	</c:if>
</div>

<!-- 임시 검색 결과 -->
<div class="container" style="margin-top: 20px;">
	<div class="row row-cols-3 row-cols-md-2 g-4">
		<c:forEach var="tmp" items="${list }">
			<a href="${pageContext.request.contextPath}/store/storeDetail.do?num=${tmp.num}">
				<div class="col">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="${pageContext.request.contextPath}${tmp.image_logo } "class="img-fluid" alt="storeImageLogo">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">이름 : ${tmp.storeName }</h5>
								<p class="card-text">주소 : ${tmp.storeAddr }</p>
								<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
							</div>
						</div>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
</div>
<p>테스트용 리뷰 링크</p>
<a href="${pageContext.request.contextPath}/store/test.do">테슽흐</a>
</body>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>

<script>

</script>
</html>