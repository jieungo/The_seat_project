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
</head>
<body>
<div class="container">
   <nav class="navbar navbar-light bg-light">
      <img style= "width: 50px; height: 50px;" src="resources/img/chair.png" alt="chair" />
         <a class="navbar-brand"
            href="${pageContext.request.contextPath}/main.do">자리..<br>있어요?
         </a>
      <form action="${pageContext.request.contextPath}/main.do" method="get">
      <select name="area" id="area" class="form-select" style="width:110px; height:45px;">
         <option value="area" ${area eq 'area' ? 'selected' : '' }>지역</option>
         <option value="Gangnam-gu" ${area eq 'Gangnam-gu' ? 'selected' : '' }>강남구</option>
         <option value="Gangdong-gu" ${area eq 'Gangdong-gu' ? 'selected' : '' }>강동구</option>
         <option value="Seocho-gu" ${area eq 'Seocho-gu' ? 'selected' : '' }>서초구</option>
         <option value="Songpa-gu" ${area eq 'Songpa-gu' ? 'selected' : '' }>송파구</option>
         <option value="Eunpyeong-gu" ${area eq 'Eunpyeong-gu' ? 'selected' : '' }>은평구</option>
      </select>
      <select name="group" id="group" class="form-select" style="width:110px; height:45px;">
         <option value="menu" ${menu eq 'menu' ? 'selected' : '' }>메뉴</option>
         <option value="KoreanFood" ${menu eq 'KoreanFood' ? 'selected' : '' }>한식</option>
         <option value="JapaneseFood" ${menu eq 'JapaneseFood' ? 'selected' : '' }>일식</option>
         <option value="ChineseFood" ${menu eq 'ChineseFood' ? 'selected' : '' }>중식</option>
         <option value="WesternFood" ${menu eq 'WesternFood' ? 'selected' : '' }>양식</option>
         <option value="Dessert" ${menu eq 'Dessert' ? 'selected' : '' }>후식</option>
      </select>
      <input type="text" id="keyword" name="keyword" class="form-control" placeholder="오늘은 뭐 먹을까?" value="${keyword }"/>
      <button id="searchBtn" type="submit" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/main.do'">검색</button>
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
   <div class="container">

      <c:if test="${ not empty dto.keyword }">
         <p>
            <strong>${dto.area }</strong> 지역, <strong>${dto.group }</strong> 메뉴,
            <strong>${dto.keyword }</strong> 검색어로 검색된 내용 자세히 보기
         </p>
      </c:if>
   </div>
   <div class="container toggle">
      <c:choose>
         <c:when test="${list.size() != 0}">
            <c:forEach var="tmp" items="${list }" varStatus="status">
               <a
                  href="${pageContext.request.contextPath}/myStore.do?num=${status.count }"
                  class="store">${tmp.storeName }</a>
            </c:forEach>
            <a data-num="0" id="addBtn0" href="#">+매장 추가</a>
         </c:when>
         <c:otherwise>
            <a data-num="0" id="addBtn0" href="#">+매장 추가</a>
         </c:otherwise>
      </c:choose>
   </div>
</body>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
   crossorigin="anonymous"></script>
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>

<script>
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
         /*
         ajaxPromise("${pageContext.request.contextPath}/newStore.do")
         .then(function(response){
            return response.json();
         }).then(function(data){
            console.log(data);
         });
          */

         let newAnchor = document.createElement("a");
         newAnchor.innerText = "매장 관리";
         newAnchor.setAttribute("data-num", dataNum);
         newAnchor.setAttribute("class", "store");

         newAnchor.setAttribute("id", "addBtn" + strDataNum);
         document.querySelector(".toggle").prepend(newAnchor);
         resetDataNum();
      }
   });

   // 전체의 data-num을 조정하는 function
   function resetDataNum() {
      let array = document.querySelectorAll("a[class='store']");
      for (let i = 0; i < array.length; i++) {
         array[i].setAttribute("data-num", i);
         array[i].setAttribute("href", storePath + i);
      }
   }
</script>
</html>