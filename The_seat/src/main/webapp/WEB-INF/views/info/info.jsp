<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
<style>

* {
    box-sizing: border-box;
}

/* 버튼 기본 스타일링 */
button {
    outline: none;
    border: none;
    background-color: transparent;
}

::-webkit-scrollbar {
  display: none;
}

ul{
margin:0;
padding:0;
list-style:none;
}

li {
    list-style: none;
    padding-left: 0;
}

.container {
    margin-top: 30px;
}

.my-page__header {
    display: flex;
    justify-content: space-evenly;
    align-items: flex-end;

}

.my-page__profile {
    display: flex;
    align-items: center;
}

.divide-line {
    width: 100%;
    height: 1px;
    background-color: lightgray;
    margin: 20px 0;
}

.my-page__order {
    border: 1px solid lightgray;
}

.circle-btn {
    width: 100px;
    height: 100px;
    border: 1px solid lightgray;
    border-radius: 100%;
    margin: 10px 20px;
    margin-bottom: 25px;
}

</style>
</head>
<body>
<!-- navbar -->

<ul class="container">

    <!----------------- 마이페이지 상단 프로필 ------------->

<header class="my-page__header">
   <div class="my-page__profile mt-2 mb-2">
       <img class="me-5" src="<%-- ${dto.profile } --%>" alt="프로필 이미지" style="width: 100px; height: 100px; border-radius: 100%;">
       <div>
          <h3>${dto.name}님의 마이페이지
            <c:choose>
	          <c:when test="${ not empty StoreDto.storeName }">
         		<span>(Owner)</span>
	    	  </c:when>
			  <c:otherwise>
				<span>(Guest)</span>
			  </c:otherwise>
			</c:choose> 
           </h3> 
           <h4>${dto.tag }</h4>
        </div>
    </div>

      <button type="button" class="text-btn my-page__edit" data-bs-toggle="modal" data-bs-target="#modal-updateForm">
           프로필 편집
           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
               <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
               <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
           </svg>
       </button>
</header>

<div class="divide-line out-divide-line" style="text-align: center;";></div>


    <!------------------- 마이페이지 하단 주문내역 ------------------>

<div style="height:420px; text-overflow: hidden; overflow-x: auto;"> 
<ul class="m-3">
    <li class="col-3">
    <span>${StoreDto.regdate }</span>
    <div class="my-page__order">
        <h5>${StoreDto.storeName }</h5>
        <div class="divide-line"></div>
        <img src="${StoreDto.image_logo }" alt="store_img" >
        <ul> <!-- 주문내역 --> <!-- for문으로 출력해야겠당-->
            <li>주문상품명</li>
            <li>주문상품명</li>
        </ul>
        <div class="divide-line"></div>
        <span>결제 금액</span>
        <span><!-- 결제 금액 --></span>
        <div class="divide-line"></div>
        <div>
            <span>매장평점: 
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                </svg>
                <span><!-- 매장평점 --></span>
            </span>
            <span>
                / 내가 준 평점:
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
                </svg>
                <span><!-- 내가 준 평점 --></span>
            </span>
        </div>
              
<!----------------------- 마이페이지 하단 주문내역 (리뷰 작성 모달창) ---------------------------->

      <div class="divide-line"></div>
      <button type="button" class="circle-btn" data-bs-toggle="modal" data-bs-target="#modal-write_review">
          리뷰작성
      </button>

       <div class="modal animate__animated animate__bounce animate__fadeInDown" tabindex="-1" id="modal-write_review" aria-labelledby="modal-write_review" aria-hidden="true">
         <div class="modal-dialog">
             <div class="modal-content">
             <div class="modal-header">
                <h3 class="modal-title"><strong>리뷰작성</strong> </h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
               <form id="writeReview" name="writeReview" action="${pageContext.request.contextPath}/users/info.do" method="post">
                   <button class="form-control" type="button" name="imageBtn" id="imageBtn" required="required">
                       + 이미지 업로드
                   </button>
                   <textarea class="form-control" name="reviewArea" id="reviewArea" cols="50" rows="10" placeholder="리뷰를 작성해주세요!" required="required"></textarea>
                   <button type="submit" class="btn-white">작성완료</button>
               </form>
             </div>
             </div>
         </div>
       </div>

