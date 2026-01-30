<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arsenal FC - New Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500;600&display=swap" rel="stylesheet">
    
    <style>
        /* 페이지 전체 레이아웃 */
        body { background-color: #f8f9fa; font-family: 'Noto Sans KR', sans-serif; display: flex; flex-direction: column; min-height: 100vh; margin: 0; }
        
        /* 헤더 스타일 (메인과 동일) */
        .navbar { background-color: #ffffff; border-bottom: 3px solid #EF0107; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-family: 'Oswald', sans-serif; color: #EF0107 !important; font-size: 1.5rem; letter-spacing: 1px; }
        .nav-link { color: #063672 !important; font-weight: bold; margin-left: 15px; }

        /* 중앙 컨텐츠 영역 */
        .main-content { flex: 1; display: flex; align-items: center; justify-content: center; padding: 50px 0; }

        .update-container {
            width: 100%;
            max-width: 400px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            border-top: 5px solid #EF0107;
        }

        .brand-logo {
            font-family: 'Oswald', sans-serif;
            color: #EF0107;
            font-size: 2.2rem;
            text-align: center;
            margin-bottom: 10px;
            letter-spacing: 2px;
        }

        .instruction {
            text-align: center;
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 30px;
        }

        .btn-arsenal {
            background-color: #EF0107;
            color: white;
            border: none;
            padding: 12px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-arsenal:hover {
            background-color: #DB0007;
            color: white;
            transform: translateY(-2px);
        }

        .form-control:focus {
            border-color: #EF0107;
            box-shadow: 0 0 0 0.25rem rgba(239, 1, 7, 0.1);
        }

        /* 푸터 스타일 (메인과 동일) */
        footer { background-color: #111; color: #aaa; padding: 40px 0; font-size: 0.9rem; margin-top: auto; }
        .footer-info b { color: #eee; }
        .footer-logo { font-family: 'Oswald', sans-serif; color: #EF0107; font-size: 1.2rem; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/community/main">ARSENAL FAN COMMUNITY</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="/community/board/list">게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="/community/mypage">마이페이지</a></li>
                <li class="nav-item"><a class="btn btn-outline-danger btn-sm ms-3" href="/community/loginForm">로그인</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="main-content">
    <div class="update-container">
        <div class="brand-logo">NEW PASSWORD</div>
        <p class="instruction">새로운 비밀번호를 설정해 주세요.<br>강력한 비밀번호일수록 안전합니다.</p>

        <form action="/community/updatePw" method="post" onsubmit="return validatePassword()">
            <input type="hidden" name="id" value="${users.id}">
            
            <div class="mb-3">
                <label for="password" class="form-label fw-bold">새 비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="8자 이상 입력" required>
            </div>

            <div class="mb-4">
                <label for="passwordCheck" class="form-label fw-bold">비밀번호 확인</label>
                <input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 다시 입력" required>
            </div>
            
            <div class="d-grid">
                <button type="submit" class="btn btn-arsenal">비밀번호 변경 완료</button>
            </div>
        </form>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="footer-logo">ARSENAL FC FAN COMMUNITY</div>
                <p>North London is Red. Join our community and support the Gunners.</p>
            </div>
            <div class="col-md-6 text-md-end footer-info">
                <p><b>관리자 :</b> 오지훈</p>
                <p><b>연락처 :</b> 010-8735-4875</p>
                <p><b>이메일 :</b> ohjh4875@gmail.com</p>
                <p class="mt-3">&copy; 2026 Arsenal Fan Community.</p>
            </div>
        </div>
    </div>
</footer>

<script>
    function validatePassword() {
        const pw = document.getElementById('password').value;
        const pwCheck = document.getElementById('passwordCheck').value;

        if (pw !== pwCheck) {
            alert("비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
            return false;
        }
        return true;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>