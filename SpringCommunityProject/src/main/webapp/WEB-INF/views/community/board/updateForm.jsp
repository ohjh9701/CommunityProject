<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Arsenal Community | Edit Dispatch</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500;600&display=swap" rel="stylesheet">
    <style>
        :root { --ars-red: #EF0107; --ars-blue: #063672; }
        body { background-color: #f8f9fa; font-family: 'Noto Sans KR', sans-serif; display: flex; flex-direction: column; min-height: 100vh; }
        
        .navbar { background-color: #ffffff; border-bottom: 3px solid var(--ars-red); box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-family: 'Oswald', sans-serif; color: var(--ars-red) !important; font-size: 1.5rem; }

        .main-content { flex: 1; padding: 60px 0; }
        .update-container { 
            max-width: 900px; 
            margin: 0 auto; 
            background: white; 
            padding: 40px; 
            border-radius: 15px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            border-top: 5px solid var(--ars-blue); /* 수정 페이지는 블루 포인트 */
        }

        .update-header { 
            border-bottom: 2px solid #eee; 
            padding-bottom: 15px; 
            margin-bottom: 30px; 
            font-family: 'Oswald', sans-serif;
            color: var(--ars-blue);
        }

        .form-label { font-weight: bold; color: var(--ars-blue); }
        .form-control:focus { border-color: var(--ars-blue); box-shadow: 0 0 0 0.25rem rgba(6, 54, 114, 0.1); }
        
        .readonly-field { background-color: #f1f1f1 !important; font-weight: bold; color: #777; }

        .btn-update { background-color: var(--ars-red); color: white; font-weight: bold; padding: 12px 35px; border: none; }
        .btn-update:hover { background-color: #DB0007; color: white; }
        .btn-cancel { background-color: var(--ars-blue); color: white; padding: 12px 35px; text-decoration: none; border-radius: 5px; font-weight: bold; }
        .btn-cancel:hover { background-color: #04244d; color: white; }

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
        <div class="update-container">
            <h2 class="update-header">게시글 수정</h2>
            
            <form action="/community/board/update" method="post">
                <input type="hidden" name="no" value="${board.no}">

                <div class="row">
                    <div class="col-md-6 mb-4">
                        <label class="form-label">작성자ID</label>
                        <input type="text" class="form-control readonly-field" value="${board.user.id}" readonly>
                    </div>
                    <div class="col-md-6 mb-4">
                        <label class="form-label">작성자</label>
                        <input type="text" class="form-control readonly-field" value="${board.user.nickName}" readonly>
                    </div>
                </div>

                <div class="mb-4">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" id="title" name="title" class="form-control" value="${board.title}" required>
                </div>

                <div class="mb-4">
                    <label for="content" class="form-label">내용</label>
                    <textarea id="content" name="content" class="form-control" rows="12" required>${board.content}</textarea>
                </div>

                <div class="text-center mt-5">
                    <a href="javascript:history.back();" class="btn btn-cancel rounded-pill">수정취소</a>
                    <button type="submit" class="btn btn-update rounded-pill me-2">게시글 수정</button>
                </div>
            </form>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <h5 class="fw-bold text-white m-0">ARSENAL FC FAN COMMUNITY</h5>
                <p class="m-0 small">North London is Red. Victory Through Harmony.</p>
            </div>
            <div class="col-md-6 text-md-end footer-info">
                <p class="m-0 small">관리자: 오지훈 | 010-8735-4875</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>