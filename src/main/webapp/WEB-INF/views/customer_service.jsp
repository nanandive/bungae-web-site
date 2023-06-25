<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- 부트스트랩 icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <!-- 고객센터 공통 CSS -->
    <link rel="stylesheet" href="css/customer_service/customer_service_common.css">
    <!-- 고객센터 CSS -->
    <link rel="stylesheet" href="css/customer_service/customer_service.css">
    <!-- 파비콘 -->
    <link rel="icon" href="images/market/favicon.ico">
</head>
<body>
    <header>
        <div>
            <a href="index.do">
                <i class="bi bi-chevron-left"></i>
            </a>
        </div>
    </header>
    <!-- wrapper 영역 -->
    <div id="wrapper">
        <div id="service_top">
            <h1>${myShop.member_id }</h1>님,<br>
            무엇을 도와드릴까요?
        </div>

        <div id="notice_line">
            <p>
                <a href="customer_notice.html">
                    <span>공지</span>
                    [공지] 번개장터 서비스 이용 약관 개정안내
                    <i class="bi bi-chevron-right"></i>
                </a>
            </p>
        </div>

        <div id="service_mid" class="container text-center">
            <div class="row mid_top">
                <div class="col">
                    <div>
                        <a href="customer_operational_policy.html">
                            <img src="images/customer_service/운영정책.png" alt="운영정책">
                            <p>운영정책</p>
                        </a>
                    </div>
                </div>
                <div class="col">
                    <div>
                        <a href="/bungae/notice.do">
                            <img src="images/customer_service/공지사항.png" alt="공지사항">
                            <p>공지사항</p>
                        </a>
                    </div>
                </div>
                <div class="col">
                    <div>
                        <a href="/bungae/asked.do">
                            <img src="images/customer_service/자주 묻는 질문.png" alt="자주 묻는 질문">
                            <p>자주 묻는 질문</p>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row mid_bot">
                <div class="col">
                    <div>
                        <a href="/bungae/inquiry.do">
                            <img src="images/customer_service/1대1 문의.png" alt="1:1문의">
                            <p>1:1 문의</p>
                        </a>
                        
                    </div>
                </div>
                <div class="col">
                    <div>
                        <a href="sanctions.do">
                            <img src="images/customer_service/내상점 제재내역.png" alt="내상점 제재내역">
                            <p>내상점 제재내역</p>
                        </a>
                    </div>
                </div>
                <div class="col">
                    
                </div>
            </div>
        </div>

        <div id="resolve">
            <h4>여기서 빠르게 해결하세요.</h4>
            <p>
                <a href="asked.do">
                        <span>Q</span>
                        거래를 하면 안되는 것들은 어떤 것이 있나요? <i class="bi bi-chevron-right"></i>
                    </a>
                </a>
            </p>
            <p>
                <a href="asked.do">
                    <span>Q</span>
                    번개페이로 판매한 상품은 언제 정산 되나요? <i class="bi bi-chevron-right"></i>
                </a>
            </p>
            <p>
                <a href="asked.do">
                    <span>Q</span>
                    번개페이(안전결제)란 무엇인가요? <i class="bi bi-chevron-right"></i>
                </a>
            </p>
            <p>
                <a href="asked.do">
                    <span>Q</span>
                    [분쟁해결절차] 사기를 당하면 어떻게 처리해야 되나요? <i class="bi bi-chevron-right"></i>
                </a>
            </p>
            <button>전체 더보기</button>
        </div>

        <div id="service_bot">
            <p>(주)번개장터 사업자정보 <i class="bi bi-chevron-right"></i></p>
            <p>Ⓒ Bungaejangter. Inc All rights reserved.</p>
        </div>
    </div>
    <!-- // wrapper 영역 -->
</body>
</html>