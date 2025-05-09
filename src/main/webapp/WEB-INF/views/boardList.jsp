<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 목록</title>
	<!-- Bootstrap CDN 추가 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h1 class="mb-4 text-center">📋 게시판</h1>
		
		<table class="table table-striped table-bordered table-hover">
			<thead class="table-dark">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.boardNo}</td>
						<td>
							<a href="${pageContext.request.contextPath}/boardOne?boardNo=${board.boardNo}" class="text-decoration-none">
								${board.boardTitle}
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="text-end">
			<a href="${pageContext.request.contextPath}/addBoard" class="btn btn-primary">✏️ 등록</a>
		</div>
	</div>

	<!-- Bootstrap JS (선택적) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
