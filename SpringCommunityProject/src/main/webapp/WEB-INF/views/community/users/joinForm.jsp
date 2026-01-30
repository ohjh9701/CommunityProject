<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arsenal FC - Join Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500;600&display=swap" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: 'Noto Sans KR', sans-serif; display: flex; flex-direction: column; min-height: 100vh; margin: 0; }
        .navbar { background-color: #ffffff; border-bottom: 3px solid #EF0107; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-family: 'Oswald', sans-serif; color: #EF0107 !important; font-size: 1.5rem; letter-spacing: 1px; }
        .nav-link { color: #063672 !important; font-weight: bold; margin-left: 15px; }
        
        .main-content { flex: 1; display: flex; align-items: center; justify-content: center; padding: 80px 0; }
        .join-container { width: 100%; max-width: 500px; padding: 40px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); background-color: #ffffff; position: relative; }
        
        .logo-wrapper { width: 110px; height: 110px; background-color: #fff; border-radius: 50%; margin: -95px auto 20px; display: flex; align-items: center; justify-content: center; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); border: 4px solid #EF0107; overflow: hidden; }
        .logo-wrapper img { width: 85%; height: auto; }

        .brand-logo { font-family: 'Oswald', sans-serif; color: #EF0107; font-size: 2.2rem; text-align: center; margin-bottom: 5px; }
        .btn-arsenal { background-color: #EF0107; color: white; border: none; padding: 12px; font-weight: bold; }
        .btn-cancel { background-color: #063672; color: white; border: none; padding: 12px; font-weight: bold; }
        
        footer { background-color: #111; color: #aaa; padding: 40px 0; font-size: 0.9rem; }
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
    <div class="join-container">
        <div class="logo-wrapper">
            <img src="https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg" alt="Arsenal Logo">
        </div>
        <div class="brand-logo">ARSENAL FAN COMMUNITY</div>
        <p class="text-center text-muted mb-4">Create your account</p>
        
        <form action="/community/join" method="post">
            <div class="mb-3">
                <label class="form-label fw-bold">ID</label>
                <input type="text" name="id" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Nickname</label>
                <input type="text" name="nickName" class="form-control" required>
            </div>
            <div class="mb-4">
                <label class="form-label fw-bold">Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-arsenal">가입하기</button>
                <button type="button" class="btn btn-cancel" onclick="history.back();">돌아가기</button>
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
            <div class="col-md-6 text-md-end">
                <p><b>관리자 :</b> 오지훈</p>
                <p><b>연락처 :</b> 010-8735-4875</p>
                <p><b>이메일 :</b> ohjh4875@gmail.com</p>
            </div>
        </div>
    </div>
</footer>

</body>
</html>