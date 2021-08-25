<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
<div class="container">
	 <jsp:include page="../nav/navbar.jsp" />
	 <h1>${dto.name } 님의 페이지 입니다.</h1>
</div>


<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>

</script>
</body>
</html>