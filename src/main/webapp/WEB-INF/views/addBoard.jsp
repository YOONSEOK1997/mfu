<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0">게시글 작성</h4>
            </div>
            <div class="card-body">
                <form id="addForm" action="${pageContext.request.contextPath}/addBoard" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="boardTitle" class="form-label">제목</label>
                        <input type="text" class="form-control" name="boardTitle" id="boardTitle" placeholder="제목을 입력하세요">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">파일 첨부</label>
                        <div class="d-flex gap-2 mb-2">
                            <button id="appendFile" type="button" class="btn btn-outline-secondary btn-sm">파일 추가</button>
                        </div>
                        <div id="fileDiv">
                            <input type="file" name="boardFile" class="form-control mb-2 boardfile" />
                        </div>
                    </div>
                    <button id="addBtn" type="button" class="btn btn-success">등록</button>
                </form>
            </div>
        </div>
    </div>

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
            inputFile.className = 'form-control mb-2 boardfile';
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
