<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <a href="#">카테고리1</a>
                <a href="#">카테고리2</a>
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
            
        <div class="card" style="max-width: 500px;">
            <div class="row g-0">
                <button class="mt-3 pe-2 starBtn" style="display: flex; justify-content:flex-end;">
                    <i class="starIcon far fa-star"></i>
                </button>
                <div class="col-md-4 ms-4">
                    <img src="resources/cake.jpeg" class="rounded" alt="menu_image">
                </div>
                <div class="col-md-6">
                    <div class="card-body p-2" style="width: 200px;">
                        <h6 class="card-text">상품명 <!-- <p class="card-text">존맛탱 케이크</p> --> </h6>
                        <h6 class="card-text">상품가격  <!-- <p class="card-text">10,000원</p> --> </h6>
                        <h6 class="card-text">상품구성 <!-- <p class="card-text">생크림, 시나몬, 밀가루</p> --> </h6>
                    </div>
                </div>
                <div class="menu__card-edit mb-2 pe-2" style="display: flex; justify-content: flex-end;">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
            </div>
        </div>
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
    
    <div class="modal " tabindex="-1" id="modal-menuAddForm" aria-labelledby="menuAddForm" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><strong>메뉴 등록</strong> </h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="menuAddForm" action="#" method="post">
                    <input class="form-control" type="hidden" name="image" id="image">
                    <input class="form-control" type="text" name="menuname" id="menuname" placeholder="상품명" required="required">
                    <input class="form-control" type="number" name="menuprice" id="menuprice" placeholder="상품가격" required="required">
                    <input class="form-control" type="text" name="menucontaine" id="menucontaine" placeholder="상품구성" required="required">
                    <span class="dropdown">카테고리 추가</span>
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                        카테고리 목록
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" > 
                        <li><a class="dropdown-item" href="#">전체</a></li>
                        <li><a class="dropdown-item" href="#">1</a></li>
                        <li><a class="dropdown-item" href="#">2</a></li>
                    </ul><br>
                    <button type="submit">완료</button>
                </form>
            </div>
        </div>
    </div>
    </div> 
</div>


<script src="https://kit.fontawesome.com/2ebe86210e.js" crossorigin="anonymous"></script>
<script>

const starIcon = document.querySelector('.starIcon');

starIcon.addEventListener('click', ()=> {
    starIcon.classList.toggle('fas');
});

</script>

</body>
</html>