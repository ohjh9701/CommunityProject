<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Arsenal Fan Community</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Noto Sans KR', sans-serif; background-color: #f8f9fa; }
        
        /* 헤더 스타일 */
        .navbar { background-color: #ffffff; border-bottom: 3px solid #EF0107; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-family: 'Oswald', sans-serif; color: #EF0107 !important; font-size: 1.5rem; letter-spacing: 1px; }
        .nav-link { color: #151515 !important; font-weight: bold; margin-left: 15px; }
        .nav-link:hover { color: #EF0107 !important; }

        /* 섹션 1: 배너 영역 */
        .main-banner {
            width: 100%;
            height: 350px;
            background-color: #333;
            background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), 
                              url('https://images.unsplash.com/photo-1599423423912-299f27a683a3?q=80&w=2070&auto=format&fit=crop'); /* 임시 에미레이츠 스타디움 이미지 */
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        .banner-text h1 { font-family: 'Oswald', sans-serif; font-size: 3.5rem; text-shadow: 2px 2px 10px rgba(0,0,0,0.7); }

        /* 섹션 2: 게시판 리스트 영역 */
        .board-section { padding: 60px 0; min-height: 400px; }
        .section-title { font-family: 'Oswald', sans-serif; border-left: 5px solid #EF0107; padding-left: 15px; margin-bottom: 30px; color: #063672; }
        .table { background: white; border-radius: 10px; overflow: hidden; box-shadow: 0 5px 15px rgba(0,0,0,0.05); }
        .table thead { background-color: #063672; color: white; }

        /* 푸터 스타일 */
        footer { background-color: #111; color: #aaa; padding: 40px 0; margin-top: 50px; font-size: 0.9rem; }
        .footer-info b { color: #eee; }
        .footer-logo { font-family: 'Oswald', sans-serif; color: #EF0107; font-size: 1.2rem; margin-bottom: 10px; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="/community/main">ARSENAL FAN COMMUNITY</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="/community/board/list">게시판</a></li>
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

<section class="main-banner">
    <div class="banner-text">
        <h1>VICTORIA CONCORDIA CRESCIT</h1>
        <p>Victory Through Harmony - Official Fan Community</p>
    </div>
</section>

<section class="container board-section">
    <h3 class="section-title">RECENT DISCUSSIONS</h3>
    <table class="table table-hover mt-3">
        <thead>
            <tr>
                <th style="width: 10%">No</th>
                <th style="width: 50%">Title</th>
                <th style="width: 20%">Writer</th>
                <th style="width: 20%">Date</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <%-- 1. 게시글 리스트가 비어있지 않은 경우 --%>
                <c:when test="${not empty boardList}">
                    <c:forEach var="board" items="${boardList}">
                        <tr>
                            <td>${board.no}</td>
                            <td>
                                <a href="/community/board/read?no=${board.no}" class="text-decoration-none text-dark">
                                    <c:out value="${board.title}" />
                                </a>
                            </td>
                            <td>${board.writer}</td>
                            <td>${board.regDate}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                
                <%-- 2. 게시글 리스트가 비어있는 경우 --%>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="text-center py-5 text-muted">
                            <i class="bi bi-info-circle d-block mb-2" style="font-size: 2rem;"></i>
                            게시판 정보가 없습니다. 첫 번째 글을 남겨보세요!
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    
    <div class="text-end">
        <%-- 로그인한 유저만 글쓰기 버튼이 보이도록 설정할 수도 있습니다 --%>
        <c:if test="${not empty loginUser}">
            <a href="/community/board/insertForm" class="btn btn-danger btn-sm me-2">글쓰기</a>
        </c:if>
        <a href="/community/board/list" class="btn btn-outline-dark btn-sm">전체 보기</a>
    </div>
</section>

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