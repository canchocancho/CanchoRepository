<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>LOGIN</title>
		<script type="text/javascript">

			<c:if test="${errorMsg !=null }">
	   		alert('${errorMsg }');
	 	  	</c:if>
		
			function formCheck(){
				var id = document.getElementById('user_id');
				var password = document.getElementById('user_password');
				
				if (id.value == "") {
					alert("아이디를 입력해주세요");
					return false;
				} else if (password.value == ""){
					alert("비밀번호를 입력해주세요");
					return false;
				}
			}
		</script>
	</head>
	
	<body>
		<h1>LOGIN</h1>
		<form action="login" method="post" onsubmit="return formCheck();">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="user_id" id="user_id" value="${user_id }" autocomplete="off"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="user_password" id="user_password" autocomplete="off"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="login"></td>
				</tr>
			</table>
		</form>
	</body>
</html>