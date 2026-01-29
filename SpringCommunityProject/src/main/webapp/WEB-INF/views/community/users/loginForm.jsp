<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arsenal Fan Community - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500&display=swap" rel="stylesheet">
    
    <style>
        body {
            background-color: #ffffff; /* 요청하신 화이트 배경 */
            font-family: 'Noto Sans KR', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-top: 5px solid #EF0107; /* 아스날 레드 포인트 */
        }

        .brand-logo {
            font-family: 'Oswald', sans-serif;
            color: #EF0107; /* Arsenal Red */
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 10px;
            letter-spacing: 2px;
        }

        .brand-sub {
            text-align: center;
            color: #063672; /* Arsenal Blue */
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
            box-shadow: 0 5px 15px rgba(239, 1, 7, 0.3);
        }

        .form-control:focus {
            border-color: #EF0107;
            box-shadow: 0 0 0 0.25rem rgba(239, 1, 7, 0.1);
        }

        .footer-links {
            text-align: center;
            margin-top: 20px;
            font-size: 0.85rem;
        }

        .footer-links a {
            color: #666;
            text-decoration: none;
            margin: 0 10px;
        }

        .footer-links a:hover {
            color: #EF0107;
        }

        /* 장식 요소: 대포(Canon) 느낌의 라인 */
        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #DBA111, transparent); /* Gold point */
            margin: 20px 0;
        }
    /* ... 기존 스타일 유지 ... */

    .logo-wrapper {
        width: 100px;
        height: 100px;
        background-color: #fff;
        border-radius: 50%;
        margin: -90px auto 20px; /* 박스 위로 절반쯤 걸치게 배치 */
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        border: 3px solid #EF0107; /* 아스날 레드 테두리 */
        overflow: hidden;
    }

    .logo-wrapper img {
        width: 80%; /* 로고가 원 안에 꽉 차지 않고 여백이 있게 */
        height: auto;
    }

    .login-container {
        margin-top: 50px; /* 로고가 위로 튀어나오므로 여백 확보 */
        /* 나머지 기존 속성 유지 */
        width: 100%;
        max-width: 400px;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
    }
    </style>
</head>
<body>

<div class="login-container">
    <div class="brand-logo">ARSENAL FC</div>
    <div class="brand-sub">FAN COMMUNITY</div>
    
    <div class="divider"></div>

    <form action="/community/login" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">ID</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요" required>
        </div>
        <div class="mb-4">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
        </div>
        
        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-arsenal">LOGIN</button>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>