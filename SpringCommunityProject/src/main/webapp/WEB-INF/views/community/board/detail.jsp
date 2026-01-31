<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Arsenal Community | ${board.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500;600&display=swap" rel="stylesheet">
    <style>
        :root { --ars-red: #EF0107; --ars-blue: #063672; --ars-gold: #C69C6D; }
        body { background-color: #f4f4f4; font-family: 'Noto Sans KR', sans-serif; display: flex; flex-direction: column; min-height: 100vh; }
        
        .navbar { background-color: #fff; border-bottom: 3px solid var(--ars-red); box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-family: 'Oswald', sans-serif; color: var(--ars-red) !important; font-size: 1.5rem; }

        .main-content { flex: 1; padding: 50px 0; }
        .detail-card { background: white; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); overflow: hidden; }
        
        /* 헤더 섹션 */
        .detail-header { background: #1a1a1a; color: white; padding: 40px; border-bottom: 5px solid var(--ars-red); }
        .post-info { display: flex; gap: 20px; font-size: 0.9rem; color: #aaa; margin-top: 15px; }
        .post-info b { color: var(--ars-gold); }
        
        /* 본문 섹션 */
        .detail-body { padding: 50px 40px; min-height: 300px; line-height: 1.8; font-size: 1.1rem; color: #333; }
        .content-text { white-space: pre-wrap; } /* 줄바꿈 유지 */

        /* 추천/비추천 버튼 섹션 */
        .point-section { text-align: center; padding: 30px; background: #f9f9f9; border-top: 1px solid #eee; }
        .btn-point { width: 100px; padding: 10px; font-weight: bold; transition: 0.3s; }
        
        /* 하단 푸터/버튼 영역 */
        .detail-footer { padding: 20px 40px; background: #eee; display: flex; justify-content: space-between; align-items: center; }
        .btn-arsenal { background-color: var(--ars-red); color: white; border: none; font-weight: bold; }
        .btn-arsenal:hover { background-color: #DB0007; color: white; }

        footer { background-color: #111; color: #aaa; padding: 30px 0; margin-top: auto; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/community/main">ARSENAL FAN COMMUNITY</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active fw-bold" href="/community/board/list">게시판</a></li>
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
        <div class="detail-card">
            <div class="detail-header">
                <h1 class="fw-bold">${board.title}(${board.user.id})</h1>
                <div class="post-info">
                    <span>작성자: <b>${board.user.nickName}</b></span>
                    <span>작성일: <b><fmt:formatDate value="${board.regDate}" pattern="yyyy.MM.dd HH:mm"/></b></span>
                    <span>NO: <b>${board.no}</b></span>
                </div>
            </div>

            <div class="detail-body">
                <div class="content-text">${board.content}</div>
            </div>

            <div class="point-section">
                <div class="d-flex justify-content-center gap-3">
                    <button class="btn btn-outline-danger btn-point">
                        👍 좋아요<br>${board.goodPoint}
                    </button>
                    <button class="btn btn-outline-secondary btn-point">
                        👎 싫어요<br>${board.badPoint}
                    </button>
                </div>
            </div>

            <div class="detail-footer">
                <a href="/community/board/list" class="btn btn-dark px-4">목록으로</a>
                
                <div class="d-flex gap-2">
                    <%-- 본인이 쓴 글일 때만 수정/삭제 버튼 노출 (세션의 loginUser.id와 비교) --%>
                    <c:if test="${loginUser.id eq board.user.id}">
                        <a href="/community/board/updateForm?no=${board.no}" class="btn btn-danger fw-bold">수정</a>
                        <a href="/community/board/delete?no=${board.no}" class="btn btn-danger fw-bold" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<footer>
    <div class="container text-center text-md-start">
        <div class="row">
            <div class="col-md-6">
                <h5 class="fw-bold text-white">ARSENAL FC FAN COMMUNITY</h5>
                <p class="m-0">North London is Red. Victory Through Harmony.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <p class="m-0">관리자: 오지훈 | 010-8735-4875</p>
                <p class="m-0">© 2026 Arsenal Fan Community.</p>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>