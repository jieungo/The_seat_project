<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer.jsp</title>
<!---------------------- 외부 css 링크 로딩하기 ---------------------->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
<style>
.footer-distributed {
	background: rgb(221, 221, 221);
	margin-top: 120px;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	width: 100%;
	text-align: left;
	font: bold 16px sans-serif;
	padding: 55px 50px;
}

.footer-distributed .footer-left, .footer-distributed .footer-center,
	.footer-distributed .footer-right {
	display: inline-block;
	vertical-align: top;
}

/* Footer left */
.footer-distributed .footer-left {
	width: 40%;
}

/* The company logo */
.footer-distributed h3 {
	color: rgb(86, 86, 86);
	
	margin: 0;
}

.footer-distributed h3 span {
	color: lightseagreen;
}

/* Footer links */
.footer-distributed .footer-links {
	color: rgb(86, 86, 86);
	margin: 20px 0 12px;
	padding: 0;
}

.footer-distributed .footer-links a {
	display: inline-block;
	line-height: 1.8;
	font-weight: 400;
	text-decoration: none;
	color: inherit;
}

.footer-distributed .footer-company-name {
	color: #222;
	font-size: 14px;
	font-weight: normal;
	margin: 0;
}

/* Footer Center */
.footer-distributed .footer-center {
	width: 35%;
}

.footer-distributed .footer-center i {
	background-color: rgb(86, 86, 86);
	color: #ffffff;
	font-size: 25px;
	width: 38px;
	height: 38px;
	border-radius: 50%;
	text-align: center;
	line-height: 42px;
	margin: 10px 15px;
	vertical-align: middle;
}

.footer-distributed .footer-center i.fa-envelope {
	font-size: 17px;
	line-height: 38px;
}

.footer-distributed .footer-center p {
	display: inline-block;
	color: rgb(86, 86, 86);
	font-weight: 400;
	vertical-align: middle;
	margin: 0;
}

.footer-distributed .footer-center p span {
	display: block;
	font-weight: normal;
	font-size: 14px;
	line-height: 2;
}

.footer-distributed .footer-center p a {
	color: lightseagreen;
	text-decoration: none;;
}

.footer-distributed .footer-links a:before {
	content: "|";
	font-weight: 300;
	font-size: 20px;
	left: 0;
	color: rgb(86, 86, 86);
	display: inline-block;
	padding-right: 5px;
}

.footer-distributed .footer-links .link-1:before {
	content: none;
}

/* Footer Right */
.footer-distributed .footer-right {
	width: 20%;
}

.footer-distributed .footer-company-about {
	line-height: 20px;
	color: #92999f;
	font-size: 13px;
	font-weight: normal;
	margin: 0;
}

.footer-distributed .footer-company-about span {
	display: block;
	color: rgb(86, 86, 86);
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 20px;
}

.footer-distributed .footer-icons {
	margin-top: 25px;
}

.footer-distributed .footer-icons a {
	display: inline-block;
	width: 35px;
	height: 35px;
	cursor: pointer;
	background-color: rgb(86, 86, 86);
	border-radius: 2px;
	font-size: 20px;
	color: #ffffff;
	text-align: center;
	line-height: 35px;
	margin-right: 3px;
	margin-bottom: 5px;
}

/* If you don't want the footer to be responsive, remove these media queries */
@media ( max-width : 880px) {
	.footer-distributed {
		font: bold 14px sans-serif;
	}
	.footer-distributed .footer-left, .footer-distributed .footer-center,
		.footer-distributed .footer-right {
		display: block;
		width: 100%;
		margin-bottom: 40px;
		text-align: center;
	}
	.footer-distributed .footer-center i {
		margin-left: 0;
	}
}
</style>
</head>
<body>

	<!-- <div class="container"> -->
	<footer class="footer-distributed">
		<div class="footer-left">
			<h3>
				<span><img src="${pageContext.request.contextPath}/resources/img/chair.png" alt="logo" style="width: 50px; height: 50px;" /></span>자리..있어요?
			</h3>
			<p class="footer-links">
				<a href="#" class="link-1">Home</a> <a href="#">Blog</a> <a href="#">Pricing</a>
				<a href="#">About</a> <a href="#">Faq</a> <a href="#">Contact</a>
			</p>
			<p class="footer-company-name">Is there a seat? © 2021</p>
		</div>
		<div class="footer-center">
			<div>
				<i class="fa fa-map-marker"></i>
				<p>
					<span>서울 강남구 테헤란로 124 Acorn Academy</span> ✌런게 코딩✌조 | Lee, Kyu, Go, Hyun
				</p>
			</div>
			<div>
				<i class="fa fa-phone"></i>
				<p>+1.555.555.5555</p>
			</div>
			<div>
				<i class="fa fa-envelope"></i>
				<p>
					<a href="mailto:support@company.com">support@company.com</a>
				</p>
			</div>
		</div>
		<div class="footer-right">
			<p class="footer-company-about">
				<span>About the company</span> Lorem ipsum dolor sit amet,
				consectateur adispicing elit. Fusce euismod convallis velit, eu
				auctor lacus vehicula sit amet.
			</p>
			<div class="footer-icons">
				<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
					class="fa fa-google"></i></a> <a href="#"><i
					class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-github"></i></a>
			</div>
		</div>
	</footer>
	<!-- </div> -->
</body>
</html>