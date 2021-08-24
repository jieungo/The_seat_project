<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    // <input>태그의 name 속성값을 사용하여 사용자의 입력값을 수신한다.
    String search = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/store/main.jsp</title>
</head>
<body>
	<div class="container">
		<c:if test="${ not empty keyword }">
		<p>	
			<strong>${area }</strong> 지역,
			<strong>${group }</strong> 메뉴,
			<strong>${keyword }</strong> 검색어로 검색된 내용 자세히 보기 
		</p>
	</c:if>
	</div>
</body>
</html>