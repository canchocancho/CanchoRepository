<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	
<h1>
	TOMOlog  
</h1>

<p>일단 loginId aaa로 로그인이 되어 있다고 가정한 상태(session 돌고 있음)</p>

	<ul>
		<li><a href="writePost">포스트 쓰기</a></li>
		<li><a href="postList">포스트 목록</a></li>
		<li><a href="user/joinForm">회원가입</a></li>
		<li><a>로그인</a></li>
	</ul>

</body>
</html>
