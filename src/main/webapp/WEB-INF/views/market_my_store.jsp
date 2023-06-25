<%@page import="java.util.List"%>
<%@page import="util.CharacterEncodingFilter"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 상점</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 공통 CSS -->
<link rel="stylesheet" href="css/market/common.css">
<!-- 내 상점 페이지 CSS -->
<link rel="stylesheet" href="css/market/market_my_store.css">




<!-- 햄버거 메뉴 호버시 -->
<script src="js/market/jquery-3.6.0.min.js"></script>
<script src="js/market/menu_hover.js"></script>
<!-- 파비콘 -->
<link rel="icon" href="images/market/favicon.ico">
<!-- 소개글 수정 -->
<script src="js/market/market_intro_modify.js"></script>

<!--css-->
<link rel="stylesheet" href="css/market/common.css">
<link rel="stylesheet" href="css/market/join.css">
<link rel="stylesheet" href="css/market/market_category.css">

<!--js-->
<script src="js/market/jquery-3.6.0.min.js"></script>
<script src="js/market/menu_hover.js"></script>
<script src="js/market/login_modal.js"></script>
<script src="js/goods/goods_detail_menu.js"></script>

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

</style>
<style>
#my-button {
   padding: 0px 10px;
   height: 30px;
   border: 1px solid rgb(238, 238, 238);
   display: flex;
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   font-size: 13px;
   background: rgb(255, 255, 255);
   color: rgb(102, 102, 102);
   margin-top: 10px
}

#store-review {
   text-align: left;
   color: rgb(33, 33, 33);
   letter-spacing: -0.5px;
   font-weight: bold;
}

#ban {
   margin-top: 200px
}

#ban-font {
   font-size: 13px;
   color: rgb(102, 102, 102);
   margin-top: 20px .image-container{
            display: flex;
   justify-content: space-between;
}

