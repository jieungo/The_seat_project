<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/litepicker.js"></script>
    <!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다.
<meta name ="google-signin-client_id" content="839898539479-e2dquis5dv2229nb6t19mept3n0lc1mh.apps.googleusercontent.com"> -->
</head>
<body>
    <style>
        body {
            background-color: #2e8eff;
            color: white;
            font-size: 1rem;
            height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
        }

        .line {
            height: 1px;
            width: 100px;
            background-color: white;
            display: inline-block;
        }

        .line-section {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .line-section > span {
            padding: 0 15px 0 15px;
        }

        .form-control {
            width: 25vw;
            height: 4vh;
            outline: none;
            border: none;
            margin-top: 5px;
        }

        .signup__modal {
            width: 50vw;
            height: 50vh;
            background-color: white;
            color: black;
        }
        .modal-hide {
            display: none;
        }

        #cancle_icon {
            cursor: pointer;
        }
    </style>
<body>
  <div class="container">
    <div class="row">
        <!-- 왼쪽 텍스트 -->
        <section class="col">
            <p>이젠, 빈자리 찾아 해매지 말자!</p>
            <h1>자리..<br>있어요?</h1>
        </section>
       <!-- 오른쪽 로그인바 -->
       <section class="col">
           <form id="loginForm" action="#" method="post">
               <div>
                   <label class="label" for="email">Email</label><br>
                   <input class="form-control" type="email" name="email"/>
                   <div class="invalid-feedback">사용할수 없는 이메일 입니다.</div>
               </div>
               <div>
                   <label class="label" for="password">Password</label><br>
                   <input class="form-control" type="password" name="pwd"/>
                   <div class="invalid-feedback">비밀번호를 확인 하세요.</div>
               </div>
               <button type="submit">Continue</button>
           </form>
   
           <div class="line-section">
               <div class="line"></div>
               <span>OR</span>
               <div class="line"></div>
           </div>  
         <section>
          <!-- 카카오 로그인 -->
          <button class="login_box kakao" onclick="kakaoLogin();">
              <a href="javascript:void(0)"></a>
              카카오 로그인</button>

              <li onclick="kakaoLogout();">
                  <a href="javascript:void(0)">
                      <span>카카오 로그아웃</span>
                  </a>
              </li>

          <!-- 구글 로그인
          <button class="login_box google">
              <a href="javascript:void(0)"></a>
              구글 로그인</button> -->
         </section> 
         </section>
         <button class="signup__btn">Signup</button>
         <section class="signup__modal modal-hide">
             <div>
                 <svg id="cancle_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                     <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                 </svg>
                 <h2>Sign up</h2>
                 <form id="signupForm" action="#" method="post">
                     <div>
                         <input class="form-control" type="text" name="email" id="email" placeholder="이메일주소">
                         <div class="invalid-feedback">사용할수 없는 이메일 입니다.</div>
                     </div>
                     <div>
                         <input class="form-control" type="password" name="pwd" id="pwd" placeholder="비밀번호">
                         <small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
                         <div class="invalid-feedback">비밀번호를 확인 하세요.</div>
                     </div>
                     <div>
                         <input class="form-control" type="password" name="pwd2" id="pwd2" placeholder="비밀번호를 한번 더 입력해주세요">
                         <div class="invalid-feedback">비밀번호를 확인 하세요.</div>
                     </div>
                     <div>
                         <input class="form-control" type="text" name="name" id="name" placeholder="이름">
                     </div>
                     <div>
                         <label for="data">생년월일</label>
                         <input name="date" id="litepicker" autocomplete="off" placeholder="생년월일"/>
                     </div>
                     <div class="line"></div>
                     <div>
                         <input class="form-control" type="text" name="likeMenu" id="likeMenu" placeholder="선호하는 음식">
                         <button class="menu-add">추가</button>
                     </div>
                     <button type="submit">가입완료</button>
                 </form>
             </div>
         </section>
    </div>
