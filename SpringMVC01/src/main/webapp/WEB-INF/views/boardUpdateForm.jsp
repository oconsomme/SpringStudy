<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
  	<h2>Spring MVC01</h2>
  	<div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body">
    <form action="../boardUpdate.do" method="post">
    <!-- 
    	boardUpdate.do 요청을 하게 되면
    	idx와 일치하는 게시글을 입력한 정보로 수정한 다음
    	게시글 목록페이지로 이동시키시오
     -->
    <input type="hidden" name="idx" value="${vo.idx}">
		<table class="table">
			<tr>
				<td>제목</td>
				<td><input value="${vo.title}" type="text" name="title" class="form-control"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="form-control" name="content" rows="7" cols="">${vo.content}</textarea></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input value="${vo.writer}"type="text" name="writer" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button class="btn btn-success btn-sm" type="submit">수정</button>
					<button class="btn btn-warning btn-sm" type="reset">취소</button>
					<a href="../boardList.do" class="btn btn-info btn-sm"type="submit">목록</a>
				</td>
			</tr>
		</table>
	</form>
	</div>
    <div class="panel-footer">스프링 게시판 - 박병관</div>
    </div>
</div>
</body>
</html>