.image-container img {
   margin-top: 15px;
    margin-left: 500px;
   
}
</style>
<script>

        var imageCount = 5 ; // 이미지의 개수를 변수로 선언 
        var imageSize = 15; // 이미지의 크기를 변수로 선언
        
        window.addEventListener('load', function() {

           
           
           var container = document.getElementById('container');
            
           
           
            for (var i = 0; i < imageCount; i++) {
                var img = document.createElement('img');
                img.src = 'images/star.png';
                img.style.width = imageSize + 'px';
                img.style.height = imageSize + 'px';
                img.style.marginTop = '15px';
                
                container.appendChild(img);
            }
            
            var images = container.getElementsByTagName('img');
            
            for (var j = 0; j < images.length; j++) {
                images[j].style.marginRight = '10px'; // 이미지 사이의 간격을 조정할 수 있습니다.
            }
        });
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
        <!-- 여기서 부터 수정 시작함 -->
        <%
        if (session.getAttribute("member_id") == null) {
        %>
   <div class="col-4">
                        <div class="row justify-content-end top_header_login">
                           <div class="col-4">
                              <a href="#" class="btn_map_close"> 로그인/회원가입 </a>
                           </div>

                           <div class="col-4">
                              <div class="dropdown-container">
								<div class="dropdown">
									<a href="market_my_store.do" class="dropbtn">내상점<i
										class="fas fa-sharp fa-solid fa-caret-down"></i></a>
										<div class="dropdown-content">
											<a href="login.jsp" class="drop">내상품</a> <a href="login.jsp" class="drop">찜한상품</a>
												<a href="login.jsp" class="drop">내계정</a> <a href="customer.do" class="drop" style="margin-bottom: 20px;">고객센터</a>
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
									<a href="market_my_store.do" class="dropbtn">내상점<i
										class="fas fa-sharp fa-solid fa-caret-down"></i></a>
										<div class="dropdown-content">
											<a href="market_my_store.do" class="drop">내상품</a> <a href="market_my_store.do" class="drop">찜한상품</a>
												<a href="myPage.jsp" class="drop">내계정</a> <a href="customer.do" class="drop" style="margin-bottom: 20px;">고객센터</a>
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
				        if (session.getAttribute("member_id") == null) {
				        %>
						<div class="col-1 b_h_left_menu">
							<a href="login.jsp"> <img
								src="images/market/sell.png" alt="판매하기"> 판매하기
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
							<a href="goods_selling_form_page.do"> <img
								src="images/market/sell.png" alt="판매하기"> 판매하기
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
						<!-- 
						메뉴 호버
						<div id="test_area">
							<ul id="test_cates">
								<h2>
									전체 카테고리<span> ></span>
								</h2>
								<li id="clothes"><a href="#">의류</a></li>
								<li id="acc"><a href="#">악세서리</a></li>
							</ul>
							<ul id="test_clos">
								<h3>의류</h3>
								<li><a href="#">남성의류</a></li>
								<li><a href="#">여성의류</a></li>
							</ul>
							<ul id="test_accs">
								<h3>악세서리</h3>
								<li><a href="#">시계/쥬얼리</a></li>
								<li><a href="#">패션 악세서리</a></li>
							</ul>
						</div>
						// 메뉴 호버
						 -->
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


		<!-- main_content 영역 -->
		<div id="main_content">
			<!-- 내 상점명 -->
			<div id="my_store_area">
				<div class="my_store_left">
					<div>
						<img src="images/market/store.svg" alt="내 상점">
					</div>
					<div>
						<p>상점명</p>
						<p>
							<img src="images/market/star.png" alt="별점"> <img
								src="images/market/star.png" alt="별점"> <img
								src="images/market/star.png" alt="별점"> <img
								src="images/market/star.png" alt="별점"> <img
								src="images/market/star.png" alt="별점">
						</p>
					</div>
					<div>
						<p>
							<a href="manage.do">내 상점 관리</a>
						</p>
					</div>
				</div>

				<div class="my_store_right">
					<div id="my_store_right_top">
						<div>
							<h2>${myShop.member_id }</h2>
							<button>상점명 수정</button>
						</div>

						<div>
							<p>
								<span>OK</span> 본인인증 완료
							</p>
						</div>
					</div>

					<div id="my_store_right_mid">
						<div>
							<p>
								<img src="images/market/store_open.png" alt="상점 오픈일">
							</p>
							<p>
								상점오픈일 <span>${myShop.regdate}</span>
							</p>
						</div>
						<div>
							<p>
								<img src="images/market/people.png" alt="상점 방문수">
							</p>
							<p>
								상점방문수 <span>${myShop.visitor_cnt }명</span>
							</p>
						</div>
						<div>
							<p>
								<img src="images/market/product_sell.png" alt="상품판매">
							</p>
							<p>
								상품판매 <span>${myShop.sell_cnt } 회</span>
							</p>
						</div>
						<div>
							<p>
								<img src="images/market/parcel_service.png" alt="택배발송">
							</p>
							<p>
								택배발송 <span>${myShop.delivery_cnt }</span>
							</p>
						</div>
					</div>


					<div id="my_store_right_bot">
						<!-- 소개글 부분 -->
						<!-- 		<div id="intro_modify">
							<button>소개글 수정</button>
						</div> -->
                        <%-- 
						<input type="hidden" id="id" value="${myShop.introduce}" />
						 --%>
						<div class="text_area">
							<textarea id="intro">${myShop.introduce}</textarea>
							<button type="button"id="btnIntroModify" >확인</button>
						</div>
						<div id="intro_modify">
							<button type="button" onclick="setFocusToTextarea()">소개글
								수정</button>
						</div>

					</div>


				</div>
			</div>

			<!-- 클릭 시 포커스  -->
			<script>
				function setFocusToTextarea() {
					var textarea = document
							.querySelector('textarea[name="intro"]');
					textarea.focus();
				}
			</script>
			<!-- // 내 상점명 -->

			<!-- 내 상점 메뉴 -->
			<div id="my_store_menu">
				<div class="container text-center menu_bar">
					<div class="row">
						<div class="col my_store_menus goods_menu">
							상품 <span>${fn:length(list)}</span>
						</div>
						<div class="col my_store_menus review_menu">
							상점후기 <span>${fn:length(reviewList)}</span>
						</div>
						<div class="col my_store_menus recommend_menu">
							찜 <span>${fn:length(loveProduct) }</span>
						</div>
						<div class="col my_store_menus follower_menu">
							팔로잉 <span>${followingCount}</span>
						</div>
						<div class="col my_store_menus following_menu">
							팔로워 <span>${followCount}</span>
						</div>
					</div>
				</div>

				<div id="my_store_menu_content">
					<div id="goods_menu_area" class="common_menu">
						<div>
							<p>
								상품 <span>${fn:length(list)}</span>
							</p>
							<ul id="goods_cate">
								<li>전체</li>
								<li class="hidden_menu">전체</li>
							</ul>
							<i class="bi bi-chevron-down under_direction under"></i>
						</div>



						<div>
							<!-- 밑에 상품  목록 출력 -->
							<section class="main_goods">
								<div class="goods_wrap">

<%-- 
									<c:forEach items="${list}" var="product">
										<div class="goods">
											<a href="goods_product_detail.do?product_id=${product.product_id}&member_id=${member_id}">
												<div class="goods_image">
													<img src="${product.image_path }" width="194" height="194"
														alt="상품 이미지">

													<c:if test="${product.safety_sell == '안전결제'}">
														<img src="images/market/thunder_pay_mark.svg" alt="번개페이">
													</c:if>

												</div>
												<div class="goods_info">
                                                    <p class="goods_title">${product.title}</p>
                                                    <div class="goods_price_date">
                                                        <span class="goods_price">${product.price}원</span> <span
                                                            class="goods_date_before" id="beforeDays"></span>
                                                        <!-- 현재 날짜 계산 떄려야함  -->
                                                        <script>
															function updateBeforeDays() {
															var registerDate = new Date("${product.register_date}");
															var currentDate = new Date();
															var timeDiff = Math.abs(currentDate.getTime() - registerDate.getTime());
															var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
														
															document.getElementById("beforeDays").textContent = diffDays + "일전";
															}
															updateBeforeDays();
															//setInterval(updateBeforeDays, 1000);
														</script>
													</div>
												</div>
											</a>
										</div>
									</c:forEach> --%>
									<c:forEach items="${list}" var="product">
									   <div class="goods">
									      <a href="goods_product_detail.do?product_id=${product.product_id}&member_id=${member_id}">
									         <div class="goods_image">
									            <img src="${product.image_path}" width="194" height="194" alt="상품 이미지">
									
									            <c:if test="${product.safety_sell == '안전결제'}">
									               <img src="images/market/thunder_pay_mark.svg" alt="번개페이">
									            </c:if>
									
									         </div>
									         <div class="goods_info">
									            <p class="goods_title">${product.title}</p>
									            <div class="goods_price_date">
									               <span class="goods_price">${product.price}원</span> 
									               <span class="goods_date_before" id="daysAgo_${product.product_id}"></span>
									            </div>
									         </div>
									      </a>
									   </div>
									
									   <script>
									      var registerDate_${product.product_id} = new Date("${product.register_date}");
									      var currentDate_${product.product_id} = new Date();
									      var timeDiff_${product.product_id} = Math.abs(currentDate_${product.product_id}.getTime() - registerDate_${product.product_id}.getTime());
									      var diffDays_${product.product_id} = Math.ceil(timeDiff_${product.product_id} / (1000 * 3600 * 24));
									
									      document.getElementById("daysAgo_${product.product_id}").textContent = diffDays_${product.product_id} + "일전";
									   </script>
									</c:forEach>

								</div>
							</section>
						</div>
					</div>


					<!-- 
					<div id="review_menu_area" class="common_menu">
						<div>
							<p>
								상점후기 <span>0</span>
							</p>
						</div>
						<div>
							<p>상점후기가 없습니다.</p>
						</div>
					</div>
 					-->
 					

               		<!-- 상점 후기 -->
               		<div id="review_menu_area" class="common_menu">
               		 <c:forEach items="${reviewList}" var="review">
		              	<div class="fllow-image" style="float: left;">
		                  <a class="profile-image" href="/shop/79214830/products"> <img
		                     src="images/my_store_img.svg" width="60" height="60"
		                     alt="팔로워 프로필 이미지">
		                  </a>
		               </div>
		               <div class="store-star"
		                  style="margin-left: 80px; margin-right: 50px; margin-top: 40px;">
		                  <p class="store-name"
		                     style="font-size: 12px; margin-bottom: -10px;">${review.member_id}
		                     </p>
			                  <p>
				                  <div class="image-container" id="container"></div>
			                  </p>
			                  <p>
			                     <button id="my-button">${review.title}</button>
			                  </p>
		                  <p class="store-review" style="margin-top: 20px;">${review.review_detail }</p>
		
		                  <p class="ban" style="margin-top: 20px">
		                     <img src="images/block.png" style="width: 15px; height: 15px;"><span
		                        id="ban-font">신고하기</span>
		                  </p>
		                  
		               </div>
		               </c:forEach>
               		</div>
               		
 					

					<!-- 찜 -->
					<div id="recommend_menu_area" class="common_menu">
						<div>
							<p>
								찜 <span>${fn:length(loveProduct)}</span>
							</p>
						</div>

						<div class="product-container-wrapper"
							style="display: flex; flex-wrap: wrap;">
							<c:forEach items="${loveProduct}" var="loveProduct">
								<div class="product-container"
									style="flex-basis: 50%; height: 140px; border: 1px solid rgb(238, 238, 238); position: relative;">
									
									
									<a href="goods_product_detail.do?product_id=${loveProduct.product_id}&member_id=${loveProduct.member_id}">
									<div class="product-details" style="display: flex;">
										<div style="width: 139px; flex-shrink: 0;">
											<img src="${loveProduct.image_path}" alt="Product Image"
												class="product-image" style="width: 139px; height: 100%;">
										</div>
										<div style="margin-left: 20px; flex-grow: 1;">
											<div class="product-title"
												style="margin-bottom: 10px; height: 14px; text-overflow: ellipsis; white-space: nowrap;">${loveProduct.title}</div>
											<div class="product-price"
												style="font-size: 16px; font-weight: bold; margin-bottom: 10px;">${loveProduct.price}원</div>
											<div class="product-date"
												style="color: rgb(136, 136, 136); font-size: 12px; margin-bottom: 10px;">${loveProduct.register_date}</div>
											<div class="product-address"
												style="color: rgb(102, 102, 102); font-size: 12px;">
												<i class="fa-duotone fa-location-dot"></i>
												${loveProduct.tradeArea}
											</div>
										</div>
									</div>
									</a>
									<input type="checkbox"
										style="position: absolute; top: 20px; right: 12px;">
								</div>
							</c:forEach>
							<!-- <p>등록된 상품이 없습니다.</p> -->
						</div>
					</div>



					<!-- 찜 끝 -->



					<div id="follower_menu_area" class="common_menu">
						<div>
							<p>
								팔로잉 <span>${followingCount}</span>
							</p>
						</div>
					</div>



					<div id="following_menu_area" class="common_menu">
						<div>
							<p>
								팔로워 <span>${followCount}</span>
							</p>
						</div>
					</div>


				</div>
			</div>
			<!-- // 내 상점 메뉴 -->
		</div>
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
									<b>번개장터(주)코엑스점</b> | 최재화, 강승현 | 142-85-27412<br> 서울특별시 강남구
									영동대로 513, 쇼핑몰동 B1층 C102호(삼성동, 코엑스)<br>
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
							<p>번개장터㈜는 “BGZT Digital”, “BGZT Lab”, “BGZT Lab 1”, “BGZT Lab
								2”, “BGZT 컬렉션” 상점이 판매한 상품에 한해, 고객님이 현금 결제한 금액에 대해 우리은행과 채무지급보증
								계약을 체결하여 안전거래를 보장하고 있습니다.</p>
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

	<!-- <script>
	function updateBeforeDays() {
	var registerDate = new Date("${product.register_date}");
	var currentDate = new Date();
	var timeDiff = Math.abs(currentDate.getTime() - registerDate.getTime());
	var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

	document.getElementById("beforeDays").textContent = diffDays + "일전";
	}
	updateBeforeDays();
	//setInterval(updateBeforeDays, 1000);
	</script> -->


	<script>
	$("#btnIntroModify").on("click", function() {
	
		  var params = null;
          params = "introduce="+$("#intro").val();
		//alert( params )
		$.ajax({
			url: "/bungae/introModify.ajax",
			type: "POST",
			data: params,
			cache: false,
			success: function(data, textStatus, jqXHR) {
				alert(  data  )
			},
			error: function() {
				alert("업데이트 실패")
			}
		});
	});

	</script>
	
	<script type="text/javascript">
	$("#logout").on("click", function() {
	    $.ajax({
	         url: "/bungae/logout.ajax", // 실제 로그아웃 페이지 URL로 대체해야 함
	         type: "POST", // 로그아웃 메커니즘에 맞는 적절한 HTTP 메서드 사용
	         
	         success: function(response) {
	           alert("세션 삭제 완료");
	           //window.location.reload(); // 로그아웃 후 페이지 새로고침
	          	window.location.href="index.do";
	         },
	         error: function(xhr, status, error) {
	           alert("에러~~~");
	         }
	    });
	});
</script> 
</body>
</html>