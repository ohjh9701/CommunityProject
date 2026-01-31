<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                              url('/images/banner.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        .banner-text h1 { font-family: 'Oswald', sans-serif; font-size: 3.5rem; text-shadow: 2px 2px 10px #EF0107; }

        /* 섹션 2: 게시판 리스트 영역 */
        .board-section { padding: 60px 0; min-height: 400px; }
        .section-title { font-family: 'Oswald', sans-serif; border-left: 5px solid #EF0107; padding-left: 15px; margin-bottom: 30px; color: #EF0107; }
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
        <h1>We Are Winner!</h1>
        <p>ARSENAL - Official Fan Community</p>
    </div>
</section>

<section class="container board-section">
    <h3 class="section-title">RECENT DISCUSSIONS</h3>
    <table class="table table-hover mt-3">
        <thead>
            <tr>
                <th style="width: 10%">No</th>
                <th style="width: 50%">제목</th>
                <th style="width: 15%">작성자</th>
                <th style="width: 15%">작성일</th>
                <th style="width: 10%">좋아요</th> <%-- 추천수 추가 --%>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <%-- 1. 게시글 리스트가 비어있지 않은 경우 --%>
                <c:when test="${not empty boardList}">
                    <c:forEach var="board" items="${boardList}" end="9">
                        <tr>
                            <td>${board.no}</td>
                            <td class="text-start"> <%-- 제목은 왼쪽 정렬 --%>
                                <a href="/community/board/detail?no=${board.no}" class="text-decoration-none text-dark fw-bold">
                                    <c:out value="${board.title}" />
                                </a>
                            </td>
                            <%-- [중요] writer 대신 도메인 필드명인 usersId 사용 --%>
                            <td>${board.user.nickName}</td>
                            <%-- 날짜 포맷팅 적용 --%>
                            <td>
                                <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/>
                            </td>
                            <%-- 추천수 표시 --%>
                            <td><span class="text-danger">${board.goodPoint}</span></td>
                        </tr>
                    </c:forEach>
                </c:when>
                
                <%-- 2. 게시글 리스트가 비어있는 경우 --%>
                <c:otherwise>
                    <tr>
                        <td colspan="5" class="text-center py-5 text-muted">
                            게시판 정보가 없습니다. 첫 번째 글을 남겨보세요!
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    
    <div class="text-end mt-3">
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