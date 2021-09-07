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
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/storeOrder.css?ver=2"
	type="text/css" /> --%>
</head>
<style>

* {
    box-sizing: border-box;
    margin:0;
}

body {
    background-color: #598eff;
    height: 100vh;
    width: 100vw;
    display: flex;
    flex-direction:column;
    align-items: center;
    justify-content: center;
    color: rgb(78, 78, 78);
    -ms-overflow-style: none;
}

::-webkit-scrollbar { display: none; } /*특정 부분 스크롤바 없애기*/ 
.box{ -ms-overflow-style: none; } 
.box::-webkit-scrollbar{ display:none; }

.box {
	height:500px;
	text-overflow: hidden; 
    overflow-x: auto;
    height: 450px;
}

/* 버튼 기본 스타일링 */
button {
    outline: none;
    border: none;
    background-color: transparent;
    color: rgb(78, 78, 78);
}

input:focus {
    outline: none;
}

button:focus {
    outline: none;
    border: none;
}

/* 리스트 기본 스타일링 */
ul {
    padding: 0;
    margin: 0;
    list-style: none;
}

.store__order-header {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    margin-bottom:10px;
}

.store__order-header > h4 {
    font-weight: 700;
}

.store__order-header > form > input {
    border: none;
    border-radius: 20px;
    padding: 8px 10px;
    text-align: center;
    box-shadow: 1px 1px 11px rgba(172, 172, 172, 0.699);
    font-size: 14px;
}

.search-btn {
    background-color: #598eff;
    color: white;
    border-radius: 100%;
    width: 30px;
    height: 30px;
    font-size: 16px;
    margin-left: 5px;
    box-shadow: 1px 1px 11px rgba(172, 172, 172, 0.699);
}

.store__order-user {
    width: 100%;
    margin: 5px 0;
}

.store__order-user > h5, h6 {
    font-weight: 600;
    font-size: 18px;
}

.store__order-user > h5 {
    color: #598eff;
    margin-bottom: 10px;
}

.white-box {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: space-between;
    text-align: center;
}

.order,
.reserve {
    background-color: white;
    width: 50%;
    height: 400px;
    padding: 15px;
}

.box-title{
    margin: 5px 0;
    margin-bottom: 15px;
}

.reserve {
    width: 250px;
}

.line {
    height: 1.5px;
    background-color: gray;
    width: 100%;
    margin-bottom: 5px;
}

.dot {
    border: 1px dashed gray;
    margin-bottom: 5px;
}

.myStore_container-gray {
    display: flex;
    justify-content: center;
    flex-direction: column;
    background-color: #ECECEC;
    border-radius: 10px;
    height: 550px;
   	width: 900px;
}

::-webkit-scrollbar {
    display: none;
}

.inner_container {
    display: flex; 
    align-items: center; 
    flex-direction: column;
}

.list-item {
    padding: 10px 0;
    font-size: 14px;
}

.order__total {
    font-weight: 500;
}



.list-item {
    padding: 10px 0;
    font-size: 14px;
}


.reserve-body {
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 70%;
    align-items: flex-start; 
}

.reserve-info {
    padding: 10px;
    font-size: 14px;
    display:flex;
    width: 100%;
}

.reserve-info > strong {
    margin-left: 10px;
}

.reserve-btn {
    color: #598eff;
    box-shadow: 1px 1px 11px rgba(172, 172, 172, 0.699);
    width: 90%;
    height: 10%;
    border-radius: 20px;
    font-weight: 600;
}

.aside {
    display: flex;
    flex-direction: column;
    align-items: stretch;
    justify-content: space-evenly;
    height: 100%;
    left: 100%;
    padding: 0;
}

.aside > button {
    border: 1px solid #ECECEC;
    background-color: white;
    border-radius: 0 5px 5px 0;
    border: 1px solid #ECECEC;
    width: 15vw;
    height: 20vh;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 20px;
    font-weight: 700;
    transition: color 0.2s ease-in-out;
}


