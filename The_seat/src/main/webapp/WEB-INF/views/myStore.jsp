<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap 외부 링크 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" 
   integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
	<p>매장 관리 페이지</p>
	DB 번호 : <p>${dto.num }</p>
	매장 관리자 : <p>${dto.owner }</p>
	<br>
	<a href="">매장 정보 편집</a>
	<br>
	<div>
		<p>매장 이름 : <strong>${dto.storeName }</strong></p>
		<p>매장 주소 : <strong>${dto.storeAddr }</strong></p>
		<p>영업 시간 : <strong>${dto.openingTime }</strong></p>
	</div>
	<div>
		매장 태그 : 
		<p id="btns">
		<c:forEach var="tmp" items="${list }">
			<button data-num="${dto.num }" name="tag" class="btn btn-primary tag">
				${tmp }
				<button data-num="${dto.num }" type="button" class="btn-close del-tag"/>
			</button>
		</c:forEach>
		</p>
		<input id="inputTag" type="text" style="display:none"/>
		<a data-num="${dto.num }" href="" class="plus addTag">태그 추가</a>
		<br>
	</div>
	<br>
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
	// 태그를 추가하는 method
	document.querySelector(".plus").addEventListener("click", function(e){
		e.preventDefault();
		
		document.querySelector("#inputTag").style.display="block";
		this.setAttribute("class", "addTag");
		this.innerText="태그 추가";
		addTagEvent(".addTag");
	});
	
	function addTagEvent(rel){
		document.querySelector(rel).addEventListener("click", test, {once:true});
	}
	
	function test(e){
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
				document.querySelector("#inputTag").value="";
				document.querySelector("#inputTag").style.display="none";
				
				let dataNum=${dto.num};
				
				let newBtn=document.createElement("button");
				newBtn.innerText=storeTag;
				newBtn.setAttribute("class", "btn btn-primary add-tag");
				newBtn.setAttribute("data-num", dataNum);
				let newDeleteBtn=document.createElement("button");
				newDeleteBtn.setAttribute("class", "btn-close add-del-tag");
				newDeleteBtn.setAttribute("data-num", dataNum);
				newBtn.appendChild(newDeleteBtn);
				document.querySelector("#btns").appendChild(newBtn);
				document.querySelector(".addTag").setAttribute("class", "plus addTag");
				
				deleteTag(".add-del-tag", ".add-tag");
			}
		});
	}
	
	// 태그 삭제
	deleteTag(".del-tag", ".tag");
	
	function deleteTag(addDeleteTag, addTag){
		// 태그를 삭제하는 method
		let deleteBtns=document.querySelectorAll(addDeleteTag);
		let tags=document.querySelectorAll(addTag);
		for(let i=0; i<deleteBtns.length; i++){
			let num=deleteBtns[i].getAttribute("data-num");
			let storeTag=tags[i].innerText;
			let obj={num, storeTag};
			deleteBtns[i].addEventListener("click", function(){
				let toDelete=confirm("이 태그를 삭제하시겠습니까?");
				if(toDelete){
					ajaxPromise("${pageContext.request.contextPath}/deleteTag.do", "post", obj)
					.then(function(response){
						return response.json();
					}).then(function(data){
						console.log(data);
						if(data.beDeleted){
							tags[i].remove();
							deleteBtns[i].remove();
						}
					});	
				}
			});
		}
	}
</script>
</html>