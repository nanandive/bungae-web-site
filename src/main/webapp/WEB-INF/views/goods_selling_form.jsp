<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="util.CharacterEncodingFilter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="css/market/join.css">

<!--CSS-->
<link rel="stylesheet" href="css/goods/goods_selling_form.css">
<!-- 햄버거 메뉴 호버시 -->
<script src="js/market/jquery-3.6.0.min.js"></script>
<script src="js/market/menu_hover.js"></script>
<script src="js/market/login_modal.js"></script>
<script src="js/goods/goods_selling_form.js"></script>

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
<script>
function openMemberPage() {
    window.location.href = "member.jsp";
 }
 
function openLoginPage() {
   window.location.href = "login.jsp";
}
</script>
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
                     <%
                        if( session.getAttribute("member_id") == null ) {
                     %>
                     <div class="col-4">
                        <div class="row justify-content-end top_header_login">
                           <div class="col-4">
                              <a href="#" class="btn_map_close"> 로그인/회원가입 </a>
                           </div>
                           <div class="col-4">
                              <div class="dropdown">
                                    <a href="login.jsp" class="dropbtn">내상점<i
                                       class="fas fa-sharp fa-solid fa-caret-down"></i></a>
                                    <div class="dropdown-content">
                                       <a href="login.jsp" class="drop">내상품</a> <a href="login.jsp" class="drop">찜한상품</a>
                                       <a href="login.jsp" class="drop">내계정</a> <a href="login.jsp" class="drop"
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
                                    <a href="market_my_store.do" class="dropbtn">내상점<i
                                       class="fas fa-sharp fa-solid fa-caret-down"></i></a>
                                    <div class="dropdown-content">
                                       <a href="market_my_store.do" class="drop">내상품</a> <a href="market_my_store.do" class="drop">찜한상품</a>
                                       <a href="myPage.jsp" class="drop">내계정</a> <a href="customer_service.jsp" class="drop"
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
                  <!-- 판매하기 구분선 -->
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
                  <!-- 판매하기 구분선 -->
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

      <!--메인 컨텐츠-->
      <div id="main_content">
         <!--하위 메뉴-->
         <nav class="content_nav">
            <a href="goods_selling_form.html" class="active">상품등록</a> <a
               href="market_manage.html">상품관리</a> <a
               href="goods_buyer_ordersheet.html">구매/판매 내역</a>
         </nav>

         <!--판매 폼-->


         <section class="goods_form">
            <h2>
               기본정보 <span class="red">*필수항목</span>
            </h2>




            <!-- form 태그 시작 -->
            <form action="goods_selling_form.do" class="frm_selling_goods"  enctype="multipart/form-data"
                method="get">


               <input type="hidden" name="member_id" value="${member_id}">
               <input type="hidden" name="filename">
            

               <div class="goods_images_area">
                  <p>
                     상품이미지<span class="red">*</span> <span class="image_limit">(<span
                        class="image_num"></span>/1)
                     </span>
                  </p>
                  <div>
                     <div class="goods_images">

                        <!-- 업로드 공부 전 @@@@ -->
                        <div>
                           이미지 등록 <input type="file"  id="upload"
                              accept="image/jpg, image/jpeg, image/png" multiple
                              onchange="setImages(event);">
                        </div>  
                  <!--       
                        <div>
                           이미지 등록 <input type="file" name="uploadFile" multiple="multiple"    accept="image/jpg, image/jpeg, image/png">
                        </div> -->




                        <div class="preview_wrap"></div>
                     </div>
                     <div class="goods_images_notice">
                        <b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b><br> - 상품 이미지는 PC에서는
                        1:1, 모바일에서는 1:1.23 비율로 보여집니다.<br> - 이미지는 상품 등록 시 정사각형으로 잘려서
                        등록됩니다.<br> - 이미지를 클릭할 경우 원본 이미지를 확인할 수 있습니다.<br> -
                        이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br> - 큰 이미지일 경우 이미지가 깨지는
                        경우가 발생할 수 있습니다.<br> 최대 지원 사이즈인 640 X 640으로 리사이즈 해서
                        올려주세요.(개당 이미지 최대 10M)
                     </div>
                  </div>
               </div>
               <div class="goods_title_area">
                  <p>
                     제목<span class="red">*</span>
                  </p>
                  <div class="goods_title">
                     <input type="text" name="goodsTitle" id="title" maxlength="40"
                        placeholder="상품 제목을 입력해주세요." value="제목"
                        oninput="countTitleLength(event);"><a href="#">거래금지
                        품목</a> <span class="goods_title_length"><span></span>/40</span>
                  </div>
               </div>
                  <div class="goods_category_area">
                    <p>
                     카테고리<span class="red">*</span>
                  </p>
                  <div>
                     <div class="goods_category">
                        <div class="goods_Lcategory" style="overflow-y: auto;">
                        <c:forEach var="largeClass" items="${largeClasses}">
                           <div id="${largeClass.large_id }" class="${largeClass.large_id }">${largeClass.large_name}</div>
                        </c:forEach>
                        </div>
                        <div class="goods_Scategory" >중분류 선택</div>
                        <div class="goods_Scategory_cloth hidden">
                           <div>남성의류</div>
                           <div>여성의류</div>
                        </div>
                        <div class="goods_Scategory_acc hidden" style="overflow-y: auto;">
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="0" end="9">
                           <div class="girls" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="10" end="16">
                           <div class="boys" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="17" end="20">
                           <div class="shoes" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="21" end="26">
                           <div class="bag" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="27" end="29">
                           <div class="watch" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="30" end="36">
                           <div class="jewelry" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="37" end="45">
                           <div class="fashion" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="46" end="53">
                           <div class="digital" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="54" end="62">
                           <div class="appliances" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        <c:forEach var="mediumClass" items="${mediumClasses}" begin="63" end="82">
                           <div class="sports" style="display: none;" id="${mediumClass.medium_id}">${mediumClass.medium_name}</div>
                        </c:forEach>
                        </div>
                        
                        <script>
                        $(document).ready(function() {
                          /*   $('.goods_Lcategory').on('click', 'div', function() {
                                  //var selectedLargeCategory = $(this).attr('id');
                                  var selectedLargeName = $(this).text();
                                  //alert(selectedLargeName);
                                  // 변경된 값으로 hidden input 업데이트
                                  $('#first').attr('name', "Large_name");
                                  $('#first').attr('value', selectedLargeName);
                                });
                           
                            $('.goods_Scategory_acc').on('click', 'div', function() {
                                  var selectedMediumCategory = $(this).text();
                                  
                                 // alert(selectedMediumCategory);
                                  // 변경된 값으로 hidden input 업데이트
                                  $('#second').attr('name', 'medium_name');
                                  $('#second').attr('value', selectedMediumCategory);
                                }); */
                           
                           $(".1").click(function(e) {
                              $(".girls").css("display", "block");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "none");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "none");
                           })
                           
                           $(".2").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "block");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "none");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "none");
                           })
                           
                           $(".3").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "block");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "none");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "none");
                           })
                           
                           $(".4").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "block");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "block");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "none");
                           })
                           $(".5").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "block");
                              $(".jewelry").css("display", "none");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "none");
                           })
                           $(".6").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "block");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "none");
                           })
                           $(".7").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "none");
                              $(".fashion").css("display", "block");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "none");
                           })
                           $(".8").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "none");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "block");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "none");
                           })
                           $(".9").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "none");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "block");
                              $(".sports").css("display", "none");
                           })
                           $(".10").click(function(e) {
                              $(".girls").css("display", "none");
                              $(".boys").css("display", "none");
                              $(".shoes").css("display", "none");
                              $(".bag").css("display", "none");
                              $(".watch").css("display", "none");
                              $(".jewelry").css("display", "none");
                              $(".fashion").css("display", "none");
                              $(".digital").css("display", "none");
                              $(".appliances").css("display", "none");
                              $(".sports").css("display", "block");
                           })
                        })
                        </script>
                        <%-- <div class="goods_Scategory_acc hidden" style="overflow-y: auto;">
                        <c:forEach var="smallClass" items="${smallClasses}">
                           <div>${smallClass.small_name}</div>
                        </c:forEach>
                           <!-- <div>시계/쥬얼리</div>
                           <div>패션악세서리</div> -->
                        </div> --%>
                     </div>
                     <p class="hidden">
                        <span>⊘</span> 상세 카테고리를 확인해주세요
                     </p>
                     <p>
                        선택한 카테고리 : <span class="selected_category"></span>
                     </p>


                     <!-- 카테고리넘길때 일단 시험  -->
                     <input type="hidden" name="large_id"> <input
                        type="hidden" name="medium_id" >
                        <script>
                        $(document).ready(function() {
                            $('.goods_Lcategory div').click(function() {
                              var largeId = $(this).attr('id');
                              //largeId = largeId.split(' ')[0];
                              //alert(largeId);
                              $('input[name="large_id"]').val(largeId);
                            });
                            $('.goods_Scategory_acc div').click(function() {
                                var mediumId = $(this).attr('id');
                              //alert(mediumId);
                                $('input[name="medium_id"]').val(mediumId);
                              });
                          });

                        </script>
                  </div>


               </div>
               <div class="goods_location_area">
                  <p>
                     거래지역<span class="red">*</span>
                  </p>
                  <div class="goods_location">
                     <div class="location_button_area">
                        <button onclick="return false;">내위치</button>
                        <button onclick="return false;">주소검색</button>
                        <button onclick="return false;">지역설정안함</button>
                     </div>

                  
                     <input type="text" name="tradearea" value="안양시" >
                  </div>
               </div>
               <div class="goods_status_area">
                  <p>
                     상태<span class="red">*</span>
                  </p>
                  <div class="goods_status">
                     <input type="radio" name="status" id="used" checked="checked"
                        value="중고상품"> <label for="used">중고상품</label> <input
                        type="radio" name="condition" value="새상품" id="new"> <label
                        for="new">새상품</label>
                  </div>
               </div>
               <div class="goods_change_area">
                  <p>
                     교환<span class="red">*</span>
                  </p>
                  <div class="goods_change">
                     <input type="radio" name="exchange" id="unable" checked="checked"
                        value="교환여부"> <label for="unable">교환불가</label> <input
                        type="radio" name="exchange" value="able" id="able"> <label
                        for="able">교환가능</label>
                  </div>
               </div>
               <div class="goods_price_area">
                  <p>
                     가격<span class="red">*</span>
                  </p>
                  <div class="goods_price">
                     <p>
                        <input type="text" name="price" value=12327
                           placeholder="숫자만 입력해주세요" oninput="valueIsNumber(event)">원
                     </p>
                     <input type="checkbox" name="deliveryPrice" id="deliveryPrice">
                     <label for="deliveryPrice">배송비 포함</label>
                  </div>
               </div>
               <div class="goods_info_area">
                  <p>
                     설명<span class="red">*</span>
                  </p>
                  <div>
                     <textarea name="description" id="goodsInfo" cols="30" rows="10"
                        maxlength="2000" oninput="countInfoLength(event)">내용</textarea>
                     <div class="goods_info_warn">
                        <span>혹시 <a href="#" onclick="return false;">카카오톡ID</a>를
                           적으셨나요?

                        </span> <span class="info_length"><span></span>/2000</span>
                     </div>
                  </div>
               </div>
               <div class="goods_tag_area">
                  <p>연관태그</p>
                  <div>
                     <div class="goods_tag">
                        <div class="tag_button hidden" onclick="tagDelete(event);">
                           <button onclick="return false;">#태그1</button>
                           <button onclick="return false;">
                              <i class="fas fa-times"></i>
                           </button>
                        </div>
                        <input type="text" name="tag" id="tag" value="태그"
                           placeholder="연관태그를 입력해주세요. (최대5개)">
                     </div>
                     <p>
                        - 태그는 띄어쓰기로 구분되며 최대 9자까지 입력할 수 있습니다.<br> - 태그는 검색의 부가정보로 사용
                        되지만, 검색 결과 노출을 보장하지는 않습니다.<br> - 상품과 직접 관련이 없는 다른 상품명, 브랜드,
                        스팸성 키워드 등을 입력하면 노출이 중단되거나 상품이 삭제될 수 있습니다.<br>
                     </p>
                  </div>
               </div>
               <div class="goods_count_area">
                  <p>수량</p>
                  <p>
                     <input type="text" name="amount" value="1"
                        oninput="valueIsNumber(event)" style="width: 800px;">  개
                  </p>
               </div>
               <!--번개페이 뻐른 판매-->
               <div class="fast_selling_area">
                  <h2>
                     빠른 판매 <span>내 상품에 안전결제 배지가 표시돼요 <a href="#">자세히</a></span>
                  </h2>
                  <div class="goods_option_area">
                     <p>옵션</p>
                     <div class="goods_option">
                        <div class="checkbox_safePay">
                           <input type="checkbox" name="safety_sell" id="safePay"
                              value="안전결제" checked="checked"> <label for="safePay">
                              안전결제 환영 <svg width="60" height="24" viewBox="0 0 35 16"
                                 role="img">
                                            <rect width="35" height="16"
                                    rx="2" fill="#D80C18" />
                                            <path
                                    d="m9.226 3.003-.56 4.563h2.325a.05.05 0 0 1 .036.083l-5.024 5.388c-.033.035-.091.008-.085-.04l.56-4.563H4.153a.05.05 0 0 1-.036-.083L9.14 2.963a.05.05 0 0 1 .085.04zm11.803.706v8.59h-1.306V3.71h1.306zm8.447 0v8.59h-1.345V3.71h1.345zm-10.265.048v8.38h-1.288V8.138h-.776V6.875h.776V3.757h1.288zm5.398-.02c.353 0 .677.05.97.149.294.099.548.25.763.455.214.203.385.458.511.765.126.306.199.663.218 1.071a30.552 30.552 0 0 1 0 3.052 3.16 3.16 0 0 1-.218 1.076 2.2 2.2 0 0 1-.511.76 2.037 2.037 0 0 1-.762.455 3.031 3.031 0 0 1-.971.148c-.714 0-1.291-.2-1.733-.602-.442-.402-.685-1.015-.73-1.837a95.334 95.334 0 0 1-.033-.785 19.155 19.155 0 0 1 0-1.483c.01-.248.021-.51.034-.784.044-.823.287-1.435.729-1.836.442-.403 1.02-.604 1.733-.604zm-7.084.182v1.187h-.531l-.016 5.075.614-.024v1.167l-4.47.192v-1.187l.624-.024-.017-5.2h-.531V3.92h4.327zm7.084 1.005c-.165 0-.312.027-.44.081a.814.814 0 0 0-.337.268c-.095.124-.17.288-.227.492-.057.205-.095.46-.114.766-.025.376-.038.767-.038 1.172 0 .405.013.796.038 1.172.02.306.057.561.114.765.057.204.132.368.227.493a.82.82 0 0 0 .336.268c.13.054.276.08.44.08.165 0 .312-.026.44-.08a.82.82 0 0 0 .337-.268c.095-.125.17-.289.228-.493.056-.204.094-.46.113-.765a17.748 17.748 0 0 0 0-2.343 3.805 3.805 0 0 0-.113-.767 1.454 1.454 0 0 0-.228-.492.814.814 0 0 0-.336-.268 1.127 1.127 0 0 0-.44-.081zm-8.894.182h-.707l.016 5.15.675-.026.016-5.124z"
                                    fill="#fff"></path>
                                        </svg>
                           </label>
                        </div>
                        <div class="safe_pay_notice">
                           <div>
                              <span class="check"></span>
                              <p>
                                 안전결제(번개페이) 요청을 거절하지 않는 대신 혜택을 받을 수 있어요. <br> <small>거절
                                    시,이용 제재가 있을 수 있으니 주의해 주세요.</small>
                              </p>
                           </div>
                           <div>
                              <span class="check"></span>
                              <p>내 상품을 먼저 보여주는 전용 필터로 더 빠르게 판매할 수 있어요.</p>
                           </div>
                           <div>
                              <span class="check"></span>
                              <p>번개페이 배지로 더 많은 관심을 받을 수 있어요.</p>
                           </div>
                        </div>
                        <p>* 번개페이 배지와 전용 필터 기능은 앱 또는 모바일 웹에서만 볼 수 있어요.</p>
                     </div>
                  </div>
               </div>
         </section>
      </div>


      <!-- footer 영역 -->
      <div class="btn_submit_area">
         <div class="inner_submit">
            <!--폼으로 등록 테스트 하실 때 type=submit으로 바꿔서 진행해주세요-->
            <input type="submit" class="btn_goods_submit" value="등록하기">
         </div>
      </div>
      </form>
      <!-- form -->


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

   <!-- 로그아웃 처리 -->
   <!-- 
   <script type="text/javascript">
   $("#logout").on("click", function() {
       $.ajax({
            url: "/bungae/logout.ajax", // 실제 로그아웃 페이지 URL로 대체해야 함
            type: "POST", // 로그아웃 메커니즘에 맞는 적절한 HTTP 메서드 사용
            
            success: function(response) {
              alert("세션 삭제 완료");
              window.location.reload(); // 로그아웃 후 페이지 새로고침
            },
            error: function(xhr, status, error) {
              alert("에러~~~");
            }
       });
   });
   </script>
    -->
   
   <!-- 로그아웃 처리 -->
   <script type="text/javascript">
      $("#logout").on("click", function() {
          $.ajax({
               url: "/bungae/logout.ajax", // 실제 로그아웃 페이지 URL로 대체해야 함
               type: "POST", // 로그아웃 메커니즘에 맞는 적절한 HTTP 메서드 사용
               
               success: function(response) {
                 alert("세션 삭제 완료");
                 showModal(); // 모달창 표시 함수 호출
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
   
   
   
   <script>
     $(function (){
        
     
        $("input[id='upload']").on("change", function (event){
           // HTML5          업로드할파일정보를 가지고 있는 객체
           var formData = new FormData();
           var inputFile = $("input[id='upload']");
           var files = inputFile[0].files;
           
           
           //console.log(files)
           for (var i = 0; i < files.length; i++) {
           
            formData.append("uploadFile", files[i]);
          } // for
          
          //alert("hello");
          
          $.ajax({
             url:'/bungae/uploadAjaxAction.ajax',
             processData: false,
             contentType: false,
             data:formData,
             type:'POST',
             dataType:'json',
             success: function ( data ){
                alert("업로드 성공");
               
               
                var fileName = data[0].fileName;
                var uuid = data[0].uuid;
   
                
               var uploadPath = data[0].uploadPath; 
               
              /* alert(uuid+'_'+fileName); */
              
            /* $("input[name='uploadFile']").attr("value", uuid + '_' + fileName);  */
                $("input[name='filename']").attr("value", uploadPath);  
                
             }, 
            error: function() {
            alert("업데이트 실패")
         }
          }); // $.ajax
        });
     });
   </script>

   S



</body>
</html>