.aside button:nth-child(4) {
    background-color: #ECECEC;
    color: #598eff;
    border-left: none;
}

.orderDetail > tr {
	display: flex;
	justify-content:space-between;
	align-items:center;
	padding-right:10px;
	margin-bottom:3px;
}

.orderDetail > tr > td {
	font-size:14px;
}

.orderDetail > tr > td:first-child {
	width:35%;
}

</style>
<body>
    <!------------------------------- navbar 추가 -------------------------------->
<jsp:include page="../nav/navbar2.jsp" />
<div class="myStore_container-gray" style="display: flex; flex-direction: row; justify-content: space-between">
<div style="width:750px; display: flex; flex-direction: column; padding: 20px 30px;">
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
    <div class="box">
    	<c:choose>
    		<c:when test="${empty orderList }">
    			<h2>주문내역이 없습니다.</h2>
    			<h3>매장을 잘 관리해 주세요!!</h3>
    		</c:when>
    		<c:otherwise>
    			<c:forEach var="tmp" items="${orderList }">
				    <div id="inner" class="inner_container" style="display: flex;"> 
				        <div class="store__order-user">
				        	<p>주문번호 ${tmp.orderNum }</p><span class="orderNum" style="display:none;">${tmp.orderNum }</span>
				            <h5 class="name"></h5><span class="email" style="display:none;">${tmp.email }</span>
				            <h6>${tmp.amount } (결제완료)</h6>
				        </div>
				        <div class="white-box">
				            <section class="order">
				                <div class="order__body">
				                    <h5 class="box-title">주문내역</h5>
				                    <div class="line"></div>
				                    <div>
					                    <table style="width:100%;">
					                    	<thead class="mb-2">
					                    		<tr class="row" style="display:flex; justify-content:space-between; align-items:center;
					                    		margin:10px 0;">
					                    			<th class="col" style="padding:0 5px;">메뉴명</th>
					                    			<th class="col ps-0" style="text-align:end;">수량</th>
					                    			<th class="col ps-0 pe-4" style="text-align:end;">가격</th>
					                    		</tr>
					                    	</thead>
					                    	<tbody class="orderDetail col ps-3 pe-3" >
					                    		
					                    	</tbody>
					                    </table>
				                   
				                    <div class="dot mt-3 mb-3"></div>
				                    <ul>
				                        <li class="row">
				                            <span class="col">총 금액</span>
				                            <span class="col">${tmp.amount }</span>
				                        </li>
				                    </ul>
				                    </div>
				                </div>
				            </section>
				    <!------------------------------ 예약정보 박스 --------------------------------------->
				            <section class="reserve">
				                <h5 class="box-title">예약정보</h5>
				                <div class="reserve-body">
				                    <div class="reserve-info">
				                        <span>전화번호</span>
				                        <strong style="width:120px;" class="phone"></strong>
				                    </div>
				                    <div class="reserve-info">
				                        <span>좌석정보</span>
				                        <strong style="width:120px;">${tmp.tableNum }번 좌석</strong>
				                    </div>
				                    <div class="reserve-info">
				                        <span>주문시간</span>
				                        <strong style="width:120px;">${tmp.regdate }</strong>
				                    </div>
				                </div>
				                <c:choose>
				                	<c:when test="${tmp.cancel eq 'NO' }">
				                		<c:choose>
						                	<c:when test="${tmp.confirm eq 'NO' }">
						                		<button class="reserve-btn confirm">확인</button>
						                	</c:when>
						                	<c:when test="${tmp.confirm eq 'YES' }">
						                		<button class="reserve-btn confirm" disabled>완료</button>
						                	</c:when>
						                </c:choose>
				                	</c:when>
				                	<c:when test="${tmp.cancel eq 'YES' }">
				                		<c:when test="${tmp.cancel eq 'YES' }">
					                		<button class="reserve-btn cancelComplete">주문 취소 확인</button>
					                		<button class="reserve-btn cancelReject">주문 취소 거절</button>
					                	</c:when>
					                	<c:when test="${tmp.cancel eq 'COMPLETE' }">
					                		<button class="reserve-btn cancel" disabled>취소 완료</button>
					                	</c:when>
					                	<c:when test="${tmp.cancel eq 'REJECT' }">
					                		<button class="reserve-btn cancel" disabled>취소 거절 후 완료</button>
					                	</c:when>
				                	</c:when>
				                </c:choose>
				                
				                
				            </section>
				        </div>
				    </div>
				    <div class="line box" style="margin: 40px 0;"></div>
				</c:forEach>
    		</c:otherwise>
    	</c:choose>
	    
    </div>
