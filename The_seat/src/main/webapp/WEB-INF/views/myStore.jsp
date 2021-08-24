<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>매장 관리 페이지</p>
	DB 번호 : <p>${dto.num }</p>
	매장 관리자 : <p>${dto.owner }</p>
	매장 이름 : <p>${dto.storeName }</p>
	매장 주소 : <p>${dto.storeAddr }</p>
	매장 태그 : <p>${dto.storeTag }</p>
	영업 시간 : <p>${dto.openingTime }</p>
	매장 로고 : <p>${dto.image_logo }</p>
	이미지 1 : <p>${dto.image_1 }</p>
	이미지 2 : <p>${dto.image_2 }</p>
	이미지 3 : <p>${dto.image_3 }</p>
	이미지 4 : <p>${dto.image_4 }</p>
	오픈 여부 : <p>${dto.storeOpen }</p>
	매장 등록일 : <p>${dto.regdate }</p>
	
</body>
</html>