<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>매장 관리 페이지</p>
	DB 번호 : <p>${dto.num }</p>
	매장 관리자 : <p>${dto.owner }</p>
	매장 이름 : <p>${dto.storeName }</p>
	매장 주소 : <p>${dto.storeAddr }</p>
	<div>
		매장 태그 : 
		<p id="btns">
		<c:forEach var="tmp" items="${list }">
			<button>${tmp }</button>
		</c:forEach>
		</p>
		<input id="inputTag" type="text" style="display:none"/>
		<a data-num="${dto.num }" href="" id="plus">태그 추가</a>
		<br>
	</div>
	<br>
	영업 시간 : <p>${dto.openingTime }</p>
	매장 로고 : <p>${dto.image_logo }</p>
	이미지 1 : <p>${dto.image_1 }</p>
	이미지 2 : <p>${dto.image_2 }</p>
	이미지 3 : <p>${dto.image_3 }</p>
	이미지 4 : <p>${dto.image_4 }</p>
	오픈 여부 : <p>${dto.storeOpen }</p>
	매장 등록일 : <p>${dto.regdate }</p>
	
</body>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	document.querySelector("#plus").addEventListener("click", function(e){
		e.preventDefault();
				
		this.setAttribute("id", "addTag");
		document.querySelector("#inputTag").style.display="block";
		this.innerText="태그 추가";
		addTagEvent("#addTag");
	});

	function addTagEvent(rel){
		document.querySelector(rel).addEventListener("click", function(e){
			e.preventDefault();
			 
			let num=this.getAttribute("data-num");
			let storeTag=document.querySelector("#inputTag").value;
			let obj={num, storeTag};
			console.log(obj);
			
			ajaxPromise("${pageContext.request.contextPath}/addTag.do", "post", obj)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beAdded){
					document.querySelector("#inputTag").style.display="none";
					let newBtn=document.createElement("button");
					newBtn.innerText=storeTag;
					document.querySelector("#btns").appendChild(newBtn);
					document.querySelector("#addTag").setAttribute("id", "plus");
				}
			});
		});
	}
	
	function task1(e){
		e.preventDefault();
		
		document.querySelector("#plus").setAttribute("id", "addTag");
		document.querySelector("#inputTag").style.display="block";
		document.querySelector("#plus").innerText="태그 추가";
		addTagEvent("#addTag");
	}
	
	function task2(e){
		e.preventDefault();
		 
		let num=this.getAttribute("data-num");
		let storeTag=document.querySelector("#inputTag").value;
		let obj={num, storeTag};
		console.log(obj);
		
		ajaxPromise("${pageContext.request.contextPath}/addTag.do", "post", obj)
		.then(function(response){
			return response.json();
		}).then(function(data){
			console.log(data);
			if(data.beAdded){
				document.querySelector("#inputTag").style.display="none";
				let newBtn=document.createElement("button");
				newBtn.innerText=storeTag;
				document.querySelector("#btns").appendChild(newBtn);
				document.querySelector("#addTag").setAttribute("id", "plus");
				document.querySelector("#plus").removeEventListener("click", task1);
			}
		});
	}
	

</script>
</html>