<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Arsenal FC - New Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500&display=swap" rel="stylesheet">
    
    <style>
        body {
            background-color: #ffffff;
            font-family: 'Noto Sans KR', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .update-container {
            width: 100%;
            max-width: 400px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
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
            transform: translateY(-2px);
        }

        .form-control:focus {
            border-color: #EF0107;
            box-shadow: 0 0 0 0.25rem rgba(239, 1, 7, 0.1);
        }
    </style>
</head>
<body>

<div class="update-container">
    <div class="brand-logo">NEW PASSWORD</div>
    <p class="instruction">새로운 비밀번호를 설정해 주세요.<br>강력한 비밀번호일수록 안전합니다.</p>

    <form action="/community/updatePw" method="post" onsubmit="return validatePassword()">
        <input type="hidden" name="id" value="${user.id}">

        <div class="mb-3">
            <label for="password" class="form-label font-weight-bold">새 비밀번호</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="8자 이상 입력" required>
        </div>

        <div class="mb-4">
            <label for="passwordCheck" class="form-label font-weight-bold">비밀번호 확인</label>
            <input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 다시 입력" required>
        </div>
        
        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-arsenal">비밀번호 변경 완료</button>
        </div>
    </form>
</div>

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