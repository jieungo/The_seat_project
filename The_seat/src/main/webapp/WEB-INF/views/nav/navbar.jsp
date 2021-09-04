<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
   crossorigin="anonymous"></script>
<style>
   *{
      font-family: 'IBM Plex Sans KR', sans-serif;
   }
   .navbar{ 
       position: relative;
       display: flex;
       flex-wrap: wrap;
       flex-direction: row;
       align-items: center;
       justify-content: space-between;
       padding-top: .5rem;
       padding-bottom: .5rem;
   }
   
   /*.modal-backdrop {
       position: fixed;
       top: 0;
       left: 0;
       z-index: 1040;
       width: 100vw;
       height: 100vh;
       background-color: black;
   }*/
   
   /*.modal-backdrop.fade.show {
   		background-repeat: norepeat;
	}*/
	
   #area, #group{
      width: 110px;
      margin-left: 40px;
      height: 45px;
      margin-top: 30px;
      border: solid 2px rgb(108, 146, 252);
      border-radius: 10px;
      text-align-last: center;
      text-align: center;
   }
   #area, #group:focus{
      outline: none;
   }
   #keyword{
      width: 250px;
      height: 40px;
      margin-left: 50px;
      margin-bottom: 30px;
      border: none;
      border-radius: 2px;
      border-bottom: solid 4px rgb(108, 146, 252);
      text-align-last: center;
      text-align: center;
   }
    #keyword:hover{
      outline:none;
      transform:scale(1.1);
	  -webkit-transform:scale(1.1);
	  font-weight: bold;
   }
   #keyword:focus{
      outline:none;
	  font-weight: bold;
   }
   #searchBtn{
      width: 110px;
      height: 50px;
      border: none;
      background-color: white;
   }
   #burgerBtn{
      border: none;
      background-color: white;
   }
   #burgerBtn:hover{
   	  transform:scale(1.1);
	  -webkit-transform:scale(1.1);
   }
