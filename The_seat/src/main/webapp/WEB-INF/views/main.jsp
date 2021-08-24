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
</head>
<body>
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
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>

<script>
	let dataNum=0;
	let storePath="${pageContext.request.contextPath}/myStore.do?num=";
	
	document.querySelector("#addBtn0").addEventListener("click", function(e){
		// 일단 링크 이동을 막고
		e.preventDefault();
		// 매장 추가 여부를 확인하고
		let callAdd=confirm("매장을 추가하시겠습니까?");
		// 확인을 눌렀다면
		if(callAdd){
			dataNum++;
			let strDataNum=dataNum.toString();
			
			// ajax 응답으로 새 매장 정보를 DB에 추가
			/*
			ajaxPromise("${pageContext.request.contextPath}/newStore.do")
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
			});
			*/
			
			let newAnchor=document.createElement("a");
			newAnchor.innerText="매장 관리";
			newAnchor.setAttribute("data-num", dataNum);
			newAnchor.setAttribute("class", "store");
			newAnchor.setAttribute("id", "addBtn"+strDataNum);
			document.querySelector(".toggle").prepend(newAnchor);
			resetDataNum();
		}
	});

	// 전체의 data-num을 조정하는 function
	function resetDataNum(){
		let array=document.querySelectorAll("a[class='store']");
		for(let i=0; i<array.length; i++){
			array[i].setAttribute("data-num", i);
			array[i].setAttribute("href", storePath+i);
		}
	}
</script>
</html>