<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 1:1문의 CSS -->
<link rel="stylesheet" href="css/customer_service/customer_inquiry.css">
<!-- 파비콘 -->
<link rel="icon" href="images/market/favicon.ico">
<style>
#content {
	margin: 140px 20px 0;
	min-height: 270px;
}

table tr {
	padding: 2rem;
	border-bottom: 1px solid rgb(220, 219, 228);
}

table {
	position: relative;
	top: -100px; /* 원하는 만큼 위로 이동할 값 */
	width: 100%;
}

table tr:last-child {
	border-bottom: none;
}

table tr td {
	text-align: left; /* 텍스트를 왼쪽으로 정렬 */
	padding-bottom: 20px; /* 하단에 패딩 값을 설정 */
	padding-top: 20px;
}

#status {
	color: #CCCCCC /* rgb(153, 153, 153) */;
	font-size: 0.75rem;
	font-weight: bold;
	font-stretch: normal;
	font-style: normal;
	line-height: 1;
	letter-spacing: normal;
	margin-top: 10px; /* 위쪽에 10px의 마진 값을 설정 */
}

#status[data-status="답변완료"] {
	color: #5CB391; /* #5CB391 */; /* 답변완료인 경우의 글자색 */
}

#type {
	color: rgb(25, 25, 25);
	font-weight: bold;
	margin-right: 7px;
	font-size: 15px;
}

#date_type {
	color: #CCCCCC;
	font-weight: bold;
	margin-right: 7px;
}

#detail_type {
	margin-top: 200px;
}

#istyle {
	opacity: 0.3;
	font-size: 15px;
}

detail_date {
	font-size: 8px;
}
</style>
</head>
<body>
	<header>
		<div>
			<div>
				<a href="customer.do"> <i class="bi bi-chevron-left"></i>
				</a>
			</div>
			<div>
				<a href="/bungae/contact.do"> 문의하기 </a>
			</div>
		</div>
	</header>

	<div id="wrapper">
		<div id="title">1:1 문의</div>
		<div id="content">
			<table>
				<thead>

				</thead>

				 <tbody>
	               <c:forEach var="store" items="${inquiryone}">
	                  <tr data-inquiry-id="${store.inquiry_id}">
	                     <td><span id="type">${store.type}</span> <span
	                        id="detail_type">${store.detail_type}</span>
	                        <p id="status" data-status="답변완료">
	                           ${store.status}<span id="date_type"><span id="istyle">
	                                 | </span> <span id="detail_date">${store.write_date}</span></span>
	                        </p></td>
	                  </tr>
	               </c:forEach>
            	</tbody>
			</table>
			<div>
				<!-- <img src="images/customer_service/poster.png" alt="포스터">
                <p>
                    문의내역이 없습니다.
                </p> -->
			</div>
		</div>
		<div id="precautions">
			<p>유의사항</p>
			<div>
				<p>
					・ <a href="asked.do">자주묻는질문</a>을
					확인하면 답변을 빨리 받을 수 있어요.
				</p>
				<p>
					・ 접수는 24시간 가능하지만,<br> 답변은 9시 - 18시 사이에 순차적으로 받을 수 있어요.
				</p>
				<p>・ 문의취소는 접수상태에서만 가능해요.</p>
			</div>
			<div>전화문의</div>
		</div>
	</div>
	
	<script>
      var tableRows = document.querySelectorAll("table tbody tr");
      tableRows.forEach(function(row) {
         row.addEventListener("click", function() {
            var inquiryId = this.getAttribute("data-inquiry-id");

            // 넘어갈 상세 페이지의 URL을 생성합니다.
            var url = "/bungae/answer.do?id=" + inquiryId;

            window.location.href = url;
         });
      });
   </script>
</body>
</html>