</style>
<nav class="navbar navbar-light">
	<div style="display:flex; align-items:center;">
	   <img id="chair" style="width: 50px; height: 50px;"
	      src="${pageContext.request.contextPath}/resources/img/chair.png"
	      alt="chair" /> 
	      <br/>
	      <a class="navbar-brand" style="font-family: 'Do Hyeon', sans-serif;"
	      href="${pageContext.request.contextPath}/main.do">자리..<br>있어요?</a>
	</div>
   <form action="${pageContext.request.contextPath}/main.do" method="get">
      <div class="container" style="margin-top:0; margin-right:250px;">
         <select name="area" id="area">
            <option value="area" ${area eq 'area' ? 'selected' : '' }>지역</option>
            <option value="Gangnam-gu"
               ${area eq 'Gangnam-gu' ? 'selected' : '' }>강남구</option>
            <option value="Gangdong-gu"
               ${area eq 'Gangdong-gu' ? 'selected' : '' }>강동구</option>
            <option value="Seocho-gu" ${area eq 'Seocho-gu' ? 'selected' : '' }>서초구</option>
            <option value="Songpa-gu" ${area eq 'Songpa-gu' ? 'selected' : '' }>송파구</option>
            <option value="Eunpyeong-gu"
               ${area eq 'Eunpyeong-gu' ? 'selected' : '' }>은평구</option>
         </select> 
         <select name="group" id="group">
            <option value="menu" ${menu eq 'menu' ? 'selected' : '' }>메뉴</option>
            <option value="KoreanFood"
               ${menu eq 'KoreanFood' ? 'selected' : '' }>한식</option>
            <option value="JapaneseFood"
               ${menu eq 'JapaneseFood' ? 'selected' : '' }>일식</option>
            <option value="ChineseFood"
               ${menu eq 'ChineseFood' ? 'selected' : '' }>중식</option>
            <option value="WesternFood"
               ${menu eq 'WesternFood' ? 'selected' : '' }>양식</option>
            <option value="Dessert" ${menu eq 'Dessert' ? 'selected' : '' }>후식</option>
         </select>
         <input type="text" id="keyword" name="keyword" placeholder="오늘은 뭐 먹을까?" value="${keyword }" />
         <button id="searchBtn" type="submit" onclick="location.href='${pageContext.request.contextPath}/main.do'">
            <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="50" height="50"
             viewBox="0 0 485.6 485.6" style="enable-background:new 0 0 485.6 485.6;" xml:space="preserve">
               <g>
                  <g>
                  <path style="fill:#3C92CA;" d="M447.5,477.85l30.3-30.3c4-4,4-10.4,0-14.4l-149.2-149.2l-44.7,44.7l149.2,149.2
                     C437.1,481.85,443.5,481.85,447.5,477.85z"/>
                  <path d="M163.4,67.05c-53.2,0-96.5,43.3-96.5,96.5c0,5,4.1,9.1,9.1,9.1s9.1-4.1,9.1-9.1c0-43.2,35.1-78.3,78.3-78.3
                     c5,0,9.1-4.1,9.1-9.1C172.5,71.05,168.4,67.05,163.4,67.05z"/>
                  <path d="M335,277.55c-3.5-3.5-9.3-3.5-12.8,0l-15.9,15.9l-21.1-21.1c25.9-28.9,41.7-67.1,41.7-108.9
                     c0-90.1-73.3-163.4-163.4-163.4S0,73.35,0,163.45s73.3,163.4,163.4,163.4c41.8,0,79.9-15.8,108.9-41.7l21.1,21.1l-15.9,15.9
                     c-1.7,1.7-2.7,4-2.7,6.4s1,4.7,2.7,6.4l141.9,141.9c5.6,5.6,13,8.7,20.9,8.7s15.3-3.1,20.9-8.7l15.7-15.7c5.6-5.6,8.7-13,8.7-20.9
                     s-3.1-15.3-8.7-20.9L335,277.55z M18.2,163.45c0-80.1,65.2-145.3,145.3-145.3s145.3,65.2,145.3,145.3s-65.2,145.3-145.3,145.3
                     S18.2,243.55,18.2,163.45z M464.1,448.45l-15.7,15.7c-2.2,2.2-5,3.4-8.1,3.4s-5.9-1.2-8.1-3.4l-135.5-135.5l31.9-31.9l135.5,135.5
                     c2.2,2.2,3.4,5,3.4,8.1S466.2,446.35,464.1,448.45z"/>
            </svg>
         </button>
      </div>
   </form>
   <button id="burgerBtn" data-bs-toggle="offcanvas"
      data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 512 512" width="50" height="50" fill="rgb(108, 146, 252)">
        <g>
          <g>
            <g>
              <g>
                <path d="m480.7,228.6h-449.2c-11.3,0-20.4-9.1-20.4-20.4v-29.7c-1.77636e-15-92.4 75.1-167.5 167.4-167.5h155.1c92.3,0 167.5,75.1 167.5,167.5v29.7c0,11.2-9.2,20.4-20.4,20.4zm-428.8-40.9h408.3v-9.3c0-69.8-56.8-126.6-126.6-126.6h-155.1c-69.8,0-126.6,56.8-126.6,126.6v9.3z"/>
              </g>
              <g>
                <path d="M435.4,501H76.7c-36.2,0-65.6-29.4-65.6-65.6v-54.2c0-11.3,9.1-20.4,20.4-20.4h449.1c11.3,0,20.4,9.1,20.4,20.4v54.2      C501.1,471.6,471.6,501,435.4,501z M51.9,401.6v33.8c0,13.7,11.1,24.8,24.8,24.8h358.7c13.7,0,24.8-11.1,24.8-24.8v-33.8H51.9z"/>
              </g>
              <g>
                <path d="m31.5,334.7c-7.2,0-14.2-3.8-17.9-10.6-5.4-9.9-1.8-22.3 8.1-27.7l42-23c25.1-13.8 56.3-13.8 81.5,0 13,7.1 29.2,7.1 42.2,0l18.9-10.4c25.1-13.8 56.4-13.8 81.5,0l17.5,9.6c13,7.1 29.2,7.1 42.2,0l20.5-11.3c25.1-13.8 56.3-13.8 81.5,0l41.1,22.6c9.9,5.4 13.5,17.8 8.1,27.7-5.4,9.9-17.8,13.5-27.7,8.1l-41.1-22.5c-13-7.1-29.2-7.1-42.2,0l-20.5,11.3c-25.1,13.8-56.3,13.8-81.5,0l-17.5-9.6c-13-7.1-29.2-7.1-42.2,0l-19,10.2c-25.1,13.8-56.4,13.8-81.5,0-13-7.1-29.2-7.1-42.2,0l-42,23c-3.1,1.8-6.5,2.6-9.8,2.6z"/>
              </g>
            </g>
          </g>
        </g>
      </svg>
   </button>
   <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
      aria-labelledby="offcanvasNavbarLabel">
      <div class="offcanvas-header">
         <h5 class="offcanvas-title" id="offcanvasNavbarLabel">
            <c:choose>
               <c:when test="${sessionScope.email ne null }">
                  <img id="userProfile" alt="프로필 이미지"
                        style="width: 60px; height: 60px; border-radius:100%;">
                  <span id="userName" style="font-weight: bold; font-size: 33px;"></span> 님 로그인 중..
               </c:when>
               <c:otherwise>
                  <span style="font-size: 1.5em;">반갑습니다 😊</span>
               </c:otherwise>
            </c:choose>
         </h5>
         <button type="button" class="btn-close text-reset"
            data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
         <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
            <li class="nav-item"><a class="nav-link active"
               aria-current="page" href="#"></a></li> 
            <li class="nav-item"><c:choose>
                  <c:when test="${sessionScope.email ne null }">
                     <a class="nav-link"
                        href="${pageContext.request.contextPath}/users/info.do">마이페이지</a>
                  </c:when>
                  <c:otherwise>
                     <a class="nav-link"
                        href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
                  </c:otherwise>
               </c:choose></li>
            <li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>

            <div class="toggle">
               <c:choose>
                  <c:when test="${sessionScope.email !=null && myStoreList.size() != 0}">
                     <c:forEach var="tmp" items="${myStoreList }" varStatus="status">
                        <li><a href="${pageContext.request.contextPath}/store/myStore.do?num=${status.count }"
                           class="store">${tmp.storeName }</a></li>
                     </c:forEach>
                  </c:when>
               </c:choose>
            </div>
            <br>
            <br>
            <br>
            <br>
            
            <li><a data-num="0" id="addBtn0" href="#">+매장 추가</a></li>
            <br>
            <br>
            <c:if test="${sessionScope.email ne null }">
               <li class="nav-item"><a class="nav-link"
                  href="${pageContext.request.contextPath}/users/logout.do">
                     로그아웃 </a></li>
            </c:if>
         </ul>
      </div>
   </div>
