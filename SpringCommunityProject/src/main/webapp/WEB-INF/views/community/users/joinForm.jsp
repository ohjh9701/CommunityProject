<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arsenal Fan Community - Join Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500&display=swap" rel="stylesheet">
    
    <style>
        body {
            background-color: #ffffff;
            font-family: 'Noto Sans KR', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh; /* 가입 폼이 길어질 수 있어 min-height 사용 */
            margin: 0;
            padding: 50px 0; /* 상하 여백 추가 */
        }

        .join-container {
            width: 100%;
            max-width: 500px; /* 로그인보다 조금 더 넓게 설정 */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-top: 5px solid #EF0107;
            background-color: #ffffff;
            position: relative;
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
        }

        .logo-wrapper img {
            width: 110%;
            height: auto;
        }

        .brand-logo {
            font-family: 'Oswald', sans-serif;
            color: #EF0107;
            font-size: 2.2rem;
            text-align: center;
            margin-bottom: 5px;
            letter-spacing: 2px;
        }

        .brand-sub {
            text-align: center;
            color: #063672;
            font-weight: bold;
            margin-bottom: 25px;
            font-size: 0.9rem;
        }

        .form-label {
            font-weight: bold;
            color: #333;
            font-size: 0.9rem;
        }

        /* 아스날 레드 포인트 버튼 */
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

        /* 취소 버튼 (아스날 네이비) */
        .btn-cancel {
            background-color: #063672;
            color: white;
            border: none;
            padding: 12px;
            font-weight: bold;
        }

        .form-control:focus {
            border-color: #EF0107;
            box-shadow: 0 0 0 0.25rem rgba(239, 1, 7, 0.1);
        }

        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #DBA111, transparent);
            margin: 20px 0;
        }
    </style>
</head>
<body>

<div class="join-container">
    <div class="logo-wrapper">
        <img src="https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg" alt="Arsenal Logo">
    </div>

    <div class="brand-logo">Arsenal Fan Community</div>
    <div class="brand-sub">CREATE YOUR ACCOUNT</div>
    
    <div class="divider"></div>

    <form action="/community/join" method="post">
        <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="사용할 아이디를 입력하세요" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
        </div>

        <div class="mb-3">
            <label for="nickName" class="form-label">닉네임</label>
            <input type="text" class="form-control" id="nickName" name="nickName" placeholder="활동할 닉네임을 입력하세요" required>
        </div>

        <div class="mb-4">
            <label for="email" class="form-label">이메일</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="arsenal@example.com" required>
        </div>
        
        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-arsenal">회원가입 완료</button>
            <button type="button" class="btn btn-cancel" onclick="history.back();">취소</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>