<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- 부트스트랩 icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <!-- 고객센터 공통 CSS -->
    <link rel="stylesheet" href="css/customer_service/customer_service_common.css">
    <!-- 자주 묻는 질문 CSS -->
    <link rel="stylesheet" href="css/customer_service/customer_frequently_asked_questions.css">
    <!-- 파비콘 -->
    <link rel="icon" href="images/market/favicon.ico">

    <!-- 화면 스크롤시 -->
    <script src="js/market/jquery-3.6.0.min.js"></script>
    <script src="js/customer_service/top_show_name.js"></script>

    <!-- 타이틀 클릭시 하단 공지 변경 -->
    <script src="js/customer_service/customer_frequently_asked_questions.js"></script>
    
        <style>
        #Q {
            content: "Q";
            margin-right: 5px;
            font-weight: bold;
            color: green;
            font-size: 18px;
        }
        </style>
        
</head>
<body>

    <header>
        <div>
            <a href="customer.do">
                <i class="bi bi-chevron-left"></i>
            </a>
            <div id="top_menu_name">
                자주 묻는 질문
            </div>
        </div>
    </header>

    <!-- wrapper 영역 -->
    <div id="wrapper">
        <h1 id="title">자주 묻는 질문</h1>

        <!-- 검색창 -->
        <div id="search_area">
            <img src="images/customer_service/search_img.svg" alt="돋보기">
            <input type="text" placeholder="무엇을 찾고 계신가요?">
        </div>

        <!-- 상단 메뉴바 -->
        <div class="container text-center" id="top_menu_bar">
            <div class="row row-cols-3">
                <div class="col select_menu" id="member">회원/계정</div>
                <div class="col select_menu" id="conflict">거래분쟁/운영정책</div>
                <div class="col select_menu" id="payment">번개페이 안전결제</div>
                <div class="col select_menu" id="care">번개케어</div>
                <div class="col select_menu" id="sales_advertisement">프로상점/판매광고</div>
                <div class="col select_menu" id="etc">기타 이용안내</div>
            </div>
        </div>

        <!-- 하단 제목 -->
        <div id="list_contents">
            <!-- 회원/계정 영역 -->
            <div id="member_lists_area">
            <c:forEach var="frequently_asked" items="${askedList}">
                <div class="member_content">
                <a href="asked.do?id=${frequently_asked.freq_id}">
                    <p>
             <span id="Q">Q</span>       	${frequently_asked.freq_title}
                         <i class="bi bi-chevron-right"></i>
                   	</p>
   				</a>
                </div>
                </c:forEach>
                <div>
                </div>
           </div>  

            <!-- 거래분쟁/운영정책 영역 -->
            <div id="conflict_lists_area">
                <c:forEach var="frequently_conflict" items="${conflictList}">
                 <div class="conflict_content">
                <a href="asked.do?id=${frequently_conflict.freq_id}">
                    <p>
                      <span id="Q">Q</span>  ${frequently_conflict.freq_title }
                         <i class="bi bi-chevron-right"></i>
                  	</p>
   				</a>
                </div>
                </c:forEach>
                <div>
                </div>
           </div>  

            <!-- 번개페이 안전결제 영역 -->
            <div id="payment_lists_area">
            <c:forEach var="frequently_pay" items="${safetyList}">
                <div class="payment_content">
                  <a href="asked.do?id=${frequently_pay.freq_id}">
                    <p>
                      <span id="Q">Q</span>  ${frequently_pay.freq_title }
                         <i class="bi bi-chevron-right"></i>
                  	</p>
   				</a>
                </div>
                </c:forEach>
                <div>
                </div>
           </div>  
            
           

            <!-- 번개케어 영역 -->
            <div id="care_lists_area">
            <c:forEach var="frequently_care" items="${careList}">
                <div class="care_content">
                   <a href="asked.do?id=${frequently_care.freq_id}">
                    <p>
                    <span id="Q">Q</span>   ${frequently_care.freq_title }
                         <i class="bi bi-chevron-right"></i>
                 	</p>
   				</a>
                </div>
                </c:forEach>
                <div>
                </div>
           </div>  
                  
                  

            <!-- 프로상점/판매광고 영역 -->
            <div id="sales_advertisement_lists_area">
            <c:forEach var="frequently_ad" items="${adList}">
                <div class="sales_advertisement_content">
                  <a href="asked.do?id=${frequently_ad.freq_id}">
                    <p>
                  <span id="Q">Q</span>     ${frequently_ad.freq_title }
                         <i class="bi bi-chevron-right"></i>
                    	</p>
   				</a>
                </div>
                </c:forEach>
                <div>
                </div>
           </div>  
                 

            <!-- 기타 이용안내 영역 -->
            <div id="etc_lists_area">
               <c:forEach var="frequently_etc" items="${etcList}">
                <div class="etc_content">
                  <a href="asked.do?id=${frequently_etc.freq_id}">
                    <p>
                   <span id="Q">Q</span>    ${frequently_etc.freq_title }
                         <i class="bi bi-chevron-right"></i>
                   	</p>
   				</a>
                </div>
                </c:forEach>
                <div>
                </div>
           </div>  
            
             <!-- 선택된 공지사항의 상세 내용을 표시 -->
                <div class="general_content">
                    <p>
                        ${frequentlyDetail.freq_title}
                    </p>
                    <p>
                        ${frequentlyDetail.freq_content}
                    </p>
        </div>
    </div>
                 
        
    </div>
    <!-- // wrapper 영역 -->
</body>
</html>