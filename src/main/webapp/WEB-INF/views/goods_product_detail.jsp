<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	trimDirectiveWhitespaces="true"%>
<%@page import="util.CharacterEncodingFilter"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();
%>
<%
    // 로그인 상태 여부를 가져옴
    boolean isLoggedIn = (Boolean) request.getAttribute("isLoggedIn");
    // 상품 아이디와 회원 아이디를 가져옴
    int product_id = (Integer) request.getAttribute("product_id");
    String member_id = (String) request.getAttribute("member_id");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세페이지</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 부트스트랩 js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- 공통 CSS -->
<link rel="stylesheet" href="css/market/common.css">
<!-- 상세페이지 CSS -->
<link rel="stylesheet" href="css/goods/goods_product_detail.css">

<!-- 햄버거 메뉴 호버시 -->
<script src="js/market/jquery-3.6.0.min.js"></script>
<script src="js/market/menu_hover.js"></script>
<script src="js/goods/goods_detail_menu.js"></script>
<!-- 파비콘 -->
<link rel="icon" href="images/market/favicon.ico">

<!--아이콘-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 부트스트랩 js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<!-- 폰트어썸 js -->
<script src="https://kit.fontawesome.com/1169190f22.js"
	crossorigin="anonymous"></script>

<!--css-->
<link rel="stylesheet" href="css/market/common.css">
<link rel="stylesheet" href="css/market/index.css">
<link rel="stylesheet" href="css/market/join.css">

<!-- js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/market/menu_hover.js"></script>
<script src="js/market/login_modal.js"></script>
<style>
/* dropdown */

.dropdown-container {
   position: relative;
}

.dropdown-content {
   position: absolute;
   top: 100%; /* Position the dropdown below the header */
   display: none;
   /* z-index: 999; */
}

.dropdown-content {
   display: none;
   position: absolute;
   background-color: #f9f9f9;
   width: 90px;
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
   z-index: 1;
   top: 100%;
   right: 0;
   display: none;
}

.dropdown-content a {
   color: black;
   padding: 12px 16px;
   text-decoration: none;
   display: block;
}

.dropdown:hover .dropdown-content {
   display: block;
   top: 100%; /* 상위 요소에서 100% 위치에 표시 */
   z-index: 900;
   left: 0;
   top: 100%; /* 상위 요소에서 100% 위치에 표시 */
}

.drop {
   height: 40px;
}

.drop:hover {
   color: red;
}


}

</style>
<script>
function openMemberPage() {
    window.location.href = "member.jsp";
 }
 
