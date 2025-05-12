<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h2 class="mb-4 text-center">📄 게시글 상세보기</h2>

		<div class="card">
			<div class="card-body">
				<p>
					<strong>게시글 번호:</strong> ${board.boardNo}
				</p>
				<p>
					<strong>제목:</strong> ${board.boardTitle}
				</p>

				<h5 class="mt-4">📎 첨부파일</h5>
				<ul class="list-group list-group-flush">
    <c:forEach var="file" items="${fileList}">
        <li class="list-group-item d-flex justify-content-between align-items-center">
            <a href="${pageContext.request.contextPath}/upload/${file.fileName}" 
               download="${file.fileName}" class="text-decoration-none">
                ${file.fileName}
            </a>
            <form method="post" action="${pageContext.request.contextPath}/deleteFile" class="d-inline mb-0">
                <input type="hidden" name="boardFileNo" value="${file.boardFileNo}" />
                <input type="hidden" name="boardNo" value="${board.boardNo}" />
                <button type="submit" class="btn btn-sm btn-outline-danger"
                        onclick="return confirm('이 파일을 삭제하시겠습니까?')">삭제</button>
            </form>
        </li>
    </c:forEach>
</ul>

				<div class="mt-4 d-flex gap-2">
					<form method="get"
						action="${pageContext.request.contextPath}/updateBoard"
						class="d-inline">
						<input type="hidden" name="boardNo" value="${board.boardNo}" />
						<button type="submit" class="btn btn-warning">✏️ 수정</button>
					</form>

					<form method="post"
						action="${pageContext.request.contextPath}/deleteBoard"
						class="d-inline">
						<input type="hidden" name="boardNo" value="${board.boardNo}" />
						<button type="submit" class="btn btn-danger"
							onclick="return confirm('정말 삭제하시겠습니까?')">🗑️ 삭제</button>
					</form>

					<a href="${pageContext.request.contextPath}/"
						class="btn btn-primary">📚 목록</a>
				</div>


			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
