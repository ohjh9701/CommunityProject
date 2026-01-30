<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arsenal Fan Community - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500;600&display=swap" rel="stylesheet">
    
    <style>
        /* 메인 페이지와 통일된 기본 스타일 */
        body {
            background-color: #f8f9fa;
            font-family: 'Noto Sans KR', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        /* 헤더 스타일 (메인과 동일) */
        .navbar { background-color: #ffffff; border-bottom: 3px solid #EF0107; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-family: 'Oswald', sans-serif; color: #EF0107 !important; font-size: 1.5rem; letter-spacing: 1px; }
        .nav-link { color: #063672 !important; font-weight: bold; margin-left: 15px; }
        .nav-link:hover { color: #EF0107 !important; }

        /* 중앙 로그인 컨텐츠 */
        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px 0;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            position: relative;
            margin-top: 50px; /* 로고 공간 확보 */
        }

        .logo-wrapper {
            width: 110px;
            height: 110px;
            background-color: #fff;
            border-radius: 50%;
            margin: -95px auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border: 4px solid #EF0107;
            overflow: hidden;
            z-index: 10;
        }

        .logo-wrapper img { width: 85%; height: auto; }

        .brand-logo {
            font-family: 'Oswald', sans-serif;
            color: #EF0107;
            font-size: 2.2rem;
            text-align: center;
            margin-bottom: 10px;
            letter-spacing: 2px;
        }

        .brand-sub {
            text-align: center;
            color: #063672;
            font-weight: bold;
            margin-bottom: 30px;
            font-size: 0.9rem;
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

        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #DBA111, transparent);
            margin: 20px 0;
        }

        .footer-links { text-align: center; margin-top: 20px; font-size: 0.85rem; }
        .footer-links a { color: #666; text-decoration: none; margin: 0 10px; }
        .footer-links a:hover { color: #EF0107; }

        /* 푸터 스타일 (메인과 동일) */
        footer { background-color: #111; color: #aaa; padding: 40px 0; font-size: 0.9rem; }
        .footer-info b { color: #eee; }
        .footer-logo { font-family: 'Oswald', sans-serif; color: #EF0107; font-size: 1.2rem; margin-bottom: 10px; }
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
    <div class="login-container">
        <div class="logo-wrapper">
            <img src="https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg" alt="Arsenal Logo">
        </div>

        <div class="brand-logo">LOGIN</div>
        <div class="brand-sub">ARSENAL FAN COMMUNITY</div>
        
        <div class="divider"></div>

        <form action="/community/login" method="post">
            <div class="mb-3">
                <label for="id" class="form-label fw-bold">ID</label>
                <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required>
            </div>
            <div class="mb-4">
                <label for="password" class="form-label fw-bold">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>
            
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-arsenal">로그인</button>
            </div>
        </form>

        <div class="footer-links">
            <a href="/community/findIdForm">아이디 찾기</a>
            <span>|</span>
            <a href="/community/findPwForm">비밀번호 찾기</a>
            <span>|</span>
            <a href="/community/joinForm">회원가입</a>
        </div>
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
                <p class="mt-3">&copy; 2026 Arsenal Fan Community. All rights reserved.</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>