function openLoginPage() {
   window.location.href = "hello.jsp";
}
</script>
</head>
<body>

	<!--건너뛰기 링크-->
	<a id="skipNav" href="?????.html">로그인/회원가입</a>
	<a id="skipNav" href="market_my_store.html">내 상점</a>
	<!--건너뛰기 링크 종료-->

	<div id="wrapper">
		<!-- header 영역 -->
		<header>
			<div id="top_header_bot_border">
				<div id="top_header">
					<div class="container text-center">
						<div id="top_header_menu" class="row justify-content-between">
							<div class="col-4 top_header_icon">
								<a href="#"> <img src="images/market/download.svg"
									alt="앱 다운로드"> 앱다운로드
								</a> <a href="#"> <img src="images/market/bookmark.svg"
									alt="즐겨찾기"> 즐겨찾기
								</a>
							</div>
							<%
								if( session.getAttribute("member_id") == null ) {
							%>
							<div class="col-4">
								<div class="row justify-content-end top_header_login">
									<div class="col-4">
										<a href="#" class="btn_map_close"> 로그인/회원가입 </a>
									</div>
									<div class="col-4">
										<div class="dropdown-container">
											<div class="dropdown">
												<a href="market_my_store.html" class="dropbtn">내상점<i
													class="fas fa-sharp fa-solid fa-caret-down"></i></a>
												<div class="dropdown-content">
													<a href="login.jsp" class="drop">내상품</a> <a href="login.jsp" class="drop">찜한상품</a>
													<a href="login.jsp" class="drop">내계정</a> <a href="customer.do" class="drop"
														style="margin-bottom: 20px;">고객센터</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								} else {
							%>
							<div class="col-4">
								<div class="row justify-content-end top_header_login">
									<div class="col-4">
										<a href="#" class="" id="logout">로그아웃</a>
									</div>
									<div class="col-4">
										<div class="dropdown-container">
											<div class="dropdown">
												<a href="market_my_store.html" class="dropbtn">내상점<i
													class="fas fa-sharp fa-solid fa-caret-down"></i></a>
												<div class="dropdown-content">
													<a href="market_my_store.do" class="drop">내상품</a> <a href="market_my_store.do" class="drop">찜한상품</a>
													<a href="myPage.jsp" class="drop">내계정</a> <a href="customer.do" class="drop"
														style="margin-bottom: 20px;">고객센터</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div id="bot_header_border">
			<div id="bot_header">
				<div class="container text-center">
					<div class="row justify-content-start">
						<div class="col-3 header_logo">
							<h1 class="hidden">로고</h1>
							<a href="index.do"> <img src="images/market/logo.svg"
								alt="번개장터 로고">
							</a>
						</div>
						<div class="col-6 top_searh_area">
							<div id="top_searh">
								<input type="text" placeholder="상품명, 지역명, @상점명 입력"> <img
									src="images/market/search.png" alt="검색">
							</div>
						</div>
						<%
							if( session.getAttribute("member_id") == null ) {
						%>
						<div class="col-1 b_h_left_menu">
							<a href="login.jsp"> <img src="images/market/sell.png" alt="판매하기">
								판매하기
							</a>
						</div>
						<div class="col-1 b_h_left_menu store">
							<a href="login.jsp"> <img
								src="images/market/my_store.png" alt="내상점"> 내상점
							</a>
						</div>
						<div class="col-1 b_h_left_menu">
							<a href="login.jsp"> <img src="images/market/talk.png" alt="번개톡">
								번개톡
							</a>
						</div>
						<%
							} else {
						%>
						<div class="col-1 b_h_left_menu">
							<a href="goods_selling_form_page.do"> <img src="images/market/sell.png" alt="판매하기">
								판매하기
							</a>
						</div>
						<div class="col-1 b_h_left_menu store">
							<a href="market_my_store.do"> <img
								src="images/market/my_store.png" alt="내상점"> 내상점
							</a>
						</div>
						<div class="col-1 b_h_left_menu">
							<a href="chat.jsp"> <img src="images/market/talk.png" alt="번개톡">
								번개톡
							</a>
						</div>
						<%
							}
						%>
					</div>
				</div>

				<div class="container text-center hamburger_area">
					<div class="row">
						<div class="col-md-1 hamburger">
							<img id="menu" src="images/market/hamburger.png" alt="메뉴">
						</div>
						<div class="col-md-4 sell_center">
							<p>
								번개장터 판매자센터 <img src="images/market/new_img.png" alt="새로워졌어요">
							</p>
						</div>
						
						  <!-- 메뉴 호버 -->
                        <div id="test_area">
                            <ul id="test_cates">
                                <h2>전체 카테고리<span> ></span></h2>
                                <c:forEach var="largeClass" items="${largeClasses}">
                                 <li id="${largeClass.large_id}"><a href="market_category_list.do?large_id=${largeClass.large_id}">${largeClass.large_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="test_clos">
                                <h3>여성의류</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="0" end="9">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=1&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="test_accs">
                                <h3>남성의류</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="10" end="16">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=2&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="shoes">
                                <h3>신발</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="17" end="20">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=3&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                             <ul id="bag">
                                <h3>가방/지갑</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="21" end="26">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=4&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="watch">
                                <h3>시계</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="27" end="29">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=5&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="jewerly">
                                <h3>쥬얼리</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="30" end="36">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=6&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="fassion">
                                <h3>패션/액세서리</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="37" end="45">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=7&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="digital">
                                <h3>디지털</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="46" end="53">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=8&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="home" >
                                <h3>가전제품</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="54" end="62">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=9&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                            <ul id="sports" style="overflow: auto;">
                                <h3>스포츠/레저</h3>
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="63" end="82">
                                 <li id="${mediumClass.medium_name}"><a href="market_category_list.do?large_id=10&medium_id=${mediumClass.medium_id}">${mediumClass.medium_name}</a></li>
                              </c:forEach>
                            </ul>
                        </div>
                        <!-- // 메뉴 호버 -->
					</div>
				</div>
				<div id="side_bar">
					<div id="heart">
						<p>찜한 상품</p>
						<p>
							<img src="images/market/heart.png" alt="찜 하트"> ${fn:length(loveProduct)}
						</p>
					</div>
					<div id="goods">
						<p>최근본상품</p>
						<p id="dotted"></p>
						<p>
							<img src="images/market/eyes.png" alt="눈표시">
						<p>
							최근 본 상품<br>이<br>없습니다.
						</p>
						</p>
					</div>
					<div id="QR_code">
						<p>앱 다운로드</p>
						<p>
							<img src="images/market/QR_code.png" alt="QR 코드">
						</p>
					</div>
					<div id="top_btn">
						<button>
							<a href="#top_header">TOP</a>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- // header 영역 -->
		
		
		<!--로그아웃 확인 모달창-->
		<div class="logout_modal_wrap hidden">
			<div class="logout_bg bg"></div>
			<div class="logout_modal">
				<h2>로그아웃</h2>
				<p>로그아웃 하시겠습니까?</p>
				<div class="btn_area">
					<button type="button" class="btn_logout_no">취소</button>
					<a href="" class="btn_logout_yes">확인</a>
				</div>
			</div>
		</div>

		<!--로그인/회원가입 모달창-->
		<div class="join_modal_wrap hidden">
			<div class="join_bg bg"></div>
			<div class="join_content">
				<button class="btn_join_close">
					<img src="images/market/thunder_join_close.png"
						alt="번개장터 로그인 창 닫기 버튼" width="24px" height="24px">
				</button>
				<div class="join_main">
					<img src="images/market/app.png" alt="번개장터 앱 로고">
					<p>번개장터로 중고 거래 시작하기</p>
					<p>간편하게 가입하고 상품을 확인하세요</p>
					<div class="join_button_area">
						<button class="join_kakao" onclick="openMemberPage()">
							<div class="join_kakao_logo"></div>
							회원가입
						</button>
						<button class="join_naver" onclick="openLoginPage()">
							<div class="join_naver_logo"></div>
							로그인
						</button>
					</div>
					<div class="join_footer">
						도움이 필요하시면 <span class="join_footer_email">이메일</span> 또는 고객센터 <span
							class="join_footer_cs">1670-2910</span>로 문의 부탁드립니다.<br> 고객센터
						운영시간: 09~18시 (점심시간 12~13시, 주말/공휴일 제외)
					</div>
				</div>
			</div>
		</div>

		<!-- main_content 영역 -->
		<div id="main_content">
			<!-- category -->
			<div id="category">
				<div id="category_left">
					<div>
						<p id="home">
							<span> <img src="images/goods/home.png" alt="home">
							</span> <span>홈</span>
						</p>
						<p id="entire">
							<span> <i class="bi bi-chevron-right"></i>
							</span> <span>
								<ul class="entire_bar">
									<li><a href="#">의류</a></li>
									<li class="hidden_menu"><a href="#">악세서리</a></li>
								</ul> <i class="bi bi-chevron-down under_direction"></i>
							</span>

						</p>
						<p id="category_clothes">
							<span> <i class="bi bi-chevron-right"></i>
							</span> <span>
								<ul class="category_clothes_bar">
									<li><a href="#">남성의류</a></li>
									<li class="hidden_menu"><a href="#">여성의류</a></li>
								</ul> <i class="bi bi-chevron-down under_direction"></i>
							</span>

						</p>
						<p id="category_acc">
							<span> <i class="bi bi-chevron-right"></i>
							</span> <span>
								<ul class="category_acc_bar">
									<li><a href="#">시계/쥬얼리</a></li>
									<li class="hidden_menu"><a href="#">패션 악세서리</a></li>
								</ul> <i class="bi bi-chevron-down under_direction"></i>
							</span>
						</p>
					</div>
				</div>
				<div id="category_right">
					<img src="images/goods/sale.png" alt="할인 받기">
				</div>
			</div>
			<!-- // category -->

			<!-- detail_content -->
			<div id="detail_content">
				<div class="container text-center">
					<div class="row">
						<div class="col detail_content_img">
							<div id="carouselExampleCaptions" class="carousel slide"
								data-bs-ride="false">
								<div class="carousel-indicators">
									<!-- <button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="0" class="active change" id="change1"
										aria-current="true" aria-label="Slide 1"></button>
									<button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="1" id="change2" aria-label="Slide 2"></button>
									<button type="button" data-bs-target="#carouselExampleCaptions"
										data-bs-slide-to="2" id="change3" aria-label="Slide 3"></button> -->
								</div>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="${list.image_path }" class="d-block w-100"
											alt="상품 사진1" style="height:480px;">
									</div>
								</div>
								<!-- <button class="carousel-control-prev" type="button"
									data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button"
									data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>  -->
							</div>
						</div>
						<div class="col detail_content_info">
							<h2>${list.title }</h2>
							<p>${list.price }<span>원</span>
							</p>
							<hr>
							<div id="detail_content_info_mid">
								<p>
									<img src="images/goods/heart.png" alt="찜"> <span>${love_count }</span>
								</p>
								<p>
									<img src="images/goods/eye.png" alt="조회"> <span>${list.view_count }</span>
								</p>
								<%--        <p>
                                    <img src="images/goods/time.png" alt="지난 시간">
                                    <span>${list.register_date }</span>
                                </p>  --%>

								<p>
									<img src="images/goods/time.png" alt="지난 시간"> <span
										id="daysAgo"></span>
								</p>



								<p>
									<img src="images/goods/report.png" alt="신고"> <span>신고</span>
								</p>
							</div>
							<div id="detail_content_info_state">
								<p>
									<span>· 상품상태</span> <span>${list.condition}</span>

								</p>
								<p>
									<span>· 교환여부</span> <span>${list.exchange }</span>
								</p>
								<p>
									<span>· 배송비</span>


									<c:if test="${list.delivery_fee != 0}">
										<span class="shipping">배송비별도</span>
									</c:if>
									<c:if test="${list.delivery_fee == 0}">
										<span class="shipping">배송비무료</span>
									</c:if>
								</p>
								<p>
									<span>· 거래지역</span> <span><img
										src="images/goods/place.png" alt="주소"> ${list.tradeArea}</span>
								</p>
							</div>
							<div>
								<div class="container text-center detail_content_info_btn">
									<div class="row g-2">
										<%
											if( session.getAttribute("member_id") == null ) {
										%>
										<!-- 찜 구분선 -->
										<div class="col-4">
											<a href="hello.jsp">
												<div class="p-3 info_btn1">
													<img src="images/goods/w_heart.svg" alt="찜"> 찜 <span>${love_count }</span>
												</div>
											</a>
										</div>
										<!-- 찜 구분선 -->
										<%
											} else {
										%>
										<c:if test="${lovecheck == true }">

											<div class="col-4">
												<div class="p-3 info_btn1" onclick="toggleSelected(this)">
													<img src="images/goods/f_heart.svg" alt="찜"> 찜 <span
														id="likeCount" >${love_count }</span>
												</div>
											</div>

										</c:if>
										<c:if test="${lovecheck == false }">

											<div class="col-4">
												<div class="p-3 info_btn1" onclick="toggleSelected(this)">
													<img src="images/goods/w_heart.svg" alt="찜"> 찜 <span
														id="likeCount">${love_count }</span>
												</div>
											</div>

										</c:if>
										<%
											}
										%>
										<%
											if( session.getAttribute("member_id") == null ) {
										%>
										<!-- 번개톡 구분선 -->
										<div class="col-4">
											<a href="hello.jsp ">
												<div class="p-3 info_btn2">
													<img src="images/goods/talk.png" alt="번개톡"> 번개톡
												</div>
											</a>
										</div>
										<!-- 번개톡 구분선 -->
										<% } else { %>
										<div class="col-4">
											<a href="#">
												<div class="p-3 info_btn2">
													<img src="images/goods/talk.png" alt="번개톡"> 번개톡
												</div>
											</a>
										</div>
										<% } %>
										<div class="col-4">
										    <form action="payment.do" method="get" id="paymentForm">
										        <input type="hidden" name="product_id" value="<%= product_id %>" />
										        <input type="hidden" name="member_id" value="<%= member_id %>" />
										        <c:choose>
										            <c:when test="<%= isLoggedIn %>">
										                <!-- 로그인 상태인 경우 바로구매 버튼을 출력 -->
										                <a href="#" id="purchaseLink">
										                    <div class="p-3 info_btn3">바로구매</div>
										                </a>
										            </c:when>
										            <c:otherwise>
										                <!-- 로그인 상태가 아닌 경우 로그인 페이지로 이동하는 링크를 출력 -->
										                <a href="hello.jsp" id="purchaseLink">
										                    <div class="p-3 info_btn3">바로구매</div>
										                </a>
										            </c:otherwise>
										        </c:choose>
										    </form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // detail_content -->

			<!-- related_goods -->
			<div id="related_goods">
				<div>
					<h3>연관 상품</h3>
					<p>
						AD<span><img src="images/goods/i.svg" alt="AD"></span>
					</p>
				</div>
				<div class="container text-center" id="related_goods_imgs">
					<div class="row g-2">
						<div class="col-2 goods_list">
							<div class="related_goods_img">
								<a href="#"> <img src="images/goods/cashmere_coat.jpg"
									alt="연관상품 캐시미어 코트">
									<p>연관 상품 목록</p>
								</a>
							</div>
						</div>
						<div class="col-2 goods_list">
							<div class="related_goods_img">
								<a href="#"> <img src="images/goods/hood_coat.jpg"
									alt="연관상품 후드코트">
									<p>연관 상품 목록</p>
								</a>
							</div>
						</div>
						<div class="col-2 goods_list">
							<div class="related_goods_img">
								<a href="#"> <img src="images/goods/wool_coat.jpg"
									alt="연관상품 울코트">
									<p>연관 상품 목록</p>
								</a>
							</div>
						</div>
						<div class="col-2 goods_list">
							<div class="related_goods_img">
								<a href="#"> <img src="images/goods/long_padded.jpg"
									alt="연관상품 롱패딩">
									<p>연관 상품 목록</p>
								</a>
							</div>
						</div>
						<div class="col-2 goods_list">
							<div class="related_goods_img">
								<a href="#"> <img src="images/goods/short_padded.jpg"
									alt="연관상품 숏패딩">
									<p>연관 상품 목록</p>
								</a>
							</div>
						</div>
						<div class="col-2 goods_list">
							<div class="related_goods_img">
								<a href="#"> <img src="images/goods/cream_short_padded.jpg"
									alt="연관상품 크림색 숏패딩">
									<p>연관 상품 목록</p>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // related_goods -->

			<!-- url_images -->
			<div id="url_images">
				<p>
					<span> <img src="images/goods/naver.png" alt="Naver blog">
					</span> <span> <img src="images/goods/facebook.png" alt="Facebook">
					</span> <span> <img src="images/goods/twitter.png" alt="Twitter">
					</span> <span> <img src="images/goods/url.png" alt="URL">
					</span>
				</p>
			</div>
			<!-- // url_images -->

			<!-- goods_info -->
			<div id="goods_info">
				<div class="container text-center info_area">
					<div class="row g-2">
						<div class="col-8 info_area_left">
							<div class="info_content">
								<div>
									<p>상품정보</p>
								</div>
								<div>${ list.description }</div>
							</div>
							<div class="p-3 detailed_information">
								<div class="container text-center ">
									<div class="row g-2">
										<div class="col-4">
											<div class="p-3 detailed_information_place">
												<img src="images/goods/bottom_place.png" alt="거래지역"> <span>거래지역</span>
												<p>${list.tradeArea}</p>
											</div>
										</div>
										<div class="col-4">
											<div class="p-3 detailed_information_category">
												<img src="images/goods/category.png" alt="카테고리"> <span>카테고리</span>
												<p>상품 종류</p>
											</div>
										</div>
										<div class="col-4">
											<div class="p-3 detailed_information_tag">
												<img src="images/goods/tag.png" alt="상품태그"> <span>상품태그</span>
												<p>#${list.tag }</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-4">
							<div class="store_info_area">
								<div>
									<p>${sell_member.member_id}</p>
								</div>
								<div>
									<div>
										<div>
											<img src="images/goods/store.svg" alt="상점명">
										</div>
										<div>
											<p>${sell.member_id }</p>
											<p>
											<p>
												상품 <span>${fn:length(sell_list)}</span>
											</p>
											<p>
												팔로워 <span>${sell_count}</span>
											</p>
											</p>
										</div>
										<div id="store_follow">
											<%
												if( session.getAttribute("member_id")==null){
											%>
											<button id="followButton">
												<img src="images/goods/follow.png" alt="팔로우">팔로우
											</button>
											<%
												} else {
											%>
											<button>
												<img src="images/goods/follow.png" alt="팔로우">팔로우
											</button>
											<%
												}
											%>
										</div>
									</div>
								</div>
								<div>
									<div>
										<img src="images/salmon.png" alt="상품 더보기"> <img
											src="images/salmonpink.png" alt="상품 더보기">
									</div>
									<div>
										<p>
											${fn:length(sell_list)}개 <a
												href="market_my_store.do?sell_id=${member_id}">상품 더보기 ></a>
										</p>
									</div>
								</div>
								<div>
									<p>
										상점후기 <span>${fn:length(reviewList)}</span>
									</p>
									<div>
										<p>
									        <% int reviewListLength = (int) request.getAttribute("reviewListLength"); %>
        									<% if (reviewListLength == 0) { %>
									            <p>
												등록된 후기가 없습니다.<br> 첫 후기를 등록해보세요!
												</p>
									        <% } else { %>
									        <c:forEach items="${reviewList}" var="review">
									            <div class="revde" style=display:flex;padding-top:16px;>
									            <img src="images/reviewhome.svg" width="32" height="32" alt="리뷰 쓴 사람 프로필 이미지"></a>
									            <div class="sc-eLdqWK dYGvgp" style=padding-bottom:16px;border-bottom:1pxsolidrgb(238,238,238);>
									            <div class="sc-hgRTRy dRzrQi" style=display:flex;-webkit-box-pack:justify;justify-content:space-between;-webkit-box-align:center;align-items:center;color:rgb(178,178,178);margin-bottom:5px;>	
									            <a class="sc-gldTML gpiXxD" href="#" style=color:#8a8e91;display:flex;font-size:13px;font-weight:500;>${review.member_id}</a>
									            <div class="sc-feryYK bmJCGf" style=font-size:12px;display:flex;>${review.write_time}</div>
									            </div>
									            <div class="sc-cJOK jNTbUp" style=display:flex;margin-bottom:10px;>
									            <div class="sc-jKmXuR ewInqa" style=display:flex;margin-bottom:10px;>
									            <img src="images/detailstart.png" width="15" height="14" alt="작은 별점 2점 이미지" style=vertical-align:bottom;border-style:none;>
									            <img src="images/detailstart.png" width="15" height="14" alt="작은 별점 2점 이미지" style=vertical-align:bottom;border-style:none;>
									            <img src="images/detailstart.png" width="15" height="14" alt="작은 별점 2점 이미지" style=vertical-align:bottom;border-style:none;>
									            <img src="images/detailstart.png" width="15" height="14" alt="작은 별점 2점 이미지" style=vertical-align:bottom;border-style:none;>
									            <img src="images/detailstart.png" width="15" height="14" alt="작은 별점 2점 이미지" style=vertical-align:bottom;border-style:none;>
									            </div>
									            </div>
									            <div class="rede" style=overflow:hidden;text-overflow:ellipsis;word-break:break-all;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;font-size:13px;color:rgb(136,136,136);line-height:1.4;>${review.review_detail }</div>
									            </div>
									            </div>
									            </c:forEach>
									        <% } %>
									    </p>
									</div>
								</div>
								<div>

									<%
										if( session.getAttribute("member_id")==null ){
									%>
									<button id="bgbutton" onclick="window.location.href='hello.jsp'">
										
										<img src="images/goods/talk.png" alt="번개톡"> 번개톡
										
									</button>
									<% 
									} else { 
									%>
									<button id="bgbutton" onclick="window.location.href='chat.jsp'">
									
											<img src="images/goods/talk.png" alt="번개톡"> 번개톡
										
									</button>
									<% 
									}
									%>
									
									<%
										if( session.getAttribute("member_id")==null ) {
									%>
									
										<button id="ibuy" onclick="window.location.href='hello.jsp'">바로구매</button>
									
									<% } else { %>
									
									<button id="ibuy" onclick="payment.do">바로구매</button>
									
									<% } %>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // goods_info -->
			<!-- // main_content 영역 -->

			<!-- footer 영역 -->
			<footer>
				<div id="top_footer_border_area">
					<div id="top_footer_area">
						<ul>
							<li>회사소개</li>
							<li>이용약관</li>
							<li>운영정책</li>
							<li>개인정보처리방침</li>
							<li>청소년보호정책</li>
						</ul>
					</div>
				</div>
				<div id="mid_footer_area" class="container text-center">
					<div class="row">
						<div class="col mid_footer_areas">
							<div class="mid_footer_left">
								<p>번개장터(주) 사업자정보</p>
								<p>
									대표이사 : 최재화, 강승현 | 개인정보보호책임자 : 문제근<br> 사업자등록번호 :
									113-86-45836 | 통신판매업신고 : 2019-서울서초-1126<br> 호스팅서비스 제공자 :
									Amazon Web Services (AWS)<br> EMAIL : help@bunjang.co.kr |
									FAX : 02-598-8241<br> 주소 : 서울특별시 서초구 서초대로 38길 12, 7, 10층<br>
									(서초동, 마제스타시티, 힐스테이트 서리풀)<br> <span>사업자정보 확인</span>
								</p>
							</div>
							<div class="mid_footer_left2">
								<div>
									<p>
										<b>번개장터(주)더현대서울점</b> | 최재화, 강승현 | 365-85-01581<br> 서울특별시
										영등포구 여의대로 108, 지하2층(여의도동, 파크원)<br>
									</p>
									<p>
										<b>번개장터(주)코엑스점</b> | 최재화, 강승현 | 142-85-27412<br> 서울특별시
										강남구 영동대로 513, 쇼핑몰동 B1층 C102호(삼성동, 코엑스)<br>
									</p>
									<p>
										<b>번개장터(주)센터필드점</b> | 최재화, 강승현 | 808-85-01905<br> 서울특별시
										강남구 테헤란로 231, 쇼핑몰동 1층 W124호(역삼동)(역삼동, 센터필드)<br>
									</p>
								</div>
							</div>
						</div>
						<div class="col mid_footer_right_area">
							<div class="mid_footer_right">
								<p>고객센터 ></p>
								<p>1670-2910</p>
								<p>운영시간 9시 - 18시 (주말/공휴일 휴무, 점심시간 12시 - 13시)</p>
								<span>공지사항</span> <span>문의하기</span><span>자주 묻는 질문</span>
							</div>
							<div id="mid_footer_right2">
								<p>우리은행 채무지급보증 안내</p>
								<p>번개장터㈜는 “BGZT Digital”, “BGZT Lab”, “BGZT Lab 1”, “BGZT
									Lab 2”, “BGZT 컬렉션” 상점이 판매한 상품에 한해, 고객님이 현금 결제한 금액에 대해 우리은행과
									채무지급보증 계약을 체결하여 안전거래를 보장하고 있습니다.</p>
								<p>서비스 가입사실 확인</p>
								<p>Ⓒ Bungaejangter. Inc All rights reserved.</p>
							</div>
						</div>
						<div id="bot_footer_area">
							<div class="bot_footer_left">
								<div>
									<img src="images/market/footer_img.png" alt="footer이미지">
								</div>
								<p>
									[인증범위] 번개장터 중고거래 플랫폼 서비스 운영(심사받지 않은 물리적 인프라 제외)<br> [유효기간]
									2021.05.18 ~ 2024.05.17
								</p>
							</div>
							<div class="bot_footer_right">
								<p>“BGZT Digital”, “BGZT Lab”, “BGZT Lab 1”, “BGZT Lab 2”,
									“BGZT 컬렉션” 상점의 판매상품을 제외한 모든 상품들 에 대하여, 번개장터㈜는 통신판매중개자로서 중고거래마켓
									번개장터의 거래당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- // footer 영역 -->
		</div>

		<!-- 몇일 전 계산하는 거   -->
		<script>
			var registerDate = new Date("${list.register_date}");
			var currentDate = new Date();
			var timeDiff = Math.abs(currentDate.getTime()
					- registerDate.getTime());
			var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

			document.getElementById("daysAgo").textContent = diffDays + "일전";
		</script>

		<script type="text/javascript">
		window.onload= function(){
			
		}
		</script>

<!-- 바로구매 누르면 서브밋 -->
		<script>
			document.getElementById("purchaseLink").addEventListener("click",
					function() {
						document.getElementById("paymentForm").submit();
					});
		</script>
		
		
		<script>
		    document.addEventListener('DOMContentLoaded', function() {
		        var btn = document.querySelector('.info_btn1');
		        var heartImg = btn.querySelector('img');
		        
		        btn.addEventListener('click', function() {
		            btn.classList.toggle('clicked');
		            heartImg.src = btn.classList.contains('clicked')
		            ? 'images/goods/f_heart.svg'
		            : 'images/goods/w_heart.svg';
		        });
		    });
		    let likeCount = 0;
		   function toggleSelected(element) {
		        element.classList.toggle("selected");
		        // 찜 횟수 업데이트
		        const likeCountElement = document.getElementById("likeCount");
		        if (element.classList.contains("selected")) {
		            likeCount++;
		        } else {
		           likeCount--;
		        }
		        likeCountElement.textContent = likeCount;
	   		 }  
   
   
		</script>
		
		
		<script type="text/javascript">
		$(document).on("click", ".info_btn1", function() {
			var lovecheck ;
			if(${lovecheck} == true){
				
				lovecheck = "true";
				
			} else if(${lovecheck} == false){
				
				lovecheck = "false";
				
				
			}
	
			/* 	alert(lovecheck); */
			    var params = "product_id=" + String(${product_id}) +"&lovecheck="+lovecheck + "&love_count="+String(${love_count});
			      alert(params);  
				
			   
			    $.ajax({
			        url: "/bungae/loveUpdate.ajax",
			        type: "POST",
			        data: params,
			        cache: false,
			        success: function(data, textStatus, jqXHR) {
			            // 찜 버튼 클릭 시 동작
			            // ...
			/*             alert("성공"); */
			        },
			        error: function() {
			            alert("실패");
			        }
			    })
			    /* location.reload(true); */
			});
				   
			
			</script>
		
		
		
		<!-- 로그아웃 처리 -->
	<script type="text/javascript">
	$("#logout").on("click", function() {
	    $.ajax({
	         url: "/bungae/logout.ajax", // 실제 로그아웃 페이지 URL로 대체해야 함
	         type: "POST", // 로그아웃 메커니즘에 맞는 적절한 HTTP 메서드 사용
	         
	         success: function(response) {
	           alert("세션 삭제 완료");
	           window.location.reload(); // 로그아웃 후 페이지 새로고침
	           //showModal();
	         },
	         error: function(xhr, status, error) {
	           alert("에러~~~");
	         }
	    });
	});
	
	function showModal() {
		//모달창 표시하는 코드 작성
		$(".join_modal_wrap").removeClass("hidden");
	}
	</script>  
	
	<script>
		function openJoinModal() {
			$(".join_modal_wrap").removeClass("hidden");
		}
	</script>
	
	<script>
		document.getElementById("followButton").addEventListener("click", function() {
        // hello.jsp로 페이지 리디렉션
        window.location.href = "hello.jsp";
		});
		
		document.getElementById("writereviewbtn").addEventListener("click", function() {
			window.location.href = "hello.jsp";
		});
		
		document.getElementById("bgbutton").addEventListener("click", function() {
	        // hello.jsp로 페이지 리디렉션
	        window.location.href = "hello.jsp";
		});
		
		document.getElementById("ibuy").addEventListener("click", function() {
	        // hello.jsp로 페이지 리디렉션
	        window.location.href = "hello.jsp";
		});
		</script>
		
		<script>
         $(function(){
         $("#butt").click(function(e) {
         var $button = $(this);
         var $image = $("#follow_img");
                                           
          if ($button.hasClass("active")) {
           // 이미 활성화된 상태이면 원래대로 돌아가도록 처리
           $button.removeClass("active");
          $image.attr("src", "images/goods/follow.png");
           $button.css("color", "#888");
           $button.css("border", "#888");
         } else {
          // 비활성화된 상태이면 이벤트 처리
           $button.addClass("active");
           $image.attr("src", "images/colorPeople.png");
           $button.css("color", "rgb(246, 68, 72)");
           $button.css("border", "1px solid rgb(246, 68, 72)");
         }
          })
          });
        </script>
</body>
</html>