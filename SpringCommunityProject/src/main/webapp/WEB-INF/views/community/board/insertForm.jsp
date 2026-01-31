<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Arsenal Community | Write Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500;600&display=swap" rel="stylesheet">
    <style>
        :root { --ars-red: #EF0107; --ars-blue: #063672; }
        body { background-color: #f8f9fa; font-family: 'Noto Sans KR', sans-serif; display: flex; flex-direction: column; min-height: 100vh; margin: 0; }
        
        .navbar { background-color: #ffffff; border-bottom: 3px solid var(--ars-red); box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-family: 'Oswald', sans-serif; color: var(--ars-red) !important; font-size: 1.5rem; }

        .main-content { flex: 1; padding: 60px 0; }
        .write-container { 
            max-width: 900px; 
            margin: 0 auto; 
            background: white; 
            padding: 40px; 
            border-radius: 15px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        .write-header { 
            border-bottom: 2px solid var(--ars-red); 
            padding-bottom: 15px; 
            margin-bottom: 30px; 
            font-family: 'Oswald', sans-serif;
            color: var(--ars-blue);
        }

        .form-label { font-weight: bold; color: var(--ars-blue); }
        .form-control:focus { border-color: var(--ars-red); box-shadow: 0 0 0 0.25rem rgba(239, 1, 7, 0.1); }
        
        /* 작성자 필드는 수정 불가 느낌 강조 */
        .readonly-field { background-color: #f1f1f1 !important; font-weight: bold; color: #555; }

        .btn-arsenal { background-color: var(--ars-red); color: white; font-weight: bold; padding: 10px 30px; border: none; }
        .btn-arsenal:hover { background-color: #DB0007; color: white; transform: translateY(-2px); }
        .btn-cancel { background-color: #6c757d; color: white; padding: 10px 30px; text-decoration: none; border-radius: 5px; font-weight: bold; }

        footer { background-color: #111; color: #aaa; padding: 30px 0; margin-top: auto; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/community/main">ARSENAL FAN COMMUNITY</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link fw-bold" href="/community/board/list">게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="/community/mypage">마이페이지</a></li>
                <c:choose>
                    <c:when test="${empty loginUser}">
                        <li class="nav-item"><a class="btn btn-outline-danger ms-3" href="/community/loginForm">로그인</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item px-3 text-muted"><b>${loginUser.nickName}</b>님 환영합니다</li>
                        <li class="nav-item"><a class="btn btn-danger btn-sm" href="/community/logout">로그아웃</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="main-content">
    <div class="container">
        <div class="write-container">
            <h2 class="write-header">NEW DISPATCH</h2>
            
            <form action="/community/board/insert" method="post">
                <div class="mb-4">
                    <label for="usersId" class="form-label">ID</label>
                    <input type="text" id="usersId" name="usersId" class="form-control readonly-field" value="${loginUser.id}" readonly>
                </div>

                <div class="mb-4">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력하세요 (최대 50자)" required>
                </div>

                <div class="mb-4">
                    <label for="content" class="form-label">내용</label>
                    <textarea id="content" name="content" class="form-control" rows="12" placeholder="자유로운 의견을 남겨주세요..." required></textarea>
                </div>

                <div class="text-center mt-5">
                    <button type="submit" class="btn btn-arsenal rounded-pill me-2">글쓰기</button>
                    <a href="/community/board/list" class="btn btn-cancel rounded-pill">취소</a>
                </div>
            </form>
        </div>
    </div>
</div>

<footer>
    <div class="container text-center text-md-start">
        <div class="row">
            <div class="col-md-6">
                <h5 class="fw-bold text-white">ARSENAL FC FAN COMMUNITY</h5>
                <p class="m-0">North London is Red. Victory Through Harmony.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <p class="m-0">관리자: 오지훈 | 010-8735-4875</p>
                <p class="m-0">© 2026 Arsenal Fan Community.</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>