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
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<style>

body {
    background-color: #598eff;
    height: 100vh;
    width: 100vw;
    display: flex;
    align-items: center;
    justify-content: center;
    color: rgb(78, 78, 78);
}

/* 버튼 기본 스타일링 */
button {
    outline: none;
    border: none;
    background-color: transparent;
    color: rgb(78, 78, 78);
}

/* 링크 기본 스타일링 */
a {
    text-decoration: none;
    color: rgb(78, 78, 78);
}

/* 리스트 기본 스타일링 */
ul {
    padding: 0 5px;
    margin: 0;
    list-style: none;
}

.circle-btn {
    background-color: #598eff;
    color: white;
    width: 40px;
    height: 40px;
    border-radius: 100%;
    box-shadow: 4px 6px 11px rgba(172, 172, 172, 0.699);
    margin-bottom: 10px;
}

.menu__article {
    display: flex;
    justify-content: center;
    background-color: white;
    border-radius: 10px  0 0 10px;
    height: 80%;
    width: 50%;
    position: relative;
}

.menu__list {
    margin-top: 60px;

}

.menu__category {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.menu__category  a {
    margin-left: 15px;
}

.menu__category  a:focus, a:hover {
    padding-bottom: 5px;
    border-bottom: 3px solid #598eff;
    color: rgb(78, 78, 78);
}

.menu__add {
    display: flex; 
    flex-direction: column; 
    align-items: center; 
    justify-content: center;
}

img {
    width: 150px; 
    height: 150px;
}

.starIcon {
    color: rgb(253, 197, 14);
}

.card {
    border: none;
    box-shadow: 4px 6px 11px rgba(172, 172, 172, 0.699);
}

.store__aside {
    display: flex;
    flex-direction: column;
    align-items: stretch;
    justify-content: space-evenly;
    height: 100%;
    float: right;
    position: absolute;
    left: 100%;
}

.store__aside > button {
    border: 1px solid gray;
    background-color: white;
    border-radius: 0 5px 5px 0;
    border: 1px solid lightgray;
    width: 15vw;
    height: 20vh;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 20px;
    font-weight: 700;
    transition: color 0.2s ease-in-out;
}

.store__aside button:focus {
    color: #598eff;
    border-left: none;
}

</style>
</head>
<body>
<!-- navbar 추가-->

<!----------------- 메인 페이지 (카테고리 및 메뉴카드) -------------------->

<div class="container menu__article">
    <article class="menu__list">
    <section style="position: sticky; height: 60px;">
        <div class="menu__category">
        <ul>
            <li>
                <a href="#">전체</a>
            </li>
            
        </ul>
        <button style="color:rgb(253, 197, 14); font-weight: 500;">카테고리 추가</button>
        
    </div>
    </section>
        <div class="card mb-5" style="max-width: 500px; height: 220px; margin-top: 20px;">
            <div class="menu__add card-body">
                <button type="button" class="circle-btn" data-bs-toggle="modal" data-bs-target="#modal-menuAddForm">
                    <div style="font-size: 20px; font-weight: 500;">+</div>
                </button>
                <span style="color: rgb(173, 173, 173); font-size: 14px;">새로운 메뉴 추가하기</span>
            </div>
        </div>
        <c:forEach var="tmp" items="${menuList }">
        	<div class="card" style="max-width: 500px;">
            	<div class="row g-0">
	                <button class="mt-3 pe-2 starBtn" style="display: flex; justify-content:flex-end;">
	                    <i class="starIcon far fa-star"></i>
	                </button>
                	<div class="col-md-4 ms-4">
	                    <img src="${pageContext.request.contextPath}${tmp.menuImage}" class="rounded" alt="menu_image">
	                </div>
	                <div class="col-md-6">
	                    <div class="card-body p-2" style="width: 200px;">
	                        <h6 class="card-text">${tmp.menuName } <!-- <p class="card-text">존맛탱 케이크</p> --> </h6>
	                        <h6 class="card-text">${tmp.price }  <!-- <p class="card-text">10,000원</p> --> </h6>
	                        <h6 class="card-text">${tmp.content } <!-- <p class="card-text">생크림, 시나몬, 밀가루</p> --> </h6>
	                    </div>
	                </div>
	                <div class="menu__card-edit mb-2 pe-2" style="display: flex; justify-content: flex-end;">
	                    <button>수정</button>
	                    <button data-num="${tmp.num }" class="deleteBtn">삭제</button>
	                </div>
	            </div>
	        </div>
        </c:forEach>
    </article>
<!------------------ 옆 사이드바 (매장정보, 메뉴관리 탭) ----------------->
    <aside class="store__aside">
        <button>매장 정보</button>
        <button>메뉴 관리</button>
        <button>리뷰 관리</button>
        <button>주문 확인</button>
        <button>자리 관리</button>
    </aside>

<!-------------------- 메뉴 등록 모달창 ------------------------------>
    
    <div class="modal" tabindex="-1" id="modal-menuAddForm" aria-labelledby="menuAddForm" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><strong>메뉴 등록</strong> </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="menuAddForm" action="${pageContext.request.contextPath}/store/addMenu.do" method="post" enctype="multipart/form-data">                 
                    <img id="thumbImg" src="" alt="" />
                    
                    <input type="hidden" name="num" value="${storeDBNum }" />
                    <input class="form-control" type="file" name="imageFile" id="image">
                    <input class="form-control" type="text" name="menuName" id="menuname" placeholder="상품명" required="required">
                    <input class="form-control" type="text" name="price" id="menuprice" placeholder="상품가격">
                    <input class="form-control" type="text" name="content" id="menucontaine" placeholder="상품구성" required="required">
                    <span class="dropdown">카테고리 추가</span>
                    <!--
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    	카테고리 목록
                    </button>
                    
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" > 
                        <li><a class="dropdown-item" href="#">없음</a></li>
                        <li><a class="dropdown-item" href="#">1</a></li>
                        <li><a class="dropdown-item" href="#">2</a></li>
                    </ul><br>
                    -->
                    <button id="addBtn" type="submit">완료</button>
                </form>
            </div>
        </div>
    </div>
    </div> 
</div>


<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>

	
	// 이미지를 고르면 썸네일에 등장하도록 하는 영역
	viewThumbNail("#image");
	
	// 이미지 파일을 선택했을 때 동작하는 method
	function viewThumbNail(rel){
		document.querySelector(rel).addEventListener("change", function(e){
			readImage(e.target);
		});
	}
	
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        let reader=new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload=function(e){
	            let previewImg=document.querySelector("#thumbImg");
	            previewImg.src=e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	// 모달에서 메뉴 등록 버튼을 눌렀을 때 동작하는 곳
	document.querySelector("#menuAddForm").addEventListener("submit", function(e){
		e.preventDefault();
		
		let wantAdd=confirm("메뉴를 추가하시겠습니까?");
		
		if(wantAdd){
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			}).then(function(data){
				console.log(data);
				if(data.beAdded){
					alert("메뉴가 추가되었습니다.");
					location.href="${pageContext.request.contextPath}/store/manageMenu.do?num=${storeData.num}&storeName=${storeData.storeName}";
				}
			});	
		}
		
	});
	
	// 등록한 메뉴를 삭제하는 method
	let deleteBtns=document.querySelectorAll(".deleteBtn");
	for(let i=0; i<deleteBtns.length; i++){
		deleteBtns[i].addEventListener("click", function(e){
			e.preventDefault();
			
			let menuNum=this.getAttribute("data-num");
			let wantDel=confirm("이 메뉴를 삭제하시겠습니까?");
			if(wantDel){
				ajaxPromise("${pageContext.request.contextPath}/store/deleteMenu.do", "post", "num="+menuNum)
				.then(function(response){
					return response.json();
				}).then(function(data){
					console.log(data);
					if(data.beDeleted){
						location.href="${pageContext.request.contextPath}/store/manageMenu.do?num=${storeData.num}&storeName=${storeData.storeName}";
					}
				});	
			}
		});	
	}
	
	// 
	
</script>

</body>
</html>