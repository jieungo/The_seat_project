<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">

	<h6>이젠, 빈자리 찾아 헤매지 말자!</h6>
	<h1>자리..</h1>
	<h1>있어요?</h1>
	
	<!-- get 방식을 활용해 메인 페이지 URL 에 select & option 태그 설정 -->
	<form action="${pageContext.request.contextPath}/main.do" method="get">
		<select name="area" id="area">
			<option value="area" ${area eq 'area' ? 'selected' : '' }>지역</option>
			<option value="Gangnam-gu" ${area eq 'Gangnam-gu' ? 'selected' : '' }>강남구</option>
			<option value="Gangdong-gu" ${area eq 'Gangdong-gu' ? 'selected' : '' }>강동구</option>
			<option value="Seocho-gu" ${area eq 'Seocho-gu' ? 'selected' : '' }>서초구</option>
			<option value="Songpa-gu" ${area eq 'Songpa-gu' ? 'selected' : '' }>송파구</option>
			<option value="Eunpyeong-gu" ${area eq 'Eunpyeong-gu' ? 'selected' : '' }>은평구</option>
		</select>
		<select name="group" id="group">
			<option value="menu" ${menu eq 'menu' ? 'selected' : '' }>메뉴</option>
			<option value="KoreanFood" ${menu eq 'KoreanFood' ? 'selected' : '' }>한식</option>
			<option value="JapaneseFood" ${menu eq 'JapaneseFood' ? 'selected' : '' }>일식</option>
			<option value="ChineseFood" ${menu eq 'ChineseFood' ? 'selected' : '' }>중식</option>
			<option value="WesternFood" ${menu eq 'WesternFood' ? 'selected' : '' }>양식</option>
			<option value="Dessert" ${menu eq 'Dessert' ? 'selected' : '' }>후식</option>
		</select>
		<br/>
		<input type="text" id="keyword" name="keyword" placeholder="오늘은 뭐 먹을까?" value="${keyword }"/>
		<br/>
		<button type="submit" onclick="location.href='${pageContext.request.contextPath}/main.do'">검색</button>
	</form>
	<br />
	<button onclick="location.href='${pageContext.request.contextPath}/users/loginform.do?url=${param.url }'">로그인</button>
</div>
</body>
</html>