<!------------------------- 마이페이지 하단 주문내역 (리뷰 확인 모달창) ---------------------------->

        <button type="button" class="circle-btn" data-bs-toggle="modal" data-bs-target="#modal-check_review">
            리뷰확인
        </button>

       <div class="modal animate__animated animate__bounce animate__fadeInDown" tabindex="-1" id="modal-check_review" aria-labelledby="modal-check_review" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><strong>리뷰확인</strong> </h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="checkReview" action="${pageContext.request.contextPath}/users/info.do" method="post">
                    <!-- 리뷰 for문 출력-->
                  </form>
              </div>
              </div>
 			</div>
 		</div>
   </div>
 </div>
 </li>
 </ul>
       
      <!-------------------프로필 편집 모달창 ------------------>
       
    <div class="modal animate__animated animate__bounce animate__fadeInDown" tabindex="-1" id="modal-updateForm" aria-labelledby="updateForm" aria-hidden="true">
	<div class="modal-dialog">
	<div class="modal-content">
	<div class="modal-header">
	<h4 class="modal-title"><strong>프로필 편집</strong> </h4>
		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
	<div class="modal-body">
			<form id="updateForm" action="${pageContext.request.contextPath}/users/updateform.do" method="post" class="needs-validation">
				 <div>
		             <input class="form-control" type="hidden" name="profile" id="profile">
		         </div>
		         <div>
		             <input class="form-control" type="text" name="name" id="name" placeholder="이름: ${dto.name}" required="required">
		         </div>
		         <div>
		             <input class="form-control" type="password" name="pwd" id="pwd" placeholder="비밀번호" required="required">
		             <small class="form-text">5글자~10글자 이내로 입력하세요.</small>
                     <div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		         </div>
		         <div>
		             <input class="form-control" type="password" name="pwd2" id="pwd2" placeholder="비밀번호 재입력" required="required">
		         	 <div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		         </div>
		         <div>
		             <input class="form-control" type="tel"  pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" name="phoneNumber" 
		             id="phoneNumber" placeholder="연락처: ${dto.phoneNumber}" required="required">
		        </div>
		        <div>
                    <input name="email" id="email" class="form-control"  placeholder="${dto.email}" disabled/>
                </div>
	        	<button type="submit">완료</button>
         	</form>
   </div> 
   </div>
   </div>
</div>


<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>


//-----------------------------------리뷰작성 전송폼-------------------------------

	/* // ajaxFormPromise  요청하기 
   document.querySelector('#writeReview').addEventListener("submit", (e)=>{
      
      
      const writeReview = document.querySelector('#writeReview');
         
         ajaxFormPromise(writeReview)
         .then(function(response){
            return response.json();
         })
         .then(function(data){
            alert("리뷰가 작성되었습니다.");
            location.href="${pageContext.request.contextPath}/users/info.do";
         });                        
      }); */
      
     
   //------------------------ 프로필 전송폼 ---------------------------------
   
   
   let isPwdValid=false;
     
      //비밀 번호를 확인 하는 함수 
   function checkPwd(){
      
      document.querySelector("#pwd").classList.remove("is-valid");
      document.querySelector("#pwd").classList.remove("is-invalid");
      
      const pwd=document.querySelector("#pwd").value;
      const pwd2=document.querySelector("#pwd2").value;
      
      // 최소5글자 최대 10글자인지를 검증할 정규표현식
      const reg_pwd=/^.{5,10}$/;
      if(!reg_pwd.test(pwd)){
         isPwdValid=false;
         document.querySelector("#pwd").classList.add("is-invalid");
         return; //함수를 여기서 종료
      };
      
      if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면
         //비밀번호를 잘못 입력한것이다.
         isPwdValid=false;
         document.querySelector("#pwd").classList.add("is-invalid");
      }else{
         isPwdValid=true;
         document.querySelector("#pwd").classList.add("is-valid");
      };
   };
   
   //비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
   document.querySelector("#pwd").addEventListener("input", checkPwd);
   document.querySelector("#pwd2").addEventListener("input", checkPwd);
   
   
   // ajax 요청하기 
   
   document.querySelector("#updateForm").addEventListener("submit", function(e){
	   e.preventDefault();
     	const updateForm = document.querySelector('#updateForm');
         
      
         ajaxFormPromise(updateForm)
         .then(function(response){
            return response.json();
         })
         .then(function(data){
            alert("회원 정보가 수정되었습니다.");
            location.href="${pageContext.request.contextPath}/users/info.do";
         });                        
   });
   
   
 //---------------------------연락처 자동 하이픈---------------------------------
   
   const autoHypenPhone = function(str){
       str = str.replace(/[^0-9]/g, '');
       let tmp = '';
       	if (str.length < 4) {
           return str;
         } if (str.length < 7) {
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3);
           return tmp;
         } else if (str.length < 11) {
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3, 3);
           tmp += '-';
           tmp += str.substr(6);
           return tmp;
         } else {
           tmp += str.substr(0, 3);
           tmp += '-';
           tmp += str.substr(3, 4);
           tmp += '-';
           tmp += str.substr(7);
           return tmp;
         }
   
       return str;
 	}


 	let phoneNum = document.querySelector('#phoneNumber');
 	
 	phoneNum.onkeyup = function(){
 	  this.value = autoHypenPhone( this.value ) ;  
 	}

</script>

</body>
</html>