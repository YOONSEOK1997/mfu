<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 등록</title>
</head>
<body>
	<h1>게시글 작성</h1>
	<form id="addForm" action="${pageContext.request.contextPath}/addBoard" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="boardTitle" id="boardTitle" /></td>
			</tr>
			<tr>
				<td>파일</td>
				<td>
					<div>
						<button id="appendFile" type="button">파일 추가</button>
					</div>
					<div id="fileDiv">
						<input type="file" name="boardFile" class="boardfile" />
					</div>
				</td>
			</tr>
		</table>
		<button id="addBtn" type="button">등록</button>
	</form>

	<script>
		document.querySelector('#appendFile').addEventListener('click', () => {
			let flag = false;
			document.querySelectorAll('.boardfile').forEach(e => {
				if (e.value === '') {
					alert('비어 있는 파일 입력칸이 있습니다.');
					flag = true;
					return;
				}
			});
			if (flag) return;

			const inputFile = document.createElement('input');
			inputFile.type = 'file';
			inputFile.name = 'boardFile'; 
			inputFile.className = 'boardfile';
			document.querySelector('#fileDiv').appendChild(inputFile);
		});

		document.querySelector('#addBtn').addEventListener('click', () => {
			const title = document.querySelector('#boardTitle').value.trim();
			if (title === '') {
				alert('제목을 입력하세요');
				return;
			}
			document.querySelectorAll('.boardfile').forEach(e => {
				if (e.value === '') e.remove();
			});
			document.querySelector('#addForm').submit();
		});
	</script>
</body>
</html>
