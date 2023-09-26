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
     <h2>Spring MVC06</h2>
     <div class="panel panel-default">
       <div class="panel-heading">Board</div>
       <div class="panel-body">
      
      <!-- 회원가입 폼 -->
      <form action="${contextPath}/join.do" method="post">
      <!-- 
      	이제는 서버로 단순히 회원가입 정보만 전달하는 것이 아니라
      	서버에서 발행한 토큰도 전달해야 회원가입이 가능하다
       -->
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
         
         <input type="hidden" name="memPassword" id="memPassword" value="">
         <table style="text-align:center; border: 1px solid #dddddd" class="table table-bordered"
         <!-- ID 입력, 중복확인창 -->
            <tr>
               <td style="width:110px; vertical-align:middle;">아이디</td>
               <td><input type="text" name="memID" id="memID" class="form-control" maxlength="20" placeholder="아이디를 입력하세요."></td>
               <!-- 온클릭에 아래에 메소드를 넣어줘서 중복확인 실행 -->
               <!-- 타입-버튼을 넣어줘야 서브밋으로 작동하지 않음. -->
               <td style="width:110px"><button type="button" onclick="registerCheck()" class="btn btn-sm btn-primary">중복확인</button></td>
            </tr>
         <!-- 비밀번호 위엔 td가 3칸이니 콜스팬을 2로 넣어서 3칸 크기로 병합을 해준다.-->
         <!-- 중복체크는 키보드를 눌렀다가 떼면 자동으로 체크해야하는데 이는 onkeyup 속성을 이용한다. -->
            <tr>
               <td style="width:110px; vertical-align:middle;">비밀번호</td>
               <td colspan="2"><input required="required" type="password" name="memPassword1" onkeyup="passwordCheck()" id="memPassword1" class="form-control" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
            </tr>
            <tr>
               <td style="width:110px; vertical-align:middle;">비밀번호확인</td>
               <td colspan="2"><input type="password" name="memPassword2" onkeyup="passwordCheck()" id="memPassword2" class="form-control" maxlength="20" placeholder="비밀번호를 확인하세요."></td>
            </tr>
         <!-- 사용자 이름 -->   
            <tr>
               <td style="width:110px; vertical-align:middle;">사용자 이름</td>
               <td colspan="2"><input type="text" id="memName" name="memName"class="form-control" maxlength="20" placeholder="이름을 입력하세요."></td>
            </tr>
         <!-- 나이 -->
            <tr>
               <td style="width:110px; vertical-align:middle;">나이</td>
               <td colspan="2"><input type="number" id="memAge" name="memAge"class="form-control" maxlength="20" placeholder="나이을 입력하세요."></td>
            </tr>
         <!-- 성별 -->
            <tr>
               <td style="width:110px; vertical-align:middle;">성별</td>
               <td colspan="2">
                  <div class="form-group" style="text-align:center; margin: 0 auto;">
                     <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-primary active">
                           <input type="radio" id="memGender" name="memGender" autocapitalize="off" value="남자" checked="checked"> 남자
                        </label>
                        <label class="btn btn-primary">
                           <input type="radio" id="memGender" name="memGender" autocapitalize="off" value="여자"> 여자
                        </label>
                                                      
                     </div>
                  </div>
               </td>
               </tr>
         <!-- 이메일 -->
            <tr>
               <td style="width:110px; vertical-align:middle;">이메일</td>
               <td colspan="2"><input type="email" name="memEmail" id="memEmail" class="form-control" maxlength="50" placeholder="이메일 입력하세요."></td>
            </tr>
            
         <!-- 권한 체크박스 -->
	         <tr>
	         	<td style="width:110px; vertical-align:middle;">권한</td>
	         	<td colspan="2">
	         		<input type="checkbox" name="authList[0].auth" value="ROLE_USER"> ROLE_USER
	         		<input type="checkbox" name="authList[1].auth" value="ROLE_MANAGER"> ROLE_MANAGER
	         		<input type="checkbox" name="authList[2].auth" value="ROLE_ADMIN"> ROLE_ADMIN
	         	
	         	</td>
	         </tr>
         
         
            <tr>
               <td colspan="3">
               	  <span id="passMessage" style="color:red;"></span>
                  <input type="reset" class="btn btn-warning btn-sm pull-right" value="취소">
                  <input type="submit" class="btn btn-primary btn-sm pull-right" value="등록">
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
  
  <!-- 회원가입 실패시 띄워줄 모달 -->
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
  
  <!-- 회원가입 실패시 띄워줄 모달 -->
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
   
   function registerCheck(){
      
      var memID = $("#memID").val();
      
      $.ajax({
         url :"${contextPath}/registerCheck.do",
         //현 조인폼에서 컨트롤러로 나갈려면 현 위치가 view임으로 ../로 한단계 올라가서 실행을 해야하는데
         //자바스크립트에서는 자바 코드를 쓰지 못하지만 표현식은 웹에서 쓰는 표현식임으로 사용이 가능하다.
         //그럼으로 EL식을 사용하는데 EL은 자바식이 아니다.
         type : "get",
         data : {"memID" : memID},
         //이 안에서만 사용할 간단한 함수는 아래와 같이 직접 써서 입력해줄 수 있음
         success : function(data){
            //중복유무 확인 -> data1 = 사용가능 data0 사용불가능과 같이., 1,0 부분은 바뀔 수 있음
            //모달창으로 띄워줄것임
            if(data==1){
               //선택자를 작성해서 요소를 선택하고 text를 반환v xAE	
               $("#checkMessage").text("사용할 수 있는 아이디입니다.")
               $("#checkType").attr("class", "modal-content panel-success");
            }else{
               $("#checkMessage").text("사용할 수 없는 아이디입니다.")
               $("#checkType").attr("class", "modal-content panel-warning");
            }
            
            $("#myModal").modal("show");
            
         },
         error : function(){alert("error");}
      });
      
   }
   
   //인풋태그에 들어온 값을 체크해야한다.
   function passwordCheck(){
      var memPassword1 = $("#memPassword1").val();
      var memPassword2 = $("#memPassword2").val();
	  
      if(memPassword1 != memPassword2){
    	  $("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
      } else{
    	  $("#memPassword").val(memPassword1);
    	  $("#passMessage").html("");
      }
   }
   
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