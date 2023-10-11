<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	  <h2>Spring Book</h2>
		<div class="panel panel-default">
		    <div class="panel-heading">Book</div>
		    <div class="panel-body">
				<table id="bookList" class="table table-bordered table-hover">
					<tr class="active">
						<td>번호</td>
						<td>제목</td>
						<td>작가</td>
						<td>출판사</td>
						<td>isbn</td>
						<td>보유도서수</td>
						<td>삭제</td>
						<td>수정</td>
					</tr>
					<tbody id="view">
					<!-- 비동기 방식으로 가져온 게시글 나오게 할 부분 -->
					</tbody>
					
					<tr>
						<td colspan="8">
							<button onclick="goForm()" class="btn btn-primary btn-sm">도서등록</button>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- 글쓰기 폼 -->
			<div class="panel-body" id="wform" style="display : none;">
				<form id="frm">
		            <table class="table">
		               <tr>
		                  <td>제목</td>
		                  <td><input type="text" name="title" class="form-control"></td>
		               </tr>
		               <tr>
		                  <td>작가</td>
		                  <td><input type="text" name="author" class="form-control"></td>
		               </tr>
		               <tr>
		                  <td>출판사</td>
		                  <td><input type="text" name="company" class="form-control"></td>
		               </tr>
		               <tr>
		                  <td>isbn</td>
		                  <td><input type="text" name="isbn" class="form-control"></td>
		               </tr>
		               <tr>
		                  <td>보유도서수</td>
		                  <td><input type="text" name="count" class="form-control"></td>
		               </tr>
		               <tr>
		                  <td colspan="2" align="center">
		                     <button class="btn btn-success btn-sm" type="button" onclick="goInsert()">등록</button>
		                     <button class="btn btn-warning btn-sm" type="reset" id="fclear">취소</button>
		                     <button onclick="goList()" class="btn btn-info btn-sm">리스트로가기</button>
		                  </td>
		               </tr>
		            </table>
		         </form>
			</div>
			
			<!-- 글 수정 폼 -->
			<div class="panel-body" id="uform" style="display : none;">
				<form id="frm">
					<input type="hidden" id="nn" class="form-control" value="">
		            <table class="table">
		               <tr>
		                  <td>제목</td>
		                  <td><input readonly="readonly" type="text" id="nt" class="form-control" value=""></td>
		               </tr>
		               <tr>
		                  <td>작가</td>
		                  <td><input readonly="readonly" type="text" id="na" class="form-control" value=""></td>
		               </tr>
		               <tr>
		                  <td>출판사</td>
		                  <td><input readonly="readonly" type="text" id="nc" class="form-control" value=""></td>
		               </tr>
		               <tr>
		                  <td>isbn</td>
		                  <td><input readonly="readonly" type="text" id="ni" class="form-control" value=""></td>
		               </tr>
		               <tr>
		                  <td>보유도서수</td>
		                  <td><input type="text" id="nco" class="form-control" value=""></td>
		               </tr>
		               <tr>
		                  <td colspan="2" align="center">
		                     <button class="btn btn-success btn-sm" type="button" onclick="goUpdate()">수정</button>
		                     <button class="btn btn-warning btn-sm" type="reset" id="fclear">취소</button>
		                     <button onclick="goList()" class="btn btn-info btn-sm">리스트로가기</button>
		                  </td>
		               </tr>
		            </table>
		         </form>
			</div>
			
		    <div class="panel-footer">스프링도서관</div>
  		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			// HTML이 다 로딩되고나서 아래 코드 실행
			loadList();
		});
		
	function loadList() {
		// 비동기방식으로 게시글 리스트 가져오기 기능
		// ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... --> 객체
		$.ajax({
			url : "book/all",
			type : "get",
			dataType : "JSON",
			success : makeView, // 콜백함수
			error : function() { alert("error"); }
		});
	}
	
	function makeView(data) {
		
		var listHtml = "";
		$.each(data, function(index, obj){
			
			listHtml += "<tr>";
			listHtml += "<td>" + (index+1) + "</td>";
			listHtml += "<td id='t" + obj.num + "'>" + obj.title + "</td>";
			listHtml += "<td id='a" + obj.num + "'>"+ obj.author + "</td>";
			listHtml += "<td id='c" + obj.num + "'>"+ obj.company + "</td>";
			listHtml += "<td id='i" + obj.num + "'>"+ obj.isbn + "</td>";
			listHtml += "<td id='co" + obj.num + "'>"+ obj.count + "</td>";
			listHtml += "<td><button onclick='goDelete("+ obj.num +")' class='btn btn-primary btn-sm'>" + "삭제" +  "</button></td>";
			listHtml += "<td><button onclick='goUpdateForm("+ obj.num +")' class='btn btn-warning btn-sm'>" + "수정" +  "</button></td>";
			listHtml += "</tr>";
			
		});
		
		$("#view").html(listHtml);
		
		goList();
	}
	
	// goForm 함수를 만들어서 view는 감추고 wform은 보이게 하시오
	function goForm(){
		$("#bookList").css("display", "none");
		$("#wform").css("display", "block");
	}
	
	function goList(){
		$("#bookList").css("display", "table-row");
		$("#wform").css("display", "none");
		$("#uform").css("display", "none");
	}
	
	function goInsert() {
		// 게시글 등록기능 - 비동기
		// title="안녕"&content="반가워"&writer="호두아빠"
		var fData = $("#frm").serialize();
		
		$.ajax({
			url : "book/new",
			type : "post",
			data : fData,
			success : loadList,
			error : function() { alert("error") }
		});
		$("#fclear").trigger("click");
	}
	
	function goDelete(num) {
		$.ajax({
			url : "book/"+num,
			type : "delete",
			data : {"num" : num},
			success : loadList,
			error : function() { alert("error") }
		});
	}
	
	function goUpdateForm(num) {
		var title = $("#t"+num).text();
		var author = $("#a"+num).text();
		var company = $("#c"+num).text();
		var isbn = $("#i"+num).text();
		var count = $("#co"+num).text();
		
		$("#nt").val(title);
	    $("#na").val(author);
	    $("#nc").val(company);
	    $("#ni").val(isbn);
	    $("#nco").val(count);
	    $("#nn").val(num);
		
		$("#bookList").css("display", "none");
		$("#uform").css("display", "block");
	}
	
	function goUpdate(num) {
	    // bookUpdate.do로 요청을 통해 게시글을 수정하고
	    // 수정된 게시글 다시 불러와서 적용시키시오 (숙제)
	    
	    var title = $("#nt").val();
	    var author = $("#na").val();
	    var company = $("#nc").val();
	    var isbn = $("#ni").val();
	    var count = $("#nco").val();
	    var num = $("#nn").val();
	    
	    $.ajax({
	        url : "book/update",
	        type : "put",
	        contentType : "application/json;charset=utf-8",
	        data : JSON.stringify({"num" : num, "title" : title, "author" : author, "company" : company, "isbn":isbn,"count":count }),
	        success : loadList,
	        error : function() { alert("error") }
	    });
	}

	</script>
</body>
</html>

