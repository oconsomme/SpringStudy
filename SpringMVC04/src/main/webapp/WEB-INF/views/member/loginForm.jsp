<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
   <jsp:include page="../common/header.jsp"></jsp:include>
     <h2>SpringMVC04</h2>
     <div class="panel panel-default">
       <div class="panel-heading">Board</div>
       <div class="panel-body">
      
      <!-- 회원가입 폼 -->
      <form action="${contextPath}/login.do" method="post">
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
         <table style="text-align:center; border: 1px solid #dddddd" class="table table-bordered"
         <!-- ID 입력, 중복확인창 -->
            <tr>
               <td style="width:110px; vertical-align:middle;">아이디</td>
               <td><input type="text" name="memID" id="memID" class="form-control" maxlength="20" placeholder="아이디를 입력하세요."></td>
               <!-- 온클릭에 아래에 메소드를 넣어줘서 중복확인 실행 -->
               <!-- 타입-버튼을 넣어줘야 서브밋으로 작동하지 않음. -->
            </tr>
         <!-- 비밀번호 위엔 td가 3칸이니 콜스팬을 2로 넣어서 3칸 크기로 병합을 해준다.-->
         <!-- 중복체크는 키보드를 눌렀다가 떼면 자동으로 체크해야하는데 이는 onkeyup 속성을 이용한다. -->
            <tr>
               <td style="width:110px; vertical-align:middle;">비밀번호</td>
               <td><input required="required" type="password" name="memPassword" id="memPassword" class="form-control" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
            </tr>
            
         <!--  -->
            <tr>
               <td colspan="2">
               	  <span id="passMessage" style="color:red;"></span>
                  <input type="reset" class="btn btn-warning btn-sm pull-right" value="취소">
                  <input type="submit" class="btn btn-primary btn-sm pull-right" value="로그인">
               </td>
            </tr>   
               
            </table>
      </form>
      
      

      </div>
       <div class="panel-footer">Panel Content</div>
     </div>
   </div>
   
   
  <!-- Modal 어디에 있어도 상관없지. -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div id="checkType" class="modal-content">
        <div class="modal-header panel-heading">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">메세지 확인</h4>
        </div>
        <div class="modal-body">
        <!-- 아래의 p태그 안에 상황에 따라 달라지는 메시지 작성 -->
          <p id="checkMessage"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- 로그인 실패시 띄워줄 모달 -->
  <div class="modal fade" id="myMessage" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div id="messageType" class="modal-content">
        <div class="modal-header panel-heading">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">${msgType}</h4>
        </div>
        <div class="modal-body">
        <!-- 아래의 p태그 안에 상황에 따라 달라지는 메시지 작성 -->
          <p id="">${msg}</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
   
   <!-- 중복체크 온클릭 메소드 -->
   <!-- 아이디 중복체크는 비동기방식을 많이 쓴다. -->
   <!-- 이외에도 비동기방식의 중복체크는 네이버의 검색창 자동완성같은것이 있다. -->
	<script type="text/javascript">
   
   $(document).ready(function(){
	   if(${not empty msgType}){
		   if(${msgType eq "실패메세지"}){
			   $("#messageType").attr("class", "modal-content panel-warning");
		   }
		   $("#myMessage").modal("show");
	   }
   });
   
	</script>
   
   
   
   
</body>
</html>