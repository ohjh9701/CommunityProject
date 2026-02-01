# White & Red: Arsenal Fan Community Project
아스날 FC 팬들을 위한 커뮤니티 플랫폼입니다. 자바 백엔드 개발자 과정을 통해 학습한 기술을 바탕으로, 팬들이 소통하고 경기 정보를 공유할 수 있는 공간을 구현했습니다.



## Project Overview
* **개발 기간**: 2026.01.30 ~ 2026.02.01
* **프로젝트 주제**: 축구 팬 커뮤니티
* **핵심 가치**: 직관적인 게시판 UI, 실시간 소통 느낌의 댓글 시스템, 정확한 정보 제공(공식 사이트 링크 연결)

---

## Tech Stack
### Backend
- **Java 17 / Spring Boot 5.0.1**
- **MyBatis**: SQL 매핑 및 동적 쿼리 처리
- **Oracle DB**: 관계형 데이터베이스 설계 및 시퀀스 관리
- **Spring MVC**: 효율적인 요청 처리 및 화면 전환

### Frontend
- **JSP (JSTL/EL)**: 서버 사이드 렌더링을 통한 동적 페이지 생성
- **Bootstrap 5**: 반응형 UI 및 아스날 팀 컬러(Red & Navy) 테마 적용
- **CSS3 / Google Fonts**: Oswald 및 Noto Sans KR 폰트 적용

---

## Key Features
### 1. 게시판 (Board)
- **페이징 및 검색**: 제목, 내용, 닉네임별 동적 검색 기능 (MyBatis Dynamic SQL 사용), 페이징 기능으로 한 화면에 10개의 게시글 제한
- **댓글 수 표시**: 리스트에서 게시글별 댓글 개수를 실시간으로 확인 (서브쿼리 최적화)
- **공지사항**: 관리자 전용 게시글 상단 고정 및 별도 스타일링 (`[공지]` 태그)

### 2. 댓글 시스템 (Reply)
- **일반 방식 구현**: 직관적인 등록/삭제 로직
- **권한 관리**: JSTL을 사용하여 본인이 작성한 댓글에만 '삭제(X)' 버튼 노출
- **실시간 소통**: 등록 후 즉시 해당 상세 페이지로 이동하는 사용자 경험 제공

### 3. 사용자 편의성
- **로그인 상태 유지**: 세션(Session) 기반의 유저 정보 관리 및 UI 분기 처리
- **오피셜 링크**: 아스날 공식 일정(Fixtures) 및 스쿼드 정보 연동 배너

---

## Database ERD (Key Tables)
- **Users**: 유저 아이디, 닉네임, 등급 관리
- **Board**: 게시글 일련번호, 제목, 내용, 작성자(FK), 추천수
- **Reply**: 댓글 번호, 게시글 번호(FK), 작성자(FK), 내용, 등록일

---

## 핵심 해결 과제 (Troubleshooting)
- **MyBatis Parameter Mapping**: 1개 이상의 파라미터 전달 시 `@Param` 어노테이션을 활용하여 XML 매핑 오류(`ReflectionException`) 해결
- **Oracle Join SQL**: `COUNT(*)`와 서브쿼리를 활용하여 조인 시 발생하는 별칭(Alias) 충돌 및 성능 저하 문제 최적화
- **JSTL Logic**: `loginUser` 세션 값 검증 로직을 강화하여 비로그인 시 댓글 권한 버튼이 오작동하는 현상 수정

---

## Contributor
- **오지훈 (Oh Ji-hun)**
- **GitHub**: [ohjh9701](https://github.com/ohjh9701)
- **Email**: ohjh4875@gmail.com
