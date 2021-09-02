<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/storeSeat.css"
	type="text/css" />
</head>
<body>

    <!------------------------------- navbar 추가 -------------------------------->

<div class="container myStore_container">
    <h4 style="font-weight: 700;">좌석 구성</h4>
    
    <!-------------------------- 좌석 구성도 ---------------------------->

    <div id="inner" class="inner_container">
        <div class="display-box">
            <section class="seat">
                    <small class="seat-title">
                        * 1,2,3,7 좌석은 2인 이용 가능하며 4,5,6 좌석은 4인 이용 가능합니다.
                    </small>
                    <div class="seat__box">
                        <div class="box box1" style="top: 30px; left: 20px;">1</div>
                        <div class="box box2" style="top: 50px; left: 120px;">2</div>
                        <div class="box box3" style="top: 150px; left: 10px;">3</div>
                        <div class="box box4" style="top: 130px; left: 220px;">4</div>
                        <div class="box box5" style="top: 180px; left: 150px;">5</div>
                        <div class="box box6" style="top: 30px; left: 280px;">6</div>
                        <div class="box box7" style="top: 170px; left: 300px;">7</div>
                    </div>
                    <div class="seat__select">
                        <label for="seat__select-box">좌석 수 설정</label>
                        <select id="seat__select-box">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                        </select>
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
                    <div>
                        <p>2번 자리</p>
                        <select class="useState">
                            <option value="canUse">이용가능</option>
                            <option value="nowUse">이용중</option>
                            <option value="cantUse">이용불가</option>
                        </select>
                    </div>
                    <div>
                        <p>3번 자리</p>
                        <select class="useState">
                            <option value="canUse">이용가능</option>
                            <option value="nowUse">이용중</option>
                            <option value="cantUse">이용불가</option>
                        </select>
                    </div>
                    <div>
                        <p>4번 자리</p>
                        <select class="useState">
                            <option value="canUse">이용가능</option>
                            <option value="nowUse">이용중</option>
                            <option value="cantUse">이용불가</option>
                        </select>
                    </div>
                    <div>
                        <p>5번 자리</p>
                        <select class="useState">
                            <option value="canUse">이용가능</option>
                            <option value="nowUse">이용중</option>
                            <option value="cantUse">이용불가</option>
                        </select>
                    </div>
                    <div>
                        <p>6번 자리</p>
                        <select class="useState">
                            <option value="canUse">이용가능</option>
                            <option value="nowUse">이용중</option>
                            <option value="cantUse">이용불가</option>
                        </select>
                    </div>
                    <div>
                        <p>7번 자리</p>
                        <select class="useState">
                            <option value="canUse">이용가능</option>
                            <option value="nowUse">이용중</option>
                            <option value="cantUse">이용불가</option>
                        </select>
                    </div>
                </div>
            </section>
        </div>
        <button class="submit-btn">배치 변경</button>
    </div>
    <!------------------------------------ 옆 사이드바 (매장정보, 메뉴관리 탭) ----------------->
    <aside class="store__aside">
        <button>매장 정보</button>
        <button>메뉴 관리</button>
        <button>리뷰 관리</button>
        <button>주문 확인</button>
        <button>자리 관리</button>
    </aside>
</div>
<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>