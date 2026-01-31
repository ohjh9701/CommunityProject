<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Arsenal Community | Board List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500;600&display=swap"
	rel="stylesheet">
<style>
:root {
	--ars-red: #EF0107;
	--ars-blue: #063672;
}

body {
	background-color: #f4f4f4;
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

/* 헤더/푸터 동일 유지 */
.navbar {
	background-color: #fff;
	border-bottom: 3px solid var(--ars-red);
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.navbar-brand {
	font-family: 'Oswald', sans-serif;
	color: var(--ars-red) !important;
	font-size: 1.5rem;
}

.main-content {
	flex: 1;
	padding: 40px 0;
}

.board-container {
	background: white;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
}

/* [수정] 중앙 상단 검색 영역 */
.top-search-area {
	max-width: 600px;
	margin: 0 auto 40px auto;
	background: #fff;
	padding: 10px;
	border-radius: 50px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	border: 2px solid var(--ars-red);
}

.top-search-area .form-control, .top-search-area .form-select {
	border: none;
	background: transparent;
}

.top-search-area .form-control:focus {
	box-shadow: none;
}

/* 테이블 스타일 */
.table thead {
	background-color: #fcfcfc;
	border-bottom: 2px solid var(--ars-red);
}

.table th {
	color: var(--ars-blue);
	font-weight: 700;
}

.table td {
	vertical-align: middle;
}

.title-cell {
	text-align: left !important;
}

/* [추가] 페이징 스타일 */
.pagination .page-link {
	color: var(--ars-blue);
	border: 1px solid #dee2e6;
}

.pagination .page-item.active .page-link {
	background-color: var(--ars-red);
	border-color: var(--ars-red);
	color: white;
}

.pagination .page-link:hover {
	background-color: #f8f9fa;
	color: var(--ars-red);
}

.btn-arsenal {
	background-color: var(--ars-red);
	color: white;
	border: none;
	font-weight: bold;
	border-radius: 5px;
}

.btn-arsenal:hover {
	background-color: #DB0007;
	color: white;
}
/* 댓글 개수 스타일 */
.reply-count {
    font-size: 0.85rem;      /* 제목보다 살짝 작게 */
    color: #adb5bd;          /* 연한 회색 (Bootstrap의 text-muted와 유사) */
    font-weight: normal;     /* 제목이 bold라도 댓글 수는 가볍게 */
    margin-left: 5px;        /* 제목과 적당한 거리 유지 */
    vertical-align: middle;  /* 텍스트 높이 맞춤 */
}

/* 마우스를 올렸을 때(Hover)의 변화 */
a:hover .reply-count {
    color: #EF0107;          /* 제목에 마우스 올리면 댓글 수도 아스날 레드로! */
    transition: color 0.3s;
}

footer {
	background-color: #111;
	color: #aaa;
	padding: 30px 0;
	margin-top: auto;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg sticky-top">
		<div class="container">
			<a class="navbar-brand" href="/community/main">ARSENAL FAN
				COMMUNITY</a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active fw-bold"
						href="/community/board/list">게시판</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/community/mypage">마이페이지</a></li>
					<c:choose>
						<c:when test="${empty loginUser}">
							<li class="nav-item"><a class="btn btn-outline-danger ms-3"
								href="/community/loginForm">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item px-3 text-muted"><b>${loginUser.nickName}</b>님
								환영합니다</li>
							<li class="nav-item"><a class="btn btn-danger btn-sm"
								href="/community/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>

	<div class="main-content">
		<div class="container">

			<div class="top-search-area">
				<form action="/community/board/search" method="get"
					class="d-flex align-items-center px-3">
					<select name="searchType" class="form-select fw-bold"
						style="width: 130px;">
						<option value="title"
							${board.searchType == 'title' ? 'selected' : ''}>제목</option>
						<option value="content"
							${board.searchType == 'content' ? 'selected' : ''}>내용</option>
						<option value="nickName"
							${board.searchType == 'nickName' ? 'selected' : ''}>작성자</option>
					</select>
					<div
						style="width: 2px; height: 25px; background: #eee; margin: 0 10px;"></div>
					<input type="text" name="keyword" class="form-control"
						placeholder="구너들의 소식을 검색하세요..." value="${board.keyword}">
					<button type="submit" class="btn btn-arsenal px-4 rounded-pill">Search</button>
				</form>
			</div>

			<div class="board-container">
				<div class="d-flex justify-content-between align-items-end mb-3">
					<h3 class="fw-bold m-0"
						style="color: var(--ars-blue); border-left: 5px solid var(--ars-red); padding-left: 15px;">GUNNERS
						BOARD</h3>
					<c:if test="${not empty loginUser}">
						<a href="/community/board/insertForm" class="btn btn-arsenal px-4">새
							글 작성</a>
					</c:if>
				</div>

				<table class="table table-hover mt-3">
					<thead>
						<tr>
							<th style="width: 8%">No</th>
							<th style="width: 50%">제목</th>
							<th style="width: 15%">글쓴이</th>
							<th style="width: 15%">작성일</th>
							<th style="width: 12%">좋아요</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="adminBoard" items="${adminBoardList}" end="2">
							<tr class="table-light">
								<td class="fw-bold text-danger text-center">공지</td>
								<td class="text-start"><a
									href="/community/board/detail?no=${adminBoard.no}"
									class="text-decoration-none text-dark fw-bold"> [공지] <c:out
											value="${adminBoard.title}" /><span class="reply-count">[${adminBoard.replyCount}]</span>
								</a></td>
								<td>${adminBoard.user.nickName}</td>
								<td><fmt:formatDate value="${adminBoard.regDate}"
										pattern="yyyy-MM-dd" /></td>
								<td><span class="text-danger">${adminBoard.goodPoint}</span></td>
							</tr>
						</c:forEach>
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td>${board.no}</td>
								<td class="title-cell"><a
									href="/community/board/detail?no=${board.no}"
									class="text-decoration-none text-dark fw-bold">${board.title}<span class="reply-count">[${board.replyCount}]</span></a>
								</td>
								<td>${board.user.nickName}</td>
								<td><fmt:formatDate value="${board.regDate}"
										pattern="MM.dd HH:mm" /></td>
								<td><span class="text-danger">${board.goodPoint}</span></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<nav class="mt-5">
					<ul class="pagination justify-content-center">
						<li class="page-item ${paging.prev ? '' : 'disabled'}"><a
							class="page-link"
							href="?page=${paging.startPage - 1}&searchType=${board.searchType}&keyword=${board.keyword}">&laquo;</a>
						</li>

						<c:forEach var="num" begin="${paging.startPage}"
							end="${paging.endPage}">
							<li
								class="page-item ${paging.currentPage == num ? 'active' : ''}">
								<a class="page-link"
								href="?page=${num}&searchType=${board.searchType}&keyword=${board.keyword}">${num}</a>
							</li>
						</c:forEach>

						<li class="page-item ${paging.next ? '' : 'disabled'}"><a
							class="page-link"
							href="?page=${paging.endPage + 1}&searchType=${board.searchType}&keyword=${board.keyword}">&raquo;</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<h5 class="fw-bold text-white">ARSENAL COMMUNITY</h5>
					<p class="m-0">관리자: 오지훈 | 010-8735-4875 | ohjh4875@gmail.com</p>
				</div>
				<div class="col-md-6 text-md-end">
					<p class="m-0">&copy; 2026 North London is Red.</p>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>