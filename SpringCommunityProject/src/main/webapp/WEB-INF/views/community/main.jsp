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
                              url('/images/banner2.jpg');
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
    /* 위젯 내부의 폰트나 여백이 우리 사이트와 잘 어울리도록 감싸는 컨테이너 */
    .match-widget-wrapper {
        border: 1px solid #eee;
        min-height: 400px; /* 로딩 전 영역 확보 */
    }
    .match-link-banner {
        width: 100%;
        height: 250px;
        background-image: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
                          url('/images/banner.jpg'); /* 아까 추가한 배너 이미지 재활용 */
        background-size: cover;
        background-position: center;
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        text-align: center;
        transition: transform 0.3s ease;
        cursor: pointer;
    }
    
    .match-link-banner:hover {
        transform: scale(1.01); /* 마우스 올리면 살짝 커지는 효과 */
    }

    .btn-ars-outline {
        border: 2px solid white;
        color: white;
        font-weight: bold;
        padding: 10px 30px;
        border-radius: 50px;
        transition: 0.3s;
    }

    .btn-ars-outline:hover {
        background-color: #EF0107;
        color: var(--ars-red);
    }
    .quick-card-link { text-decoration: none !important; color: inherit; }
    
    .quick-card {
        background: white;
        padding: 40px 20px;
        border-radius: 20px;
        text-align: center;
        box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        transition: all 0.3s ease;
        border: 1px solid #eee;
        height: 100%;
    }

    .quick-card .card-icon {
        font-size: 2.5rem;
        margin-bottom: 15px;
    }

    .quick-card h3 {
        font-family: 'Oswald', sans-serif;
        font-weight: bold;
        color: #1a1a1a;
        margin-bottom: 10px;
    }

    .quick-card p {
        color: #777;
        font-size: 0.95rem;
        margin-bottom: 0;
    }

    /* 마우스 호버 효과 */
    .quick-card:hover {
        transform: translateY(-10px);
        border-color: #EF0107;
        background-color: #fffafb;
    }

    .quick-card:hover h3 {
        color: #EF0107;
    }
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
	
<section class="container mb-5">
    <div class="match-link-banner">
        <div class="banner-content">
            <h2 class="fw-bold mb-2">NEXT MATCH & FIXTURES</h2>
            <p class="mb-4 opacity-75">아스날의 실시간 경기 일정과 결과를 공식 홈페이지에서 확인하세요.</p>
            <a href="https://www.arsenal.com/fixtures" target="_blank" class="btn btn-ars-outline">
                GO TO OFFICIAL FIXTURES
            </a>
        </div>
    </div>
</section>

<section class="container my-5">
    <div class="row g-4">
        <div class="col-md-4">
            <a href="https://www.arsenal.com/men/players" target="_blank" class="quick-card-link">
                <div class="quick-card">
                    <div class="card-icon">🏃‍♂️</div>
                    <h3>SQUAD</h3>
                    <p>1군 선수단 프로필 및 스탯 확인</p>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="https://www.arsenal.com/history" target="_blank" class="quick-card-link">
                <div class="quick-card history-card">
                    <div class="card-icon">🏆</div>
                    <h3>HISTORY</h3>
                    <p>1886년부터 이어진 불패신화의 역사</p>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="https://www.arsenal.com/fans" target="_blank" class="quick-card-link">
                <div class="quick-card">
                    <div class="card-icon">📢</div>
                    <h3>SUPPORTERS</h3>
                    <p>전 세계 구너들과 함께하는 커뮤니티</p>
                </div>
            </a>
        </div>
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