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
			
			-->
		</c:forEach>
	</div>
	
	
</body>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script>

</script>
</html>