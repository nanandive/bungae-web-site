<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 고객센터 공통 CSS -->
<link rel="stylesheet"
	href="css/customer_service/customer_service_common.css">
<!-- 공지사항 CSS -->
<link rel="stylesheet" href="css/customer_service/customer_notice.css">
<!-- 파비콘 -->
<link rel="icon" href="images/market/favicon.ico">

<!-- 화면 스크롤시 -->
<script src="js/market/jquery-3.6.0.min.js"></script>
<script src="js/customer_service/top_show_name.js"></script>

<!-- 타이틀 클릭시 하단 공지 변경 -->
<script src="js/customer_service/customer_notice.js"></script>
<style>
#notice_date {
	margin: 10px 0px 0px;
	font-size: 0.75rem;
	font-weight: 500;
	font-stretch: normal;
	font-style: normal;
	line-height: 1;
	letter-spacing: normal;
	color: rgba(102, 102, 102, 0.5);
}
</style>
</head>
<body>
	<header>
		<div>
			<a href="customer.do"> <i class="bi bi-chevron-left"></i>
			</a>
		</div>
	</header>

	<!-- wrapper 영역 -->
	<div id="wrapper">
		<h1 id="title">공지사항</h1>

		<div class="container text-center" id="list_title">
			<div class="row">
				<div class="col" id="general">일반</div>
				<div class="col" id="change_policy">정책변경</div>
				<div class="col" id="fraud_prevention">사기예방</div>
			</div>
		</div>

		<div id="list_contents">
			<!-- 일반 영역 -->
			<div id="general_lists_area">
				<c:forEach var="notice" items="${noticeList}">
					<div class="general_content">
						<a href="notice.do?id=${notice.notice_id}">
							<p>${notice.notice_title}</p>
							<p id="notice_date">${notice.notice_date}</p>
						</a>
					</div>
				</c:forEach>
				<div></div>
			</div>

			<!-- 정책변경 영역 -->
			<div id="change_policy_lists_area">
				<c:forEach var="notice" items="${policyList}">
					<div class="change_policy_content">
						<a href="notice.do?id=${notice.notice_id}">
							<p>${notice.notice_title}</p>
							<p id="notice_date">${notice.notice_date}</p>
					</div>
				</c:forEach>
				<div></div>
			</div>

			<!-- 사기예방 영역 -->
			<div id="fraud_prevention_lists_area">
				<c:forEach var="notice" items="${preventList}">
					<div class="fraud_prevention_content">
						<a href="notice.do?id=${notice.notice_id}">
							<p>${notice.notice_title}</p>
							<p id="notice_date">${notice.notice_date}</p>
					</div>
				</c:forEach>
			</div>


			<!-- 선택된 공지사항의 상세 내용을 표시 -->
			<div class="general_content">
				<p>${noticeDetail.notice_title}</p>
				<p id="notice_date">${noticeDetail.notice_date}</p>
				<p>${noticeDetail.notice_content}</p>
			</div>
		</div>

		<!-- // wrapper 영역 -->
</body>
</html>