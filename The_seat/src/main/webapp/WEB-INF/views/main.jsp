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
   <jsp:include page="nav/navbar.jsp" />

      <c:if test="${ not empty dto.keyword }">
         <p>
            <strong>${dto.area }</strong> 지역, <strong>${dto.group }</strong> 메뉴,
            <strong>${dto.keyword }</strong> 검색어로 검색된 내용 자세히 보기
         </p>
      </c:if>
   </div>
   
   <a href="${pageContext.request.contextPath}/StoreDetail.do">매장 상세 페이지</a>
   
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
   <!-- 임시 검색 결과 -->
   <div class="container">
      <div class="row row-cols-3 row-cols-md-2 g-4">
         <c:forEach var="tmp" items="${list }">
            <div class="col">
                 <div class="row g-0">
                   <div class="col-md-4">
                        <img src="..." class="img-fluid rounded-start" alt="...">
                   </div>
                   <div class="col-md-8">
                        <div class="card-body">
                          <h5 class="card-title">이름 : ${tmp.storeName }</h5>
                          <p class="card-text">주소 : ${tmp.storeName }</p>
                          <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                   </div>
                 </div>
              </div>
           </c:forEach>
      </div>
   </div>
</body>
<script src="js/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>

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