<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/storeSeat.css?ver=1"
	type="text/css" />
</head>

<body>
    
    <!------------------------------- navbar -------------------------------->
<jsp:include page="../nav/navbar2.jsp" />

<div class="myStore_container" style="display: flex; flex-direction: row; justify-content: space-between">
	<div style="display: flex; flex-direction: column; padding: 20px 30px; width: 650px;">
        
    <!-------------------------------- 타이틀 ---------------------------------->
        <header class="store__order-header">
            <h4>좌석 구성</h4>
        </header>
        
     <!------------------------ 주문내역 텍스트 및 박스 -------------------------------->
        <div id="inner" class="inner_container" style="display: flex;"> 
            <div class="display-box">
                <section class="seat">
                        <span class="seat-title" style="font-size: 13px;">
                            ${dto.seatContent }
                        </span>
                        <div class="seat__box">
                        	<a id="seatLink" href="javascript:" >
	                        	<c:choose>
									<c:when test="${dto.seatImage eq null}">
										<h1>매장 자리 이미지를 등록해 주세요!</h1>
									</c:when>
									<c:otherwise>
										<img id="seatImage" style="width:100%; height:100%; object-fit: cover;" src="${pageContext.request.contextPath}${dto.seatImage}" />
									</c:otherwise>
								</c:choose>
							</a>
                        </div>
                        <div class="seat__select">
                        	<input type="number" id="totalSeat" min="1" max="30" value="1">
                            
                        </div>
                </section>
        <!------------------------------ 예약정보 박스 --------------------------------------->
                <section class="select">
                    <div class="select-title">
                        <p><strong>자리번호</strong></p>
                        <p><strong>자리상태</strong></p>
                    </div>
                    <div class="line"></div>
                    <div class="seat-NumState">
                        <div>
                            <p>1번 자리</p>
                            <select class="useState">
                                <option value="canUse">이용가능</option>
                                <option value="nowUse">이용중</option>
                                <option value="cantUse">이용불가</option>
                            </select>
                        </div>
                    </div>
                </section>
            </div>
            <form id="updateForm" action="${pageContext.request.contextPath}/store/updateSeat.do">
            	<input type="hidden" name="num" 
								value="${dto.num } }"/>
				<input type="hidden" name="totalSeat" 
								value="${dto.totalSeat } }"/>			
            	<input type="hidden" name="seatImage" 
								value="${dto.seatImage}"/>
				<input type="hidden" name="emptySeat" 
								value="${dto.emptySeat } }"/>
				<input type="hidden" name="notEmptySeat" 
								value="${dto.notEmptySeat } }"/>
				<input type="hidden" name="notUse" 
								value="${dto.notUse } }"/>
            	<button type="submit" class="submit-btn">배치 변경</button>
            </form>
            
        </div>
    </div>

        <!------------------------------------ 옆 사이드바 (매장정보, 메뉴관리 탭) ----------------->
    <aside class="aside">
         <button onclick="location.href='#'">매장 정보</button>
         <button onclick="location.href='${pageContext.request.contextPath}/store/manageMenu.do?num=${dto.num}'">메뉴 관리</button>
         <button onclick="location.href='${pageContext.request.contextPath}/store/storeReview.do'">리뷰 관리</button>
         <button onclick="location.href='${pageContext.request.contextPath}/store/storeOrder.do'">주문 확인</button>
         <button onclick="location.href='${pageContext.request.contextPath}/store/storeSeat.do'">자리 관리</button>
     </aside>
</div>

<!-- seat 이미지 넣는용 지우지마용 -->
<form action="${pageContext.request.contextPath}/store/ajax_seat_upload.do" method="post" 
	  id="imageForm" enctype="multipart/form-data" style="visibility:hidden;'">
	<input type="file" name="image" id="image" 
		accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
</form>
<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//자리 이미지 링크를 클릭하면 
	document.querySelector("#seatLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//자리 이미지를 새롭게 넣으면
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// 클릭하는 자리에 이미지 넣어주기
			let img=`<img id="seatImage" style="width:100%; height:100%; object-fit: cover;" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			
			document.querySelector("#seatLink").innerHTML=img;
			// input name="seatImage" 요소의 value 값으로 이미지 경로 넣어주기
			document.querySelector("#updateForm").seatImage.value=data.imagePath;
		});
	});
	
	document.querySelector("#totalSeat").addEventListener("input",function(){
		document.querySelector("#updateForm").totalSeat.value=this.value;
		console.log(document.querySelector("#updateForm").totalSeat.value);
	})
	
	// 자리 정보 수정 ajax 요청하기 
	document.querySelector("#updateForm").addEventListener("submit",function(e) {
		e.preventDefault();
		const updateForm = document.querySelector('#updateForm');
		
		ajaxFormPromise(updateForm)
		.then(function(response) {
			return response.json();
		})
		.then(function(data) {
			alert("자리 정보가 수정되었습니다.");
		});
	});
</script>
</body>
</html>