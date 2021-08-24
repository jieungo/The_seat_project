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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-light bg-light" aria-label="Third navbar example">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">자리..<br>있어요?</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarsExample03"
				aria-controls="navbarsExample03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarsExample03">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link" aria-current="page" href="#"></a></li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown03"
						data-bs-toggle="dropdown" aria-expanded="false">지역</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown03">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown03"
						data-bs-toggle="dropdown" aria-expanded="false">메뉴</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown03">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
						</ul>
					</li>
				</ul>
				<form>
					<input class="form-control" type="text" placeholder="오늘은 뭐 먹을까?"
						aria-label="Search">
				</form>
			</div>
		</div>
	</nav>
	<div class="container">

		<c:if test="${ not empty dto.keyword }">
			<p>	
				<strong>${dto.area }</strong> 지역,
				<strong>${dto.group }</strong> 메뉴,
				<strong>${dto.keyword }</strong> 검색어로 검색된 내용 자세히 보기 
			</p>
		</c:if>
	</div>
	<div class="container toggle">
		<c:choose>
			<c:when test="${list.size() != 0}">
				<c:forEach var="tmp" items="${list }" varStatus="status">
					<a href="${pageContext.request.contextPath}/myStore.do?num=${status.count }" class="store">${tmp.storeName }</a>
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
	src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>

<script>

	let dataNum=0;
	let storePath="${pageContext.request.contextPath}/myStore.do?num=";
	
	document.querySelector("#addBtn0").addEventListener("click", function(e){
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

			newAnchor.setAttribute("id", "addBtn"+strDataNum);
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