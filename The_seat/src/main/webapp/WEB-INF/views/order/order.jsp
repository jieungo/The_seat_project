<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<!-- 스타일 링크 -->
<link rel="stylesheet"
href="${pageContext.request.contextPath}/resources/css/order.css"
type="text/css" />
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/summer.jpg">

</head>
<body>
<div class="container">
	<jsp:include page="../nav/navbar.jsp" />
	<h1>${dto.storeName } 에서 ${tableNum }번 자리!</h1>
	<div class="order">
		<section>
			<h2>메뉴</h2>
			
			<h3>베스트 메뉴</h3>
			
				<div>
				<c:forEach var="tmp" items="${menuList }" >
					<c:if test="${tmp.best == 'yes' }">
							<form class="orderMenu" action="${pageContext.request.contextPath}/order/insert.do">
								<input type="hidden" name="orderNum" value="${orderNum }"/>
								<input type="hidden" name="email" value="${email }"/>
								<input type="hidden" name="storeName" value="${dto.storeName }"/>
								<input type="hidden" name="storeLogo" value="${dto.image_logo }"/>
								<input type="hidden" name="menu" value="${tmp.menuName }"/>
								<input type="hidden" name="tableNum" value="${tableNum }"/>
								<input type="hidden" name="price" value="${tmp.price}"/>
								<input type="hidden" name="num" value="${dto.num }"/>
								<button type="submit">${tmp.menuName }</button>
								<input type="number" name="menuCount" min="1" max="9" value="1">
							</form>
					</c:if>
				</c:forEach>
				</div>
				
			<h3>전체 메뉴</h3>
			
				<div>
				<c:forEach var="tmp" items="${menuList }">
					<form class="orderMenu" action="${pageContext.request.contextPath}/order/insert.do">
						<input type="hidden" name="orderNum" value="${orderNum }"/>
						<input type="hidden" name="email" value="${email }"/>
						<input type="hidden" name="storeName" value="${dto.storeName }"/>
						<input type="hidden" name="storeLogo" value="${dto.image_logo }"/>
						<input type="hidden" name="menu" value="${tmp.menuName }"/>
						<input type="hidden" name="tableNum" value="${tableNum }"/>
						<input type="hidden" name="price" value="${tmp.price}"/>
						<input type="hidden" name="num" value="${dto.num }"/>
						<button type="submit">${tmp.menuName }</button>
						<input type="number" name="menuCount" min="1" max="9" value="1">
					</form>
				</c:forEach>
				</div>
		</section>
		
		<section>
			<h2>주문 목록</h2>
			
			<div id="orderList"></div>
			<div>
				<p>총 결제 금액: <span id="amount" style="font-size:30px;">0</span></p>
			</div>
			<div>
				<button id="reset">다시 담기</button>
			</div>
			<div>
				<button id="goOrder">주문하기</button>
			</div>
			
		</section>
	</div>
	
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	let orderList = [];
	let amountList = [];
	let orderMenu={};
	let amount = 0;
	
	// 다시담기
	document.querySelector("#reset").addEventListener("click",function(){
		orderList = [];
		amountList = [];
		amount=0;
		document.querySelector("#amount").innerText=amount;
		const orderParent = document.querySelector("#orderList");
		while (orderParent.hasChildNodes()) {	
			orderParent.removeChild(orderParent.firstChild );
		}
	});
	
	let allMenu = document.querySelectorAll(".orderMenu");
	for(let i=0; i<allMenu.length; i++){
		allMenu[i].addEventListener("submit",function(e){
			e.preventDefault();
			let orderNum = this.orderNum.value;
			let email = String(this.email.value);
			let storeName = this.storeName.value;
			let storeLogo = this.storeLogo.value;
			let tableNum = this.tableNum.value;
			let num = this.num.value;
			let menu = this.menu.value;
			let menuCount = this.menuCount.value;
			let a = Number(this.price.value);
			let b = Number(this.menuCount.value);
			let price = a*b;
			
			let span = document.createElement('span');
			span.setAttribute('class','orderMenuList');
			span.innerText=menu;
			document.querySelector("#orderList").appendChild(span);
			
			let span2 = document.createElement('span');
			span2.setAttribute('class','orderMenuCount');
			span2.innerText=" 수량 "+menuCount+"개 ";
			document.querySelector("#orderList").appendChild(span2);
			
			let span3 = document.createElement('span');
			span3.setAttribute('class','orderMenuPrice');
			span3.innerText=(price.toString()
			  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))+"원";
			document.querySelector("#orderList").appendChild(span3);
			
			let br = document.createElement('br');
			document.querySelector("#orderList").appendChild(br);

			orderMenu = {orderNum,email,storeName,storeLogo,num,tableNum,menu,menuCount,price};
			
		//	let two = orderList.indexOf(orderMenu.menu);
			orderList.push(orderMenu);
			let priceInt = Number(price);
			amountList.push(priceInt);
			document.querySelector("#amount").innerText='';
			amount=0;
			amountList.forEach( (item) => {
			  amount += item;
			});
			
			document.querySelector("#amount").innerText=(amount.toString()
					  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))+" 원";
		});
	}
	
	
	
	
	// 주문하기
	document.querySelector("#goOrder").addEventListener("click",function(){
		//주문할때 시간정보전달
		let regdate = new Date();
		for(let i=0; i<orderList.length; i++){
			//주문할때 시간정보 regdate로 넣어주기
			orderList[i].regdate=regdate;
			// {orderNum:"123",email:"123",storeName:"근영식당",storeLogo:"/images/kim1.png",num:"201",tableNum:"1",menu:"보리굴비",menuCount:"1",price:"13000"}
			orderList[i].amount=amount;
			ajaxPromise("${pageContext.request.contextPath}/order/insert.do","post",orderList[i])
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data); 
			});
		}
	})
</script>
</body>
</html>