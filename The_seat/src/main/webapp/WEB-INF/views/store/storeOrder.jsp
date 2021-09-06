<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/storeOrder.css?ver=2"
	type="text/css" />
</head>

<body>
    <!------------------------------- navbar 추가 -------------------------------->
<jsp:include page="../nav/navbar2.jsp" />
<div class="myStore_container-gray" style="display: flex; flex-direction: row; justify-content: space-between">
<div style="width:750px; display: flex; flex-direction: column; padding: 20px 30px;">
    <!-------------------------- 주문내역 타이틀 및 날짜 검색 ---------------------------->
    <header class="store__order-header">
        <h4>주문 내역</h4>
        <form action="#">
            <input type="date">
            <button class="search-btn" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>
    </header>
    <!------------------------------ 주문내역 텍스트 및 박스 --------------------------------------->
    <div id="inner" class="inner_container" style="display: flex;"> 
        <div class="store__order-user">
            <h5>규환 님의 주문</h5>
            <h6>5,000원 (결제완료)</h6>
        </div>

        <div class="white-box">
            <section class="order">
                <div class="order__body">
                    <h5 class="box-title">주문내역</h5>
                    <div class="line"></div>
                    <ul class="order__list">
                        <li class="list-item row">
                            <span class="col">아메리카노 (ICED)</span>
                            <span class="col">2</span>
                            <span class="col">5,000</span>
                        </li>
                        <li class="list-item row">
                            <span class="col">레드벨벳케이크</span>
                            <span class="col">3</span>
                            <span class="col">15,000</span>
                        </li>
                        <div class="down-icon">
                            <i class="fas fa-caret-down"></i>
                        </div>
                    </ul>
                    <div class="dot"></div>
                    <ul class="order__total">
                        <li class="list-item row">
                            <span class="col">총합계</span>
                            <span class="col">5</span>
                            <span class="col">20,000</span>
                        </li>
                    </ul>
                </div>
            </section>
    <!------------------------------ 예약정보 박스 --------------------------------------->
            <section class="reserve">
                <h5 class="box-title">예약정보</h5>
                <div class="reserve-body">
                    <div class="reserve-info">
                        <sapn>전화번호</sapn>
                        <strong>012-345-6789</strong>
                    </div>
                    <div class="reserve-info">
                        <sapn>좌석정보</sapn>
                        <strong>2번 좌석</strong>
                    </div>
                    <div class="reserve-info">
                        <sapn>방문시간</sapn>
                        <strong>21/09/13 13:00</strong>
                    </div>
                </div>
                <button class="reserve-btn">확인</button>
            </section>
        </div>
    </div>
</div>
        <!------------------------------------ 옆 사이드바 (매장정보, 메뉴관리 탭) ----------------->
        <aside class="aside">
             <button onclick="location.href='#'">매장 정보</button>
             <button onclick="location.href='${pageContext.request.contextPath}/store/manageMenu.do?num=${dto.num}&storeName=${dto.storeName}'">메뉴 관리</button>
             <button onclick="location.href='${pageContext.request.contextPath}/store/storeReview.do'">리뷰 관리</button>
             <button onclick="location.href='${pageContext.request.contextPath}/store/storeOrder.do'">주문 확인</button>
             <button onclick="location.href='${pageContext.request.contextPath}/store/storeSeat.do'">자리 관리</button>
         </aside>
</div>
<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>