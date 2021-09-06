<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet"
href="${pageContext.request.contextPath}/resources/css/storeOrder2.css?ver=1"
type="text/css" />
</head>
<body>
    <!------------------------------- navbar 추가 -------------------------------->
<jsp:include page="../nav/navbar2.jsp" />
<div class="myStore_container" style="display: flex; flex-direction: row; justify-content: space-between">
	<div style="display: flex; flex-direction: column; padding: 20px 30px; width: 750px;">
	<!-------------------------- 주문내역 타이틀 및 날짜 검색 ---------------------------->
	<header class="store__order-header">
	    <h4>주문 내역</h4>
	    <form action="#">
	        <input type="date">
	        <button class="search-btn" type="submit">
	            <i class="fas fa-search"></i>
	        </button>
	    </form>
	</header>
		<!------------------------------ 주문내역 텍스트 및 박스 --------------------------------------->
	<div id="inner" class="inner_container" style="display: flex;"> 
	    <div class="accordion" id="accordionExample" style="width: 100%;">
	        <div class="accordion-item mt-5">
	            <h2 class="accordion-header header-custom" id="headingOne">
	            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	                <span>규환 님 (결제완료)</span>
	            </button>
	            </h2>
	            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	            <div class="accordion-body p-0" style="height: 100%;">
	            <div class="white-box">
				<!----------------------------- 주문내역 박스 ----------------------------------------->
		           <section class="order">
		               <div class="order__body">
		                   <ul class="order__list">
		                       <li class="list-item row">
		                           <span class="col-6">아메리카노 (ICED)</span>
		                           <span class="col">2</span>
		                           <span class="col">5,000</span>
		                       </li>
		                       <li class="list-item row">
		                           <span class="col-6">레드벨벳케이크</span>
		                           <span class="col">3</span>
		                           <span class="col">15,000</span>
		                       </li>
		                   </ul>
		                   <div class="dot"></div>
		                   <ul class="order__total">
		                       <li class="list-item row" style="color: #598eff;">
		                           <span class="col-6">총 결제금액</span>
		                           <span class="col">5</span>
		                           <span class="col">20,000</span>
		                       </li>
		                   </ul>
		               </div>
		           </section>
              <!------------------------------------ 예약정보 박스 --------------------------------------->
                   <section class="reserve">
                       <div class="reserve-body">
                           <div class="reserve-info">
                               <span>전화번호</span>
                               <strong>012-345-6789</strong>
                           </div>
                           <div class="reserve-info">
                               <span>좌석정보</span>
                               <strong>2번 좌석</strong>
                           </div>
                           <div class="reserve-info">
                               <span>방문시간</span>
                               <strong>21/09/13 13:00</strong>
                           </div>
                       </div>
                   </section>
               </div>
               </div>
               </div>
            </div>
        </div>

        <!----------------------------- 아코디언 ---------------------------------------------->

        <div class="accordion" id="accordionExample" style="width: 100%;">
            <div class="accordion-item mt-5">
                <h2 class="accordion-header header-custom" id="headingTwo">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" 
                aria-expanded="true" aria-controls="collapseTwo">
                    <span>현미 님 (결제완료)</span>
                </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo" 
                data-bs-parent="#accordionExample">
                <div class="accordion-body p-0" style="height: 100%;">
                    <div class="white-box">
             		<!----------------------------- 주문내역 박스 ----------------------------------------->
                         <section class="order">
                             <div class="order__body">
                                 <ul class="order__list">
                                     <li class="list-item row">
                                         <span class="col-6">아메리카노 (ICED)</span>
                                         <span class="col">2</span>
                                         <span class="col">5,000</span>
                                     </li>
                                     <li class="list-item row">
                                         <span class="col-6">레드벨벳케이크</span>
                                         <span class="col">3</span>
                                         <span class="col">15,000</span>
                                     </li>
                                 </ul>
                                 <div class="dot"></div>
                                 <ul class="order__total">
                                     <li class="list-item row" style="color: #598eff;">
                                         <span class="col-6">총 결제금액</span>
                                         <span class="col">5</span>
                                         <span class="col">20,000</span>
                                     </li>
                                 </ul>
                             </div>
                         </section>
            		 <!------------------------------------ 예약정보 박스 --------------------------------------->
                         <section class="reserve">
                             <div class="reserve-body">
                                 <div class="reserve-info">
                                     <span>전화번호</span>
                                     <strong>012-345-6789</strong>
                                 </div>
                                 <div class="reserve-info">
                                     <span>좌석정보</span>
                                     <strong>2번 좌석</strong>
                                 </div>
                                 <div class="reserve-info">
                                     <span>방문시간</span>
                                     <strong>21/09/13 13:00</strong>
                                 </div>
                             </div>
                         </section>
                      </div>
                  </div>
                  </div>
              </div>
          </div>
   
                <!----------------------------- 아코디언 ---------------------------------------------->
   
		    <div class="accordion" id="accordionExample" style="width: 100%;">
		        <div class="accordion-item mt-5">
		            <h2 class="accordion-header header-custom" id="headingThree">
		            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" 
		            aria-expanded="true" aria-controls="collapseThree">
		                <span>근영 님 (결제완료)</span>
		            </button>
		            </h2>
		            <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" 
		            data-bs-parent="#accordionExample">
		            <div class="accordion-body p-0" style="height: 100%;">
		            <div class="white-box">
           <!----------------------------- 주문내역 박스 ----------------------------------------->
                       <section class="order">
                           <div class="order__body">
                               <ul class="order__list">
                                   <li class="list-item row">
                                       <span class="col-6">아메리카노 (ICED)</span>
                                       <span class="col">2</span>
                                       <span class="col">5,000</span>
                                   </li>
                                   <li class="list-item row">
                                       <span class="col-6">레드벨벳케이크</span>
                                       <span class="col">3</span>
                                       <span class="col">15,000</span>
                                   </li>
                               </ul>
                               <div class="dot"></div>
                               <ul class="order__total">
                                   <li class="list-item row" style="color: #598eff;">
                                       <span class="col-6">총 결제금액</span>
                                       <span class="col">5</span>
                                       <span class="col">20,000</span>
                                   </li>
                               </ul>
                           </div>
                       </section>
           <!------------------------------------ 예약정보 박스 --------------------------------------->
                       <section class="reserve">
                           <div class="reserve-body">
                               <div class="reserve-info">
                                   <span>전화번호</span>
                                   <strong>012-345-6789</strong>
                               </div>
                               <div class="reserve-info">
                                   <span>좌석정보</span>
                                   <strong>2번 좌석</strong>
                               </div>
                               <div class="reserve-info">
                                   <span>방문시간</span>
                                   <strong>21/09/13 13:00</strong>
                               </div>
                           </div>
                       </section>
                   </div>
               	   </div>
               	   </div>
           		</div>
       		</div>
     	</div>
    </div>
    <!------------------------------------ 옆 사이드바 (매장정보, 메뉴관리 탭) ----------------->
    <aside class="store__aside">
        <button>매장 정보</button>
        <button>메뉴 관리</button>
        <button>리뷰 관리</button>
        <button>주문 확인</button>
        <button>자리 관리</button>
    </aside>
</div>
<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>