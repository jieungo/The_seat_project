<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
	<div class="container">
		<a data-num="0" id="addBtn0" href="#">+매장 추가</a>
	</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	let dataNum=0;
	let storePath="${pageContext.request.contextPath}/store.do?num=";
	
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
			document.querySelector(".container").prepend(newAnchor);
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