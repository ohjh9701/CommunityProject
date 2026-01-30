<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Login Failed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f4f4; height: 100vh; display: flex; align-items: center; justify-content: center; font-family: 'Noto Sans KR', sans-serif; }
        .result-card { background: white; padding: 50px; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.1); text-align: center; border-top: 8px solid #666; }
        .icon { font-size: 4rem; color: #666; margin-bottom: 20px; }
        .error-msg { font-size: 1.5rem; font-weight: bold; color: #d9534f; margin-bottom: 30px; }
        .btn-retry { background-color: #EF0107; color: white; border: none; padding: 10px 30px; border-radius: 5px; text-decoration: none; font-weight: bold; }
        .btn-retry:hover { background-color: #DB0007; color: white; }
    </style>
</head>
<body>
    <div class="result-card">
        <div class="icon">⚠️</div>
        <div class="error-msg">
            ${message}
        </div>
        <p class="text-muted">아이디 또는 비밀번호가 올바르지 않습니다.</p>
        <br>
        <a href="/community/main" class="btn-retry">돌아가기</a>
    </div>
</body>
</html>