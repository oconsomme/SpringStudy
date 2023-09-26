<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 너 권한이 없어 다시 로그인 해서 접근하여 알려주기 -->
	<h2>Access-Denied - You are not authorized to access this resources.</h2>
	<hr>
	<a href="${pageContext.request.contextPath}/">Back to Home Page</a>
</body>
</html>