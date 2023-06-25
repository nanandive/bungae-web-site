<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<style>


#side_bar:hover {
  display: none;
}

.all_goods_show_status .show {
  /* 여기에 원하는 스타일을 추가하세요 */
  
  
    width: 150px; /* 원하는 너비 값으로 설정 */
  height: 40px; /* 원하는 높이 값으로 설정 */
     
    height: 3rem;
    display: flex;
    border: 1px solid rgb(195, 194, 204);
    border-radius: 2px;
}

/* 두 번째 셀렉트 클래스 스타일 변경 */
.all_goods_show_num .all_goods_show_num {
  /* 여기에 원하는 스타일을 추가하세요 */
  
    width: 150px; /* 원하는 너비 값으로 설정 */
  height: 40px; /* 원하는 높이 값으로 설정 */

 
    height: 3rem;
    display: flex;
    border: 1px solid rgb(195, 194, 204);
    border-radius: 2px;
}

select-text {
  font-family: Arial, sans-serif; /* Specify font-family */
  font-size: 14px; /* Specify font-size */
  color: #333; /* Specify text color */
}

.select-text option {
  font-weight: normal; /* Specify font-weight */
}
.all_goods_show_status {
  margin-left: 20px; /* Add margin-bottom to create space between the sections */
}
.all_goods_show_num{
margin-left: 10px;
}

/* .all_goods_show_num {
  margin-top: 20px; /* Add margin-top to create space above the section */
} */

</style>




<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>번개장터 | 상품등록</title>
<link rel="shortcut icon" href="images/market/favicon.ico">

<!--아이콘-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!--부트스트랩-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script defer
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 공통 CSS -->
<link rel="stylesheet" href="css/market/common.css">

<!--CSS-->
<link rel="stylesheet" href="css/market/market_manage.css">
<link rel="stylesheet" href="css/market/join.css">

<!-- 햄버거 메뉴 호버시 -->
<script src="js/market/jquery-3.6.0.min.js"></script>
<script src="js/market/menu_hover.js"></script>
<script src="js/market/login_modal.js"></script>
<script src="js/market/market_manage.js"></script>

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
function openMemberPage() {
    window.location.href = "member.jsp";
 }
 
function openLoginPage() {
   window.location.href = "hello.jsp";
}
</script>
<script>
    const goodsNumOptions = document.getElementById('goods_num_options');
    const goodsStatusOptions = document.getElementById('goods_status_options');

    goodsNumOptions.style.display = 'none';
    goodsStatusOptions.style.display = 'none';

    function toggleOptions(element) {
        if (element.style.display === 'none') {
            element.style.display = 'block';
        } else {
            element.style.display = 'none';
        }
    }

    const allGoodsNum = document.querySelector('.all_goods_num');
    const allGoodsStatus = document.querySelector('.all_goods_status');

    allGoodsNum.addEventListener('click', function() {
        toggleOptions(goodsNumOptions);
    });

    allGoodsStatus.addEventListener('click', function() {
        toggleOptions(goodsStatusOptions);
    });
</script>

<!-- <script type="text/javascript">
var request = newXMLHttpRequest();
function searchFunction(){
request.open("post","UserSearchHandler?productName=" + encodeURI.Component(document.getElementById("userName").value),true);
request.onreadystatechange=searchProcess;
request.send(null);
}

function.searchProcess(){
		var table= document.getElementById("ajaxTable")
		table.innerHTML="";
		if(request.readyState =4 && request.staus=200){
			var object = eval('('+request.responseText+')');
			var result = object.result;
			for(var i=0; i <result.length;i++){
				var row = table.insertRow(0);
				for(var j =0; j<result[i].length; j++){
				var cell = row.insertCell(j);
				cell.innerHTML = result[i][j].value;
			}
			}
		}
}
</script>
 --><!-- 
