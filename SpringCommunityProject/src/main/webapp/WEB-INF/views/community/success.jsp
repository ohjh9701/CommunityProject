<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Welcome to Arsenal!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f4f4; height: 100vh; display: flex; align-items: center; justify-content: center; font-family: 'Noto Sans KR', sans-serif; }
        .result-card { background: white; padding: 50px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); text-align: center; border-bottom: 8px solid #EF0107; }
        .icon { font-size: 4rem; color: #EF0107; margin-bottom: 20px; }
        .welcome-msg { font-size: 1.5rem; font-weight: bold; color: #333; margin-bottom: 30px; }
        .btn-go { background-color: #063672; color: white; border: none; padding: 10px 30px; border-radius: 5px; text-decoration: none; font-weight: bold; }
        .btn-go:hover { background-color: #EF0107; color: white; }
        .btn-login { background-color: #063672; color: white; border: none; padding: 10px 30px; border-radius: 5px; text-decoration: none; font-weight: bold; }
        .btn-login:hover { background-color: #EF0107; color: white; }
    </style>
</head>
<body>
    <div class="result-card">
        <div class="icon">⚽</div>
        <div class="welcome-msg">
            ${message}
        </div>
        <p class="text-muted">ARSENAL FAN COMMUNITY에 오신 것을 환영합니다!</p>
        <br>
        <a href="/community/main" class="btn-go">메인 페이지로 이동</a>
        <a href="/community/loginForm" class="btn-login">로그인 페이지로 이동</a>
    </div>
</body>
</html>