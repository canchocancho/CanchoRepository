<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>TOMOlog</title>
	</head>
	<body>
		
	<h1>
		TOMOlog  
	</h1>
	
		<ul>
		<c:choose>
			<c:when test="${sessionScope.loginId == null }">
				<li><a href="user/joinForm">회원가입</a></li>
				<li><a href="user/loginPage">로그인</a></li>
				<li><a href="post/postList">포스트 목록</a></li>
			</c:when>
			<c:otherwise>
				<h3>${sessionScope.loginName }님 환영합니다. </h3>
				<li><a href="user/update?loginId=${sessionScope.loginId }" class="a1">내 정보 수정</a></li>
				<li><a href="post/writePost">포스트 쓰기</a></li>
				<li><a href="post/writePost2">포스트 쓰기2</a></li>
				<li><a href="post/postList">포스트 목록</a></li>		
				<li><a href="user/logout">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
		</ul>
	
	</body>
</html>
