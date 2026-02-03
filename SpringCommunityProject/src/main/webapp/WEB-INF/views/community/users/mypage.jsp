<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Arsenal FC - My Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Oswald:wght@500;600&display=swap"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	margin: 0;
}

/* 헤더 스타일 */
.navbar {
	background-color: #ffffff;
	border-bottom: 3px solid #EF0107;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.navbar-brand {
	font-family: 'Oswald', sans-serif;
	color: #EF0107 !important;
	font-size: 1.5rem;
}

/* 중앙 컨텐츠 영역 */
.main-content {
	flex: 1;
	padding: 60px 0;
}

.profile-card {
	background: white;
	border-radius: 20px;
	overflow: hidden;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
	max-width: 600px;
	margin: 0 auto;
}

.profile-header {
	background-color: #EF0107;
	padding: 40px;
	text-align: center;
	color: white;
}

.profile-img-wrapper {
    width: 130px;
    height: 130px;
    border-radius: 50%;
    margin: 0 auto;
    overflow: hidden; /* 영역 밖으로 나가는 이미지 커트 */
    border: 4px solid white;
    background-color: white;
}

.profile-img-wrapper img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지가 찌그러지지 않고 꽉 차게 */
}

.profile-body {
	padding: 40px;
}

.info-row {
	display: flex;
	justify-content: space-between;
	padding: 15px 0;
	border-bottom: 1px solid #eee;
}

.info-label {
	font-weight: bold;
	color: #063672;
}

.info-value {
	color: #333;
}

.btn-group-custom {
	display: flex;
	gap: 10px;
	margin-top: 30px;
}

.btn-edit {
	background-color: #EF0107;
	color: white;
	border: none;
	padding: 12px;
	font-weight: bold;
	flex: 1;
}

.btn-logout {
	background-color: #063672;
	color: white;
	border: none;
	padding: 12px;
	font-weight: bold;
	flex: 1;
	text-decoration: none;
	text-align: center;
}

.btn-edit:hover {
	background-color: #DB0007;
	color: #ffffff;
	opacity: 0.9;
}

.btn-logout:hover {
	background-color: rgb(3, 27, 54);
	color: #ffffff;
	opacity: 0.9;
}

/* 푸터 스타일 */
footer {
	background-color: #111;
	color: #aaa;
	padding: 40px 0;
	font-size: 0.9rem;
	margin-top: auto;
}

.footer-logo {
	font-family: 'Oswald', sans-serif;
	color: #EF0107;
	font-size: 1.2rem;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg sticky-top">
		<div class="container">
			<a class="navbar-brand" href="/community/main">ARSENAL FAN
				COMMUNITY</a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto align-items-center">
					<li class="nav-item"><a class="nav-link"
						href="/community/board/list">게시판</a></li>
					<li class="nav-item"><a class="nav-link active"
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
			<div class="profile-card">
				<div class="profile-header">
    <div class="position-relative d-inline-block">
        <div class="profile-img-wrapper shadow">
            <c:choose>
                <%-- DB에 프로필 이미지 경로가 저장되어 있는 경우 --%>
                <c:when test="${not empty loginUser.profileImg}">
                    <img src="/upload/${loginUser.profileImg}" alt="Profile" id="profileDisplay">
                </c:when>
                <%-- 이미지가 없는 경우 기본 이미지 출력 --%>
                <c:otherwise>
                    <img src="/images/defaultIMG.jpg" alt="Default Profile" id="profileDisplay">
                </c:otherwise>
            </c:choose>
        </div>
        
        <label for="imgInput" class="btn btn-light btn-sm position-absolute bottom-0 end-0 rounded-circle shadow-sm p-2" 
               style="transform: translate(-10%, -10%); cursor: pointer;" title="이미지 변경">
            <span style="font-size: 1.2rem;">📷</span>
        </label>
        
        <form id="profileImgForm" action="/community/updateProfileImg" method="post" enctype="multipart/form-data">
            <input type="file" id="imgInput" name="profileFile" style="display: none;" onchange="uploadImage()">
            <input type="hidden" name="id" value="${loginUser.id}">
        </form>
    </div>
    
    <h2 class="fw-bold mt-3">${loginUser.nickName}</h2>
    <p class="mb-0">Official Gunner</p>
</div>

				<div class="profile-body">
					<div class="info-row">
						<span class="info-label">ID</span> <span class="info-value">${loginUser.id}</span>
					</div>
					<div class="info-row">
						<span class="info-label">Nickname</span> <span class="info-value">${loginUser.nickName}</span>
					</div>
					<div class="info-row">
						<span class="info-label">Email</span> <span class="info-value">${loginUser.email}</span>
					</div>

					<div class="btn-group-custom">
						<a href="/community/board/myList?no=${loginUser.no}"
							class="btn btn-edit rounded">게시글</a> <a
							href="/community/updateUserForm" class="btn btn-edit rounded">정보
							수정</a> <a href="/community/deleteUser" class="btn btn-logout rounded">회원
							탈퇴</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="container text-center text-md-start">
			<div class="row">
				<div class="col-md-6">
					<div class="footer-logo">ARSENAL FC FAN COMMUNITY</div>
					<p>North London is Red. Join our community and support the
						Gunners.</p>
				</div>
				<div class="col-md-6 text-md-end">
					<p>
						<b>관리자 :</b> 오지훈 | <b>연락처 :</b> 010-8735-4875
					</p>
					<p>
						<b>이메일 :</b> ohjh4875@gmail.com
					</p>
					<p class="mt-2">&copy; 2026 Arsenal Fan Community.</p>
				</div>
			</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>