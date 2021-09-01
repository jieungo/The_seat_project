<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/storeReview.css"
	type="text/css" />
</head>
<body>

    <!------------------------------- navbar 추가 -------------------------------->

<div class="container myStore_container">
    <!-- <a href="${pageContext.request.contextPath}/store/manageMenu.do">매장 관리 페이지</a> -->

    <div id="inner" class="inner_container">

    <!------------------------------ USER 리뷰 리스트 (테스트용 1 )-------------------------->
    
        <!-- for문 돌리기 !!! -->
        <div class="user-review" >
            <div class="user-review__title">
                <h5><strong>유저1 <!-- ${dto.name} --></strong></h5>
                <small>21/08/21 <!-- ${dto.regdate} --></small>
            </div>
            <div class="user-review__body arrow_box-user">
                <div class="user-review__text">

                    <!-- 별점이랑 리뷰내용 출력하기 -->
                    <div class="fiveStar">
                        <i class="starIcon fas fa-star"></i>
                        <i class="starIcon fas fa-star"></i>
                        <i class="starIcon fas fa-star"></i>
                        <i class="starIcon fas fa-star"></i>
                        <i class="starIcon far fa-star"></i>
                    </div>
                    <p>
                        방문 한 카페 중에 분위기 최고 !! 마라탕 마라샹궈 꿔바로우 치즈볼 떡볶이 치즈스틱 김치찌개 고등어구이 초코찰떡
                        민트초코송이 블랙타이거쉬림프피자 도미노피자존맛탱 맛있겠다 제육치즈밥버거 이렇게 높이가 늘어나는게 낫겟당
                        <!-- <c:forEach var="tmp" items="${list}">
                            <p data-num="${dto.num}" name="">${tmp}</p>
                        </c:forEach> -->
                    </p>

                    <!-- 버튼 클릭시 글 작성 가능한 사장님 답글 말풍선 생성-->
                    <button href="javascript:" id="userReview">
                        <span class="user-review__reply">답글달기</span>
                    </button>
                </div>
                <div class="img__wrapper">
                    <img src="#" alt="" id="image_logo" name="logo" class="image"/>
                </div>
            </div>
        </div>
    
    <!------------------------- OWNER 답글 리스트 (테스트용 1 ) ----------------------------->

        <div class="owner-review" id="ownerReview" style="display: none;">
            <div class="owner-review__title">
                <small>21/08/22 <!-- ${dto.regdate} --></small>
            </div>
            <div class="owner-review__body arrow_box-owner">
                <div class="edit-btn">
                    <i class="fas fa-edit" id="updateBtn" style="display: none;"></i>
                    <button id="update">수정 완료</button>
                    <button id="updateCancel">취소</button>
                </div>
                <div class="owner-review__text">
                    <h5><strong>사장님</strong></h5>
                    <textarea name="#" id="" placeholder="답글을 입력해 주세요 :)"></textarea>
                </div>
            </div>
        </div>
        


<!------------------------------ USER 리뷰 리스트 (테스트용 2 ) -------------------------->
    
        <!-- for문 돌리기 !!! -->
        <div class="user-review">
            <div class="user-review__title">
                <h5><strong>유저2 <!-- ${dto.name} --></strong></h5>
                <small>21/08/21 <!-- ${dto.regdate} --></small>
            </div>
            <div class="user-review__body arrow_box-user">
                <div class="user-review__text">
                    <div class="fiveStar">
                        <i class="starIcon fas fa-star"></i>
                        <i class="starIcon fas fa-star"></i>
                        <i class="starIcon fas fa-star"></i>
                        <i class="starIcon fas fa-star"></i>
                        <i class="starIcon far fa-star"></i>
                    </div>
                    <p>짧은 리뷰</p>
                    <button>
                        <span class="user-review__reply" >답글달기</span>
                    </button>
                </div>
                <div class="img__wrapper">
                    <img src="#" alt="" id="image_logo" name="logo" class="image"/>
                </div>
            </div>
        </div>
    </div>
    <!------------------------------------ 옆 사이드바 (매장정보, 메뉴관리 탭) ----------------->
    <aside class="store__aside" style="width: 0;">
        <button onclick="location.href='#'">매장 정보</button>
        <button onclick="location.href='${pageContext.request.contextPath}/manageMenu.do'">메뉴 관리</button>
        <button onclick="location.href='${pageContext.request.contextPath}/storeReview.do'">리뷰 관리</button>
        <button onclick="location.href='${pageContext.request.contextPath}/storeOrder.do'">주문 확인</button>
        <button onclick="location.href='#'">자리 관리</button>
    </aside>
</div>
<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>
<script>

// 댓글달기 버튼 클릭하면 사장님 답글 창 생성

let review = document.querySelectorAll('#userReview');
let ownerReview = document.querySelectorAll('#ownerReview');

for (let i=0; i<review.length; i++) {
    review[i].addEventListener('click', function(){
        ownerReview[i].style.display="block";
    });
}



</script>
</body>
</html>