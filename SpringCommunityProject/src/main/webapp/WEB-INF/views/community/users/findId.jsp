<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Arsenal FC - Find ID</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500&display=swap" rel="stylesheet">
    <style>
        body { background-color: #ffffff; font-family: 'Noto Sans KR', sans-serif; display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; }
        .find-container { width: 100%; max-width: 400px; padding: 40px; border-radius: 15px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); border-top: 5px solid #EF0107; }
        .brand-logo { font-family: 'Oswald', sans-serif; color: #EF0107; font-size: 2rem; text-align: center; margin-bottom: 20px; }
        .btn-arsenal { background-color: #EF0107; color: white; border: none; padding: 12px; font-weight: bold; width: 100%; }
        .btn-arsenal:hover { background-color: #DB0007; color: white; }
        .footer-links { text-align: center; margin-top: 20px; font-size: 0.85rem; }
        .footer-links a { color: #666; text-decoration: none; }
    </style>
</head>
<body>
    <div class="find-container">
        <div class="brand-logo">FIND ID</div>
        <p class="text-center text-muted mb-4">가입 시 등록한 이메일을 입력해주세요.</p>
        <form action="/community/findId" method="post">
            <div class="mb-4">
                <label for="email" class="form-label font-weight-bold">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="example@arsenal.com" required>
            </div>
            <button type="submit" class="btn btn-arsenal">아이디 찾기</button>
        </form>
        <div class="footer-links">
            <a href="/community/loginForm">로그인으로 돌아가기</a>
        </div>
    </div>
</body>
</html>