<script type="text/javascript">
    function searchFunction() {
        var request = new XMLHttpRequest(); // 올바른 XMLHttpRequest 생성
        request.open("post", "UserSearchHandle?title=" + encodeURIComponent(document.getElementById("userName").value), true);
        request.onreadystatechange = searchProcess;
        request.send(null);
    }

    function searchProcess() {
        var table = document.getElementById("ajaxTable");
        table.innerHTML = "";
        if (request.readyState === 4 && request.status === 200) {
            var object = JSON.parse(request.responseText); // JSON 데이터 파싱
            var result = object.result;
            for (var i = 0; i < result.length; i++) {
                var row = table.insertRow(0);
                
                for (var i=0; i<result.length; i++){
                	var row = table.insertRow(0);
                	for(var j=0; j< result[i].length; j++){
                		var cell = row.insertCell(j);
                		cell.innerHTML =result[i][j].value;
                	}
                }
                	}
                	
                	
                }
  
</script>

 -->
</head>
<body>
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
																<a href="login.jsp" class="drop">내계정</a> <a href="customer_service.jsp" class="drop" style="margin-bottom: 20px;">고객센터</a>
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
																<a href="myPage.jsp" class="drop">내계정</a> <a href="customer_service.jsp" class="drop" style="margin-bottom: 20px;">고객센터</a>
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
							<a href="index.do"> <img src="images/market/logo.svg" alt="번개장터 로고">
							</a>
						</div>
						<div class="col-6 top_searh_area">
							<div id="top_searh">
							
							
						<!-- 	예지검색 기능 -->
							
								<input class="form-control" id="title" onkeyup="searchFunction('${store.title}')"type="text" placeholder="상품명 입력"> <img
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
							<a href="#"> <img src="images/market/talk.png" alt="번개톡">
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
                                <c:forEach var="mediumClass" items="${mediumClasses}" begin="1" end="9">
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
			<!--하위 메뉴-->
			<nav class="content_nav">
				<a href="goods_selling_form.html">상품등록</a> <a
					href="market_manage.html" class="active">상품관리</a> <a
					href="goods_buy_history.html">구매/판매 내역</a>
			</nav>
			<!-- main_content 영역 -->
<section class="goods_filter_area">
	<form class="my_goods_search">
		<input type="text" name="goodsTitle" placeholder="상품명을 입력해주세요">
		<button type="button">
			<i class="fas fa-search"></i>
		</button>
	</form>
<section class="all_goods_show_status">
	<select class="show all_goods_status">
		<li class="show all_goods_num"><span>10개씩</span><span class="gray_arrow"></span></li>
		<div>
			<option class="option" value="전체">전체</option>
			<option class="option" value="판매 중">판매 중</option>
			<option class="option" value="예약 중">예약 중</option>
			<option class="option" value="판매완료">판매완료</option>
		</div>
	</select>
</section>

<section class="all_goods_show_num">
	<select class="all_goods_show_num">
		<li class="show all_goods_num"><span>10개씩</span><span class="gray_arrow"></span></li>
		<div>
			<option class="option" value="10">10개씩</option>
			<option class="option" value="20">20개씩</option>
			<option class="option" value="50">50개씩</option>
			<option class="option" value="1000">100개씩</option>
		</div>
	</select>
</section>
</section>



		<section class="goods_manage_area">
			<!--상품 정보 출력-->
			<table>
				<thead>
					<tr>
						<th>사진</th>
						<th>판매상태</th>
						<th>상품명</th>
						<th>가격</th>
						<th>안전결제 환영</th>
						<th>찜</th>
						<th>최근수정일</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody id="ajaxTable">
 <c:forEach var="store" items="${stores}" varStatus="status">
        <tr>
            <td><img src="${store.image_path}" alt="상품 사진"></td>
            <td>${store.status}</td>
            <td><a href="goods_product_detail.html">${store.title}</a></td>
            <td>${store.price}원</td>
            <td>${store.safety_sell}</td>
            <td>${loveCounts[status.index]}</td>
            <td id="a">${store.register_date}</td>
            <td>
                <button onclick="showAlert(아직구현못함)">UP</button> <br>
                <p id="message"></p> <a href="">수정</a>
            </td>
        </tr>
    </c:forEach> 
</tbody>


			</table>
			
			
			
		</section>
		<section class="paging">
			<a href="#" class="active_page">1</a>
		</section>
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
		
		<script type="text/javascript">
		$("#logout").on("click", function() {
			$.ajax({
				 url: "/bungae/logout.ajax", // 실제 로그아웃 페이지 URL로 대체해야 함
				 type: "POST", // 로그아웃 메커니즘에 맞는 적절한 HTTP 메서드 사용
				 
				 success: function(response) {
				   alert("세션 삭제 완료");
				   //showModal(); // 모달창 표시 함수 호출
				   window.location.href="index.do";
				 },
				 error: function(xhr, status, error) {
				   alert("에러~~~");
				 }
			});
		});
		
		function showModal() {
			// 모달창 표시하는 코드 작성
			$(".join_modal_wrap").removeClass("hidden");
		}
	</script>
</body>
</html>