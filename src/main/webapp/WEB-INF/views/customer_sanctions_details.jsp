<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내상점 제재내역</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 내상점 제재내역 CSS -->
<link rel="stylesheet"
	href="css/customer_service/customer_sanctions_details.css">
<!-- 파비콘 -->
<link rel="icon" href="images/market/favicon.ico">

<style>
#subtitle {
	margin: 30px 20px 0;
	font-size: 22px;
	font-weight: bold;
}

</style>


</head>
<body>
	
	<div id="wrapper">
	<a href="customer.do"> <i class="bi bi-chevron-left"
		id="혜지니"></i>
	</a>
		<div id="title">내상점 제재내역</div>

		<!--  <br>
            <span>정상운영</span>되고있어요 -->


		<div id="content">
			<div id="subtitle">
				${myShop.member_id }호는<br>
				<div id="block">
					<span id="normal" style="color: #5CB391;">정상운영</span> 되고있어요
				</div>
			</div>
		</div>

		<hr>

		<div id="precautions">
			<p>유의사항</p>
			<div>
				<p>
					・ 번개장터에서는 <span>3</span>아웃 정책을 실시하고 있어요. 자세한 운영정책을 확인하세요. <span><a
						href="customer_operational_policy.html">번개장터 운영정책</a></span>
				</p>
				<p>・ 운영정책 위반이 확인되면 사전 안내 없이 서비스 사용이 한시적 또는 영구적으로 제한될 수 있어요.</p>
				<p>・ 영구차단의 경우, 문제해결이 되어야 해제가 가능해요.</p>
			</div>
			<div>
				<a href="customer_contact.html">1:1 문의</a><span>|</span> 전화문의
			</div>
		</div>
	</div>

	<script>


  window.onload = function() {

     const inputValue = ${allmembers[0].block_cnt}; //이부분을 바꿔주세요

    
     const statusElement = document.getElementById('block');
     if (inputValue === 0) {
      
       statusElement.innerHTML = '<span id="normal" style="color: #5CB391;">정상운영</span> 되고있어요';
     } else if (inputValue >= 1 && inputValue < 3) {
       
       statusElement.innerHTML = `<span id="status" style="color: red;">${allmembers[0].block_cnt}회 </span>경고를 받았어요`;
     } else if (inputValue >= 3) {
      
       statusElement.innerHTML = '<span id="status" style="color: red;">블랙리스트</span>입니다';
     }
   };

</script>
</body>
</html>