</nav>
<script
   src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
   if(${sessionScope.email ne null }){
      // session 정보로 이름 정보 가져오기
      ajaxPromise("${pageContext.request.contextPath}/users/getData.do").then(
            function(response) {
               return response.json()
            }).then(function(data) {
         document.querySelector("#userName").innerText = data.dto.name;
         document.querySelector("#userProfile").setAttribute("src","${pageContext.request.contextPath}"+data.dto.profile);
      });
   }
   
   document.querySelector("#chair").addEventListener("click", function() {
      location.href = "${pageContext.request.contextPath}/main.do";
   });
   
   
   // 매장 추가 관리 영역
   let dataNum = 0;
   let storePath = "${pageContext.request.contextPath}/store/myStore.do?num=";
   
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
         
         ajaxPromise("${pageContext.request.contextPath}/newStore.do")
         .then(function(response){
            return response.json();
         }).then(function(data){
            console.log(data);
         });
         
         
         let newAnchor = document.createElement("a");
         newAnchor.innerText = "Default Name";
         newAnchor.setAttribute("data-num", dataNum);
         newAnchor.setAttribute("class", "store");
         
         newAnchor.setAttribute("id", "addBtn" + strDataNum);
         document.querySelector(".toggle").appendChild(newAnchor);
         resetDataNum();
      }
   });
   
   // 전체의 data-num을 조정하는 function
   function resetDataNum() {
      let array = document.querySelectorAll("a[class='store']");
      for (let i = 0; i < array.length; i++) {
         let num=i+1;
         array[i].setAttribute("data-num", num);
         array[i].setAttribute("href", storePath + num);
      }
   }


   // 네비바의 의자 로고 누르면 메인페이지로 이동
   
   document.querySelector("#chair").addEventListener("click", function() {
      location.href = "${pageContext.request.contextPath}/main.do";
   });
</script>