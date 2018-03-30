<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.2.1.js" />"></script>
<title>[ 회원 가입 폼 ]</title>
<link href="resources/css/joinForm.css" type="text/css" rel="stylesheet">
<script type="text/javascript">

	<c:if test ="${errorMsg != null}">
		alert("${errorMsg}")
	</c:if>
	
	$(function(){
		
		//ID중복체크
		$('#btn1').on('click', function(){
			
			var id = $('#user_id').val();
			
			$.ajax({
				url : "idCheck",
				type : "get",
				data : {
					id : id
				},
				success : function(obj){
					if(obj){
						var str = '<p>'+id+": 사용할 수 있는 ID 입니다."+'</p>';
						$('#idCheckResult').html(str);
					}else{
						var str = '<p>'+id+": 사용할 수 없는 ID 입니다."+'</p>';
						$('#idCheckResult').html(str);
					}
				},
				error : function(err){
					console.log(err);
				}
			});
		});
		
		//이메일 인증
		$('#btn2').on('click', function(){
			
		});
		
		//유효성 검사
		$('#f1').on('submit',function(){
			var id = $('#user_id').val();
			var password = $('#user_password').val();
			var password2 = $('#password2').val();
			var name =  $('#user_name').val();
			var email = $('#user_email').val();
			
			
			if (id.length == 0) {
				alert("ID를 입력하세요");
				return;
			} else if (password.length == 0) {
				alert("비밀번호를 입력하세요");
				return;
			} else if (password2.length == 0) {
				alert("비밀번호를 입력하세요");
				return;
			} else if (password != password2) {
				alert("동일한 비밀번호를 입력하세요");
				password = "";
				password2 = "";
				return;
			} else if (name.length == 0) {
				alert("이름을 입력하세요");
				return;
			} else if (email.length == 0) {
				alert("이메일을 입력하세요");
				return;
			}
			
		});
		
	
	});
	


</script>
</head>
<body>
	<form action="join" method="post" id="f1">
		<table>
			<tr>
				<td colspan="2" align="center"><h1>[ 회원 가입 ]</h1></td>
			</tr>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" id="user_id" name="user_id" value="${user.user_id }"
					 placeholder="id중복확인 사용"> 
					<!-- name은 vo의 변수명과 같아야한다. -->
					<input type="button" value="id중복확인" id="btn1">
					<div id="idCheckResult">
						<!-- 아이디 중복확인 결과 나타내기 -->
						
					</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="user_password" id="user_password" 
					value="${user.user_password}" placeholder="비밀번호 입력"><br>
					<input type="password" id="password2" placeholder="비밀번호 다시 입력">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="user_name" id="user_name" value="${user.user_name }"
					placeholder="이름 입력">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="user_email" id="user_email" value="${user.user_email }"
					placeholder="이메일 입력">
					<input type="button" value="이메일 인증" id="btn2">
					<div id="emailCheckResult">
						<!-- 아이디 중복확인 결과 나타내기 -->
						
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="가입">  <input type="reset" value="다시 쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>