</div>
<script src="<%=request.getContextPath() %>/js/gura_util.js"></script>
<script>
    const signupBtn = document.querySelector('.signup__btn');
    const cancleBtn = document.querySelector('#cancle_icon');
    let signup__modal = document.querySelector('.signup__modal');

    signupBtn.addEventListener('click', ()=> {
        signup__modal.classList.remove("modal-hide");
    })

    cancleBtn.addEventListener('click', ()=> {
        signup__modal.classList.add("modal-hide");
    })

	//아이디, 비밀번호, 이메일의 유효성 여부를 관리한 변수 만들고 초기값 대입
	let isIdValid=false;
	let isPwdValid=false;

	//이메일 입력했을때(input) 실행할 함수 등록 
	document.querySelector("#email").addEventListener("input", function(){
		//일단 is-valid,  is-invalid 클래스를 제거한다.
		document.querySelector("#email").classList.remove("is-valid");
		document.querySelector("#email").classList.remove("is-invalid");
		
		//1. 입력한 이메일 value 값 읽어오기  
		let inputId=this.value;
		//입력한 이메일을 검증할 정규 표현식
		const reg_id=/@/;
		//만일 입력한 이메일이 정규표현식과 매칭되지 않는다면
		if(!reg_id.test(inputId)){
			isIdValid=false; //매칭되지 않는다고 표시하고 
			// is-invalid 클래스를 추가한다. 
			document.querySelector("#email").classList.add("is-invalid");
			return; //함수를 여기서 끝낸다 (ajax 전송 되지 않도록)
		}
		
		//2. util 에 있는 함수를 이용해서 ajax 요청하기
		ajaxPromise("#", "get", "inputId="+inputId)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			//data 는 {isExist:true} or {isExist:false} 형태의 object 이다.
			if(data.isExist){//만일 존재한다면
				//사용할수 없는 아이디라는 피드백을 보이게 한다. 
				isIdValid=false;
				// is-invalid 클래스를 추가한다. 
				document.querySelector("#email").classList.add("is-invalid");
			}else{
				isIdValid=true;
				document.querySelector("#email").classList.add("is-valid");
			}
		});
	});
	
	//비밀 번호를 확인 하는 함수 
	function checkPwd(){
		document.querySelector("#pwd").classList.remove("is-valid");
		document.querySelector("#pwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#pwd").value;
		const pwd2=document.querySelector("#pwd2").value;
		
		// 최소5글자 최대 10글자인지를 검증할 정규표현식
		const reg_pwd=/^.{5,10}$/;
		if(!reg_pwd.test(pwd)){
			isPwdValid=false;
			document.querySelector("#pwd").classList.add("is-invalid");
			return; //함수를 여기서 종료
		}
		
		if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면
			//비밀번호를 잘못 입력한것이다.
			isPwdValid=false;
			document.querySelector("#pwd").classList.add("is-invalid");
		}else{
			isPwdValid=true;
			document.querySelector("#pwd").classList.add("is-valid");
		}
	}
	
	//비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
	document.querySelector("#pwd").addEventListener("input", checkPwd);
	document.querySelector("#pwd2").addEventListener("input", checkPwd);
	
	
	//폼에 submit 이벤트가 발생했을때 실행할 함수 등록
	document.querySelector("#signupForm").addEventListener("submit", function(e){
		//console.log(e);
		/*
			입력한 아이디, 비밀번호의 효성 여부를 확인해서 하나라도 유효 하지 않으면
			e.preventDefault(); 
			가 수행 되도록 해서 폼의 제출을 막아야 한다. 
		*/
		//폼 전체의 유효성 여부 알아내기 
		let isFormValid = isIdValid && isPwdValid;
		if(!isFormValid){//폼이 유효하지 않으면
			//폼 전송 막기 
			e.preventDefault();
		}	
	});

</script>
    <!-- datepicker-->
    <script>
        const picker = new Litepicker({ 
          element: document.getElementById('litepicker') 
        });
      </script>

    <!-- 카카오 스크립트 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        Kakao.init('1cb3c0466b76917b1c74d17787e7bf55'); //발급받은 키 중 javascript키를 사용해준다.
        console.log(Kakao.isInitialized()); // sdk초기화여부판단
        //카카오로그인
        function kakaoLogin() {
            Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    console.log(response);
                    
                },
                fail: function (error) {
                    console.log(error)
                    alert('로그인 실패');
                },
                })
            },
            fail: function (error) {
                console.log(error)
            },
            })
        }
            //카카오로그아웃  
            function kakaoLogout() {
            if (Kakao.Auth.getAccessToken()) {
              Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                  console.log(error)
                },
              })
              Kakao.Auth.setAccessToken(undefined)
            }
          } 
    </script>
    
    
    <!-- 구글 스크립트
    <script>
        //처음 실행하는 함수
        function init() {
            gapi.load('auth2', function() {
                gapi.auth2.init();
                options = new gapi.auth2.SigninOptionsBuilder();
                options.setPrompt('select_account');
                // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
                options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
                // 인스턴스의 함수 호출 - element에 로그인 기능 추가
                // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
                gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
            })
        }
        
        function onSignIn(googleUser) {
            var access_token = googleUser.getAuthResponse().access_token
            $.ajax({
                // people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
                url: 'https://people.googleapis.com/v1/people/me'
                // key에 자신의 API 키를 넣습니다.
                , data: {personFields:'birthdays', key:'AIzaSyD10vjtpzag9pab67BMKNZVu8zQwyVhwVk', 'access_token': access_token}
                , method:'GET'
            })
            .done(function(e){
                //프로필을 가져온다.
                var profile = googleUser.getBasicProfile();
                console.log(profile)
            })
            .fail(function(e){
                console.log(e);
            })
        }
        function onSignInFailure(t){		
            console.log(t);
        }
        </script>
        <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script> -->
    </body>
    </html>