</div>
        <!------------------------------------ 옆 사이드바 (매장정보, 메뉴관리 탭) ----------------->
        <aside class="aside">
             <button onclick="location.href='#'">매장 정보</button>
             <button onclick="location.href='${pageContext.request.contextPath}/store/manageMenu.do?num=${dto.num}&storeName=${dto.storeName}'">메뉴 관리</button>
             <button onclick="location.href='${pageContext.request.contextPath}/store/storeReview.do'">리뷰 관리</button>
             <button onclick="location.href='${pageContext.request.contextPath}/store/storeOrder.do'">주문 확인</button>
             <button onclick="location.href='${pageContext.request.contextPath}/store/storeSeat.do'">자리 관리</button>
         </aside>
</div>
<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
let orderEmail = document.querySelectorAll(".email");
let orderName = document.querySelectorAll(".name");
let phone = document.querySelectorAll(".phone");
let orderNumber = document.querySelectorAll(".orderNum");
let orderDetail = document.querySelectorAll(".orderDetail");
let orderConfirm = document.querySelectorAll(".confirm");


for(let i=0; i<orderEmail.length; i++){
	let email = orderEmail[i].innerText;
	ajaxPromise("${pageContext.request.contextPath}/users/getOrderData.do","post","email="+email)
	.then(function(response) {
		return response.json();
	})
	.then(function(data) {
		let name = data.dto.name;
		let phoneNumber = data.dto.phoneNumber;
		orderName[i].innerText=name+"님이 주문하셨습니다.";
		phone[i].innerText=phoneNumber;
	});
	
	let orderNum = orderNumber[i].innerText;
	
	ajaxPromise("${pageContext.request.contextPath}/order/orderMenu.do","post","orderNum="+orderNum)
	.then(function(response){
		return response.json();
	})
	.then(function(data){
		// orderNum 이 일치하는 메뉴와 수량, 가격을 리스트로 받아온다.
		let td;
		for(let j=0; j<data.list.length; j++){
			// orderTable 에 td로 차례로 넣어주고
			let menu = data.list[j].menu;
			let menuCount = data.list[j].menuCount;
			let price = data.list[j].price;
			let td = document.createElement( "TD" ); 
		     td.innerHTML = menu;  
		     let td1 = document.createElement( "TD" );
		     td1.innerHTML = menuCount; ; 
		     let td2 = document.createElement( "TD" );
		     td2.innerHTML = price; 
		     
			let tr = document.createElement( "TR" ); 
			     tr.appendChild( td );
			     tr.appendChild( td1 ); 
			     tr.appendChild( td2 ); 
			orderDetail[i].appendChild( tr ); 
		};
	});
	
	orderConfirm[i].addEventListener("click", function(){
		
		ajaxPromise("${pageContext.request.contextPath}/order/updateState.do","post","orderNum="+orderNum+"&confirm=YES")
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			if(data.isSuccess == true){
				orderConfirm[i].innerText = '완료';
				orderConfirm[i].setAttribute('disabled',true);
			}
		})
	})
}




</script>
</body>
</html>