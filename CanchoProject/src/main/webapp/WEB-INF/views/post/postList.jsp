<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>LIST</title>
	</head>
	
	<body>
		<h1>POST LIST</h1>
		
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		
		<!-- 게시글이 존재하지 않는 경우 -->
		<c:if test="${postList == null || postList.size() == 0}">
			<tr>
				<td colspan="4" style="text-align: center;">포스트가 존재하지 않습니다.</td>
			</tr>
		</c:if>

		<!-- 게시글이 하나라도 존재하는 경우 -->
		<c:if test="${postList != null && postList.size() != 0}">	
			<c:forEach items="${postList }" var="post">
				<tr>
					<td>${post.post_num }</td>
					<td><a href="readOnePost?post_num=${post.post_num }">${post.post_title }</a></td>
					<td>${post.user_id }</td>
					<td>${post.post_date }</td>
				</tr>
				<tr>
					<td><div id="read">
					</div></td>
				</tr>
			</c:forEach>
		</c:if>
			</table>
	</body>
</html>