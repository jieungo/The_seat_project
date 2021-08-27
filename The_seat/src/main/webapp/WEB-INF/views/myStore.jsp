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
<style>
	.image{
		width: 200px;
		height: 200px;
	}
</style>
<body>
<div class="container">

	<a href="${pageContext.request.contextPath}/store/manageMenu.do">매장 관리 페이지</a>
	<p>매장 관리 페이지</p>
	DB 번호 : <p>${dto.num }</p>
	매장 관리자 : <p>${dto.owner }</p>
	<br>
	<!-- 매장 정보 관리 영역 -->
	<div>
		<form id="updateForm" action="${pageContext.request.contextPath}/storeUpdate.do" method="post">
			<a href="javascript:" id="updateBtn" style="display:block">매장 정보 수정</a>
			<p id="updateBox" style="display:none">
				<a href="javascript:" id="update">수정 완료</a>
				<a href="javascript:" id="updateCancel">취소</a>
			</p>
			<input type="hidden" name="num" value="${dto.num }"/>
			<p>매장 이름 : <strong class="storeData">${dto.storeName } </strong>
				<input type="text" name="storeName" class="updateData" value="${dto.storeName }" style="display:none;"/></p>
			<p>매장 주소 : <strong class="storeData">${dto.storeAddr } </strong>
				<input type="text" name="storeAddr" class="updateData" value="${dto.storeAddr }" style="display:none;"/></p>
			<p>영업 시간 : <strong class="storeData">${dto.openingTime } </strong>
				<input type="text" name="openingTime" class="updateData" value="${dto.openingTime }" style="display:none;"/></p>
		</form>
	</div>
	
	<!-- 매장 태그 관리 영역 -->
	<div>
		매장 태그 : 
		<p id="btns">
			<c:forEach var="tmp" items="${list }">
				<button data-num="${dto.num }" name="tag" class="btn btn-primary tag">${tmp}</button>
			</c:forEach>
		</p>
		<input id="inputTag" type="text" style="display:none"/>
		<a data-num="${dto.num }" href="javascript:" class="plus addTag">태그 추가</a>
		<br>
	</div>
	<br>
	
	<!-- 매장 로고 관리 영역 -->
	<div>
		<a class="updateImgLink" href="javascript:">
			<img src="${pageContext.request.contextPath}${dto.image_logo}" alt="" id="image_logo" name="logo" class="image"/>
		</a>
		<form action="${pageContext.request.contextPath}/uploadImage.do" id="logoForm" method="post" enctype="multipart/form-data">
			<label for="image_logo">매장 로고</label>
			<input type="hidden" name="num" value="${dto.num }"/>
			<input type="hidden" name="image_logo" value="check"/>
			<input type="file" id="logoImage" name="imageFile" style="display:none"/>
			<button class="updateImgBtn" type="submit" style="display:none">로고 등록</button>
		</form>
	</div>
	매장 로고 : <p>${dto.image_logo }</p>
	
	<!-- 매장 대표 이미지 관리 영역1-->
	<div>
		<a class="updateImgLink" href="javascript:">
			<img src="${pageContext.request.contextPath}${dto.image_1}" alt="" id="image_1" name="image1" class="image"/>
		</a>
		<form action="${pageContext.request.contextPath}/uploadImage.do" id="imageForm1" method="post" enctype="multipart/form-data">
			<label for="image_1">대표 이미지1</label>
			<input type="hidden" name="num" value="${dto.num }"/>
			<input type="hidden" name="image_1" value="check"/>
			<input type="file" id="repImage1" name="imageFile" style="display:none"/>
			<button class="updateImgBtn" type="submit" style="display:none">로고 등록</button>
		</form>
	</div>
	이미지 1 : <p>${dto.image_1 }</p>
	<!-- 매장 대표 이미지 관리 영역2-->
	<div>
		<a class="updateImgLink" href="javascript:">
			<img src="${pageContext.request.contextPath}${dto.image_2}" alt="" id="image_2" name="image2" class="image"/>
		</a>
		<form action="${pageContext.request.contextPath}/uploadImage.do" id="imageForm2" method="post" enctype="multipart/form-data">
			<label for="image_2">대표 이미지2</label>
			<input type="hidden" name="num" value="${dto.num }"/>
			<input type="hidden" name="image_2" value="check"/>
			<input type="file" id="repImage2" name="imageFile" style="display:none"/>
			<button class="updateImgBtn" type="submit" style="display:none">로고 등록</button>
		</form>
	</div>
	이미지 2 : <p>${dto.image_2 }</p>
	<!-- 매장 대표 이미지 관리 영역3-->
	<div>
		<a class="updateImgLink" href="javascript:">
			<img src="${pageContext.request.contextPath}${dto.image_3}" alt="" id="image_3" name="image3" class="image"/>
		</a>
		<form action="${pageContext.request.contextPath}/uploadImage.do" id="imageForm3" method="post" enctype="multipart/form-data">
			<label for="image_3">대표 이미지3</label>
			<input type="hidden" name="num" value="${dto.num }"/>
			<input type="hidden" name="image_3" value="check"/>
			<input type="file" id="repImage3" name="imageFile" style="display:none"/>
			<button class="updateImgBtn" type="submit" style="display:none">로고 등록</button>
		</form>
	</div>
	이미지 3 : <p>${dto.image_3 }</p>
	<!-- 매장 대표 이미지 관리 영역4-->
	<div>
		<a class="updateImgLink" href="javascript:">
			<img src="${pageContext.request.contextPath}${dto.image_4}" alt="" id="image_4" name="image4" class="image"/>
		</a>
		<form action="${pageContext.request.contextPath}/uploadImage.do" id="imageForm4" method="post" enctype="multipart/form-data">
			<label for="image_4">대표 이미지4</label>
			<input type="hidden" name="num" value="${dto.num }"/>
			<input type="hidden" name="image_4" value="check"/>
			<input type="file" id="repImage4" name="imageFile" style="display:none"/>
			<button class="updateImgBtn" type="submit" style="display:none">로고 등록</button>
		</form>
	</div>
	이미지 4 : <p>${dto.image_4 }</p>
	<div>
		오픈 여부 : <p id="storeOnOff">${dto.storeOpen }</p>
		<button id="storeOnOffBtn">매장 열기</button>
	</div>
	매장 등록일 : <p>${dto.regdate }</p>
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	// 태그 안에 x 버튼 넣어서 로딩하기
	// 페이지 로딩되는 시점에 작동할 함수
	window.onload=function(){
		// 태그에 해당하는 버튼들의 array
		let btns=document.querySelectorAll(".tag");
		for(let i=0; i<btns.length; i++){
			// 버튼의 data-num 성분의 값을 가져옴
			let dataNum=btns[i].getAttribute("data-num");
			//새로운 버튼을 만듦(취소 버튼)
			let deleteBtn=document.createElement("button");
			// 새로운 버튼에 class와 data-num 정보를 지정
			deleteBtn.setAttribute("class", "btn-close del-tag");
			deleteBtn.setAttribute("data-num", dataNum);
			// 각 버튼에 자식 요소로 넣어줌
			btns[i].appendChild(deleteBtn);
		}
		// 새로 만들어진 취소 버튼에 삭제 이벤트를 부여
		deleteTag(".del-tag", ".tag");
	};

	// 태그를 추가하는 method
	document.querySelector(".plus").addEventListener("click", function(e){
		e.preventDefault();
		// 태그를 추가하는 input 요소를 보이게 함
		document.querySelector("#inputTag").style.display="block";
		// 태그 추가 링크의 class를 변경
		this.setAttribute("class", "addTag");
		// 태그 추가 링크의 내용을 변경
		this.innerText="태그 추가";
		// 해당 class에 해당하는 링크에 태그 추가 이벤트 부여
		addTagEvent(".addTag");
	});
	
	// 태그를 추가하는 함수
	function addTagEvent(rel){
		document.querySelector(rel).addEventListener("click", test, {once:true});
	}
	
	// 태그를 추가하는 함수에 들어갈 함수
	function test(e){
		e.preventDefault();
		// 태그를 추가할 버튼의 data-num 성분을 읽어옴
		let num=this.getAttribute("data-num");
		// 추가하고 싶은 태그를 작성한 input 요소의 값을 읽어옴
		let storeTag=document.querySelector("#inputTag").value;
		if(storeTag==""){
			alert("태그를 작성해주세요.");
		} else {
			// 두 정보를 object로 만들어서 전달할 준비
			let obj={num, storeTag};
			console.log(obj);
			
			// 해당 링크를 요청하면서 object를 전달하고
			ajaxPromise("${pageContext.request.contextPath}/addTag.do", "post", obj)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				// 데이터를 받으면
				if(data.beAdded){
					// 태그 추가 input 창을 reset하고, 화면에서 숨김
					document.querySelector("#inputTag").value="";
					document.querySelector("#inputTag").style.display="none";
					// 해당 매장의 DB 번호를 받아서
					let dataNum=${dto.num};
					// 새로운 태그 버튼을 만들고 성분과 값을 부여함
					let newBtn=document.createElement("button");
					newBtn.innerText=storeTag;
					newBtn.setAttribute("class", "btn btn-primary add-tag");
					newBtn.setAttribute("data-num", dataNum);
					// 붙어서 생기는 것을 방지하기 위해 야매
					newBtn.style.marginRight="5px";
					// 새로운 취소 버튼을 만들고 성분과 값을 부여함
					let newDeleteBtn=document.createElement("button");
					newDeleteBtn.setAttribute("class", "btn-close add-del-tag");
					newDeleteBtn.setAttribute("data-num", dataNum);
					// 새 버튼의 자식 요소로 취소 버튼을 넣고, 태그 버튼 또한 태그 공간의 자식 요소로 넣어줌
					newBtn.appendChild(newDeleteBtn);
					document.querySelector("#btns").appendChild(newBtn);
					document.querySelector(".addTag").setAttribute("class", "plus addTag");
					// 새롭게 만든 삭제 버튼에 태그 삭제 이벤트 부여
					deleteTag(".add-del-tag", ".add-tag");
					// 다시 버튼의 class를 원래대로 돌려놓음
					newBtn.setAttribute("class", "btn btn-primary tag");
					newDeleteBtn.setAttribute("class", "btn-close del-tag");
				}
			});
		}
	}
	
	// 태그 삭제
	//deleteTag(".del-tag", ".tag");
	
	// 태그를 삭제하는 함수 (추가된 삭제 버튼, 추가된 태그 버튼)
	function deleteTag(addDeleteTag, addTag){
		// 추가된 삭제 버튼, 태그버튼들
		let deleteBtns=document.querySelectorAll(addDeleteTag);
		let tags=document.querySelectorAll(addTag);
		// 버튼의 개수만큼 반복
		for(let i=0; i<deleteBtns.length; i++){
			// 버튼의 data-num 성분의 값과 태그 값을 얻어서 object로 담음
			let num=deleteBtns[i].getAttribute("data-num");
			let storeTag=tags[i].innerText;
			console.log(storeTag);
			let obj={num, storeTag};
			// 삭제 버튼을 눌렀을 때 작동할 이벤트
			deleteBtns[i].addEventListener("click", function(){
				// 삭제여부를 확인
				console.log(obj);
				let toDelete=confirm("이 태그를 삭제하시겠습니까?");
				if(toDelete){
					// 해당 경로를 요청하면서 object 전달
					ajaxPromise("${pageContext.request.contextPath}/deleteTag.do", "post", obj)
					.then(function(response){
						return response.json();
					}).then(function(data){
						console.log(data);
						if(data.beDeleted){
							// 해당 태그 버튼과 삭제버튼을 지움.
							tags[i].remove();
							deleteBtns[i].remove();
						}
					});	
				}
			});
		}
	}
	
	// 매장 정보 수정
	// 수정완료, 취소 링크 영역
	let updateBox=document.querySelector("#updateBox");
	// 뿌려주는 정보(매장 이름, 주소, 영업시간)
	let storeDatas=document.querySelectorAll(".storeData");
	// 수정 form input들
	let updateInputs=document.querySelectorAll(".updateData");
	
	// 수정 form 매장정보수정 -> 수정완료, 취소 변환 method
	document.querySelector("#updateBtn").addEventListener("click", function(){
		// 정보 수정 링크를 숨김
		this.style.display="none";
		// 수정완료, 취소 링크를 보이게 함
		updateBox.style.display="block";
		// input들을 보이게 함
		for(let i=0; i<updateInputs.length; i++){
			updateInputs[i].style.display="block";
		}
	});
	
	let updateBtn=document.querySelector("#updateBtn");
	// 수정 form 수정완료, 취소 변환 -> 매장정보수정 method
	document.querySelector("#updateCancel").addEventListener("click", function(){
		// 수정완료, 취소 링크를 숨김
		updateBox.style.display="none";
		// 매장정보수정 링크를 보이게 함
		updateBtn.style.display="block";
		// input들을 숨김
		for(let i=0; i<updateInputs.length; i++){
			updateInputs[i].style.display="none";
		}
	});
	
	// 수정 완료 버튼 눌렀을 때 동작하는 method
	document.querySelector("#update").addEventListener("click", function(){
		// 수정 폼의 참조값을 얻어옴
		let updateForm=document.querySelector("#updateForm");
		ajaxFormPromise(updateForm)
		.then(function(response){
			return response.json();
		}).then(function(data){
			console.log(data);
			if(data.beUpdated){
				// 알람창을 띄우고
				alert("매장 정보를 수정했습니다.");
				// 수정완료, 취소 링크를 숨김
				updateBox.style.display="none";
				// 매장 정보 수정 링크를 보이게 함
				updateBtn.style.display="block";
				// input 창의 값을 수정값으로 바꾸고 input창을 숨김
				for(let i=0; i<updateInputs.length; i++){
					storeDatas[i].innerText=updateInputs[i].value;
					updateInputs[i].style.display="none";
				}
			}
		});
	});
	/*
	document.querySelector("#logoImage").addEventListener("change", function(e){
		readImage(e.target);
	});
	
	document.querySelector("#logoForm").addEventListener("submit", function(e){
		// 일단 form 제출을 막음
		e.preventDefault();
		console.log(this);
		ajaxFormPromise(this)
		.then(function(response){
			return response.json();
		}).then(function(data){
			console.log(data);
		});
	});
	*/
	
	// 이미지를 눌렀을 때 동작하는 영역
	let imgLinks=document.querySelectorAll(".updateImgLink");
	let updateImgBtns=document.querySelectorAll(".updateImgBtn");
	
	let imageInputs=["#logoImage", "#repImage1", "#repImage2", "#repImage3", "#repImage4"];
	let imageForms=["#logoForm", "#imageForm1", "#imageForm2", "#imageForm3", "#imageForm4"];
	let imageList=["#image_logo", "#image_1", "#image_2", "#image_3", "#image_4"];
	
	for(let i=0; i<imageList.length; i++){
		imgLinks[i].addEventListener("click", function(e){
			e.preventDefault();
			
			document.querySelector(imageInputs[i]).click();
			updateImgBtns[i].style.display="block";
		});
		viewThumbNail(imageInputs[i], imageList[i]);
		updateImage(imageForms[i], i);
	}
	
	// 이미지 파일을 선택했을 때 동작하는 method
	function viewThumbNail(rel, imageID){
		document.querySelector(rel).addEventListener("change", function(e){
			console.log("rel1: "+rel);
			readImage(e.target, imageID);
		});
	}
	
	function readImage(input, imageID) {
		console.log("rel2: "+imageID);
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        let reader=new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload=function(e){
	            let previewImg=document.querySelector(imageID);
	            previewImg.src=e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	// 매장 로고 등록 시 동작하는 method
	function updateImage(rel, i){
		document.querySelector(rel).addEventListener("submit", function(e){
			// 일단 form 제출을 막음
			e.preventDefault();
			console.log("rel3: "+i);
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beUpdated){
					updateImgBtns[i].style.display="none";
					alert("이미지를 수정하였습니다.");
				}
			});
		});
	}
	
	// 매장 열기 or 닫기 작업
	document.querySelector("#storeOnOffBtn").addEventListener("click", function(e){
		e.preventDefault();
		
		ajaxPromise("${pageContext.request.contextPath}/storeOnOff.do", "post", "num="+${dto.num})
		.then(function(response){
			return response.json();
		}).then(function(data){
			console.log(data);
		});
	});
</script>
</html>