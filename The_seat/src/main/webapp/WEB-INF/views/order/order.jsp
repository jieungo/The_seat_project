<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<c:forEach var="tmp" items="${menuList }" >
					<c:if test="${tmp.best == 'yes' }">
						<div style="width:300px; overflow:hidden;">
							<img src="${pageContext.request.contextPath}${tmp.menuImage }" style="width:100%; object-fit:cover;"/>
						</div>
					</c:if>
				</c:forEach>
			<h3>전체 메뉴</h3>
				<div>
					<form class="orderMenu" action="${pageContext.request.contextPath}/order/insert.do">
						<input type="text" name="orderNum" value="${orderNum }"/>
						<input type="text" name="storeName" value="${dto.storeName }"/>
						<input type="text" name="storeLogo" value="${dto.image_logo }"/>
						<input type="text" name="menu" value="보리굴비"/>
						<input type="text" name="price" value="15000"/>
						<input type="text" name="num" value="${dto.num }"/>
						<button type="submit">보리굴비</button>
					</form>
					<ul>
						<li></li>
					</ul>
				</div>
		</section>
		<section>
			<h2>주문 목록</h2>
			<div id="orderList">
				
			</div>
			<div>
				<p>총 결제 금액: <span></span></p>
			</div>
			<div>
				<button>주문하기</button>
			</div>
		</section>
	</div>
</div>
<script>
	let orderList = [];
	let allMenu = document.querySelectorAll(".orderMenu");
	for(let i=0; i<allMenu.length; i++){
		allMenu[i].addEventListener("submit",function(e){
			e.preventDefault();
			let orderNum = this.orderNum.value;
			let storeName = this.storeName.value;
			let storeLogo = this.storeLogo.value;
			let num = this.num.value;
			let menu = this.menu.value;
			let price = this.price.value;
			console.log("orderNum: "+orderNum+"/ storeName: "+storeName+"/ storeLogo: "+storeLogo+"/ num: "+num+"/ menu: "+menu+"/ price: "+price);
			let orderMenu = {orderNum:orderNum,storeName:storeName,storeLogo:storeLogo,num:num,menu:menu,price:price};
			console.log(orderMenu);
			orderList.append(orderMenu);
			console.log(orderList);
		})
	}
</script>
</body>
</html>