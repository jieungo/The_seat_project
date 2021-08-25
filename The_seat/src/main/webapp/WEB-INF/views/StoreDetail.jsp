<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StoreDetail.jsp</title>
<!-- bootstrap 외부 링크 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" 
   integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style>
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
</head>
<body>
<div class="container">
   <nav class="navbar navbar-light bg-light">
      <img style= "width: 50px; height: 50px;" src="resources/img/chair.png" alt="chair" />
         <a class="navbar-brand"
            href="${pageContext.request.contextPath}/main.do">자리..<br>있어요?
         </a>
      <form action="${pageContext.request.contextPath}/main.do" method="get">
      	<div style="margin-right: 500px">
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
	      <input type="text" id="keyword" name="keyword" placeholder="오늘은 뭐 먹을까?" value="${keyword }"/>
	      <button id="searchBtn" type="submit" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/main.do'">검색</button>
      	</div>
      </form>
         <button class="navbar-toggler" type="button"
            data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
            aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="offcanvas offcanvas-end" tabindex="-1"
            id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
               <h5 class="offcanvas-title" id="offcanvasNavbarLabel"></h5>
               <button type="button" class="btn-close text-reset"
                  data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
               <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                  <li class="nav-item"><a class="nav-link active"
                     aria-current="page" href="#">UserName</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">마이 페이지</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
                  <li class="nav-item dropdown"><a
                     class="nav-link dropdown-toggle" href="#"
                     id="offcanvasNavbarDropdown" role="button"
                     data-bs-toggle="dropdown" aria-expanded="false"> 매장 목록 </a>
                     <ul class="dropdown-menu"
                        aria-labelledby="offcanvasNavbarDropdown">
                        <li><a class="dropdown-item" href="#">The Station</a></li>
                        <li><a class="dropdown-item" href="#">STARBUCKS</a></li>
                        <li><a class="dropdown-item" href="#">SUBWAY</a></li>
                     </ul>
                  </li>
               </ul>
               <form class="d-flex">
                  <input class="form-control me-2" type="search"
                     placeholder="Search here!" aria-label="Search">
                  <button class="btn btn-outline-primary" type="submit">Search</button>
               </form>
            </div>
         </div>
   </nav>
</div>

</body>
</html>