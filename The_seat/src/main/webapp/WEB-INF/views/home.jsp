<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<!-- bootstrap 외부 링크 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" 
   integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style>
	body{
		background-color: #2e8eff;
		color: white;
	}
	#area, #group{
		width: 100px;
		margin-right: 30px;
		height: 40px;
		margin-top: 30px;
		border: none;
		border-radius: 5px;
		text-align-last: center;
		text-align: center;
	}
	#area, #group:focus{
		outline: none;
	}
	#keyword{
		height: 40px;
		margin-top: 30px;
		outline: none;
		border: none;
		border-radius: 10px;
		text-align: center;
	}
	#searchBtn{
		height: 40px;
		margin-top: 10px;
		border-radius: 10px;
	}
	#loginBtn{
		height: 40px;
		margin-top: 20px;
		outline: none;
		border: none;
		border-radius: 10px;
	}
</style>
</head>
<body>
<div style="margin-top:100px;">
<a href="${pageContext.request.contextPath}/users/info.do">내정보</a>
		<section class="d-grid gap-2 col-2 mx-auto">
    	<p>이젠, 빈자리 찾아 해매지 말자!</p>
        <span style="font-size: 3em;">자리..<br>있어요?</span>
		</section>
	<!-- get 방식을 활용해 메인 페이지 URL 에 select & option 태그 설정 -->
	<form action="${pageContext.request.contextPath}/main.do" method="get">
		<div style="text-align: center; margin-right: 110px;">
			<select name="area" id="area">
				<option value="null" ${area eq 'area' ? 'selected' : '' }>지역</option>
				<option value="Gangnam-gu" ${area eq 'Gangnam-gu' ? 'selected' : '' }>강남구</option>
				<option value="Gangdong-gu" ${area eq 'Gangdong-gu' ? 'selected' : '' }>강동구</option>
				<option value="Seocho-gu" ${area eq 'Seocho-gu' ? 'selected' : '' }>서초구</option>
				<option value="Songpa-gu" ${area eq 'Songpa-gu' ? 'selected' : '' }>송파구</option>
				<option value="Eunpyeong-gu" ${area eq 'Eunpyeong-gu' ? 'selected' : '' }>은평구</option>
			</select>
			<select name="group" id="group">
				<option value="null" ${menu eq 'menu' ? 'selected' : '' }>메뉴</option>
				<option value="KoreanFood" ${menu eq 'KoreanFood' ? 'selected' : '' }>한식</option>
				<option value="JapaneseFood" ${menu eq 'JapaneseFood' ? 'selected' : '' }>일식</option>
				<option value="ChineseFood" ${menu eq 'ChineseFood' ? 'selected' : '' }>중식</option>
				<option value="WesternFood" ${menu eq 'WesternFood' ? 'selected' : '' }>양식</option>
				<option value="Dessert" ${menu eq 'Dessert' ? 'selected' : '' }>후식</option>
			</select>
		</div>
		<br/>
		<div class="d-grid gap-2 col-3 mx-auto">
		<input type="text" id="keyword" name="keyword" placeholder="오늘은 뭐 먹을까?"/>
		</div>
		<br/>
		<div class="d-grid gap-2 col-3 mx-auto">
		<button id="searchBtn" type="submit" class="btn btn-warning">검색</button>
		</div>
	</form>
	<c:if test="${sessionScope.email eq null }">
		<div class="d-grid gap-2 col-3 mx-auto">
			<button id="loginBtn" style="background-color: #d4d4d4;" onclick="location.href='${pageContext.request.contextPath}/users/loginform.do'">로그인</button>
		</div>
   </c:if>
</div>
</body>
</html>