<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의하기</title>
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- 부트스트랩 icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <!-- 고객센터 공통 CSS -->
    <link rel="stylesheet" href="css/customer_service/customer_service_common.css">
    <!-- 문의하기 CSS -->
    <link rel="stylesheet" href="css/customer_service/customer_contact.css">
    <!-- 파비콘 -->
    <link rel="icon" href="images/market/favicon.ico">

    <!-- 화면 스크롤시 -->
    <script src="js/market/jquery-3.6.0.min.js"></script>
    <script src="js/customer_service/top_show_name.js"></script>

    <!-- 이미지 추가 -->
    <script src="js/customer_service/customer_contact.js"></script>

    
    <script>
        function close() {
            $('#click_choice').css('display', 'none');
            $('.sub_choice_click').css('display', 'none');
            $('#bg_color').css('display', 'none');
            $('html').css('overflowY', 'visible');
            $('body').css('overflowY', 'visible');
        }

        $(document).ready(function(){
            /* 유형 선택 박스 클릭시 메뉴들 표시, y스크롤 고정 */
            $('#choice > div').click(function () {
                $('#click_choice').css('display', 'block');
                $('#bg_color').css('display', 'block');
                $('html').css('overflowY', 'hidden');
                $('body').css('overflowY', 'hidden');
            });

            /* 배경 클릭시 닫힘  유형, 상세 유형 모두 포함 */
            $('#bg_color').click(function () {
                close();
            });
            
            /* 유형 선택시 배경꺼짐, Text 변경 및 서브 유형창 표시 */
            $('#click_choice > p').click(function () {
                document.querySelector("#choice > div > p").innerText = this.innerText;
                close();
                $('#sub_choice').css('display', 'block');
                
                /* 유형 변경 시 상세유형 리셋 */
                document.querySelector("#sub_choice > div > p").innerText = "상세 유형을 선택해주세요";
                $("#sub_choice > div > p").css("color", "#B2B2B2");

                $('#click_choice > p').css('color', '#CCC');
                $(this).css('color', '#D80C18');
                $('#choice > div > p').css('color', 'black');

                document.querySelector('#click_choice > p').addEventListener('mouseover', function() {
                    document.querySelector('#click_choice > p').setAttribute('class', 'hover');
                })
            });


            /* 상세 유형 선택시 배경꺼짐, Text 변경 */
            $('.sub_choice_click > p').click(function () {
                document.querySelector("#sub_choice > div > p").innerText = this.innerText;
                close();
                $('.sub_choice_click > p').css('color', '#CCC');
                $(this).css('color', '#D80C18');
                $('#sub_choice > div > p').css('color', 'black');

                document.querySelector('#click_choice > p').addEventListener('mouseover', function() {
                    document.querySelector('#click_choice > p').setAttribute('class', 'hover');
                })
            });

            /* 상세 유형 박스 클릭, y스크롤 고정 */
            /* 거래 신고 */

            function all_close() {
                $('.trade').css('display', 'none');
                $('.mem').css('display', 'none');
                $('.pay').css('display', 'none');
                $('.care').css('display', 'none');
                $('.shop').css('display', 'none');
                $('.sell').css('display', 'none');
                $('.etc').css('display', 'none');
                $('.error').css('display', 'none');
            }

            function y_hidden() {
                $('#bg_color').css('display', 'block');
                $('html').css('overflowY', 'hidden');
                $('body').css('overflowY', 'hidden');
            }

            $('#sub_choice > div').click(function () {
                if(document.querySelector("#choice > div > p").innerText == "거래신고") {
                    all_close();
                    $('.trade').css('display', 'block');
                    y_hidden();

                }else if(document.querySelector("#choice > div > p").innerText == "회원/계정") {
                    all_close();
                    $('.mem').css('display', 'block');
                    y_hidden();

                }else if(document.querySelector("#choice > div > p").innerText == "번개페이(안전결제)") {
                    all_close();
                    $('.pay').css('display', 'block');
                    y_hidden();

                }else if(document.querySelector("#choice > div > p").innerText == "번개케어") {
                    all_close();
                    $('.care').css('display', 'block');
                    y_hidden();
                    
                }else if(document.querySelector("#choice > div > p").innerText == "프로상점") {
                    all_close();
                    $('.shop').css('display', 'block');
                    y_hidden();
                    
                }else if(document.querySelector("#choice > div > p").innerText == "판매광고") {
                    all_close();
                    $('.sell').css('display', 'block');
                    y_hidden();
                    
                }else if(document.querySelector("#choice > div > p").innerText == "기타 서비스") {
                    all_close();
                    $('.etc').css('display', 'block');
                    y_hidden();
                    
                }else {
                    all_close();
                    $('.error').css('display', 'block');
                    y_hidden();
                }
            });
        });
    </script>
</head>
<body>
    <header>
        <div>
            <a href="inquiry.do">
                <i class="bi bi-chevron-left"></i>
            </a>
            <div id="top_menu_name">
                1:1 문의하기
            </div>
            <div id="cancel">
                <a href="inquiry.do">
                    취소
                </a>
            </div>
        </div>
    </header>

    <!-- wrapper 영역 -->
    <div id="wrapper">
        <div>
            <h1>1:1 문의하기</h1>
        </div>

        <form action="/bungae/service.do" method="post" id="inquiry" name="inquiry" enctype="multipary/from-data">
            <div id="choice">
                <p>유형선택 <i class="bi bi-record-fill"></i></p>
                <input type="hidden" id="first"/>
                <div>
                    <p>유형을 선택해주세요 </p><i class="bi bi-chevron-down"></i>
                    
                </div>
            </div>

            <div id="sub_choice">
                <p>상세유형 선택 <i class="bi bi-record-fill"></i></p>
                <input type="hidden" id="second"/>
                <div>
                    <p>상세 유형을 선택해주세요 </p><i class="bi bi-chevron-down"></i>
                </div>
            </div>
            
            <div id="inquiry_content">
                <p>문의내용 <i class="bi bi-record-fill"></i></p>
                <textarea placeholder="문의 내용을 자세히 입력해주세요." name="inquiry_ct"></textarea>
            </div>

            <div id="add_img">
                <p>사진첨부 (<span id="up_num">0</span>)</p>
                <p>사진을 첨부하면 정확한 답변을 받을 수 있어요.</p>
                <div class="container text-center">
                    <div class="row">
                        <div class="col image_box">
                            <div>
                                <input type="file" class="file img_file1" name="file1" accept="image/*" onchange="changeValue(this)" >
                                <img src="images/customer_service/plus.svg" alt="사진추가" class="img_upload upload1" >
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="inquiry_btn">
                <button type="submit">
                    문의하기
                </button>
            </div>
        </form>
    </div>
    <!-- // wrapper 영역 -->

    <!-- 문의하기 유형 선택시 메뉴 -->
    <div id="bg_color" class="opacity-50"></div>
    <div id="click_choice">
        <p class="choice_trade" id="trade" name="type" >거래신고</p>
        <p class="choice_member" id="mem" name="type" >회원/계정</p>
        <p class="choice_pay" id="pay" name="type" >번개페이(안전결제)</p>
        <p class="choice_care" id="care" name="type" >번개케어</p>
        <p class="choice_shop" id="shop" name="type" >프로상점</p>
        <p class="choice_sell" id="sell" name="type" >판매광고</p>
        <p class="choice_etc" id="etc" name="type" >기타 서비스</p>
        <p class="choice_error" id="error" name="type" >오류/신고/제안</p>
    </div>

    <div class="sub_choice_click trade">
        <p id="report" name="detail_type" >판매자신고(미발송)</p>
        <p id="state" name="detail_type" >상태불량</p>
        <p id="sellreport" name="detail_type" >구매자신고(미입금)</p>
        <p id="fake" name="detail_type" >안전결제 허위매물</p>
    </div>
    <div class="sub_choice_click mem">
        <p id="block" name="detail_type" >계정차단</p>
        <p id="login" name="detail_type" >로그인/본인인증</p>
        <p id="etcone" name="detail_type" >기타</p>
    </div>
    <div class="sub_choice_click pay">
        <p id="schedule" name="detail_type" >정산일정</p>
        <p id="return" name="detail_type" >취소/반품</p>
        <p id="etctwo" name="detail_type" >기타</p>
    </div>
    <div class="sub_choice_click care">
        <p id="real" name="detail_type" >정품 검수(명품/스니커즈)</p>
        <p id="function" name="detail_type" >기능 검수(스마트폰)</p>
        <p id="plus" name="detail_type" >추가 서비스(폴리싱/슈클린)</p>
    </div>
    <div class="sub_choice_click shop">
        <p id="logout" name="detail_type" >가입/해지</p>
        <p id="limit" name="detail_type" >판매제한(미전환)</p>
        <p id="register" name="detail_type" >사업자정보 등록/변경</p>
        <p id="store" name="detail_type" >프로상점 이용방법</p>
        <p id="calculate" name="detail_type" >정산문의(수수료, 세금계산서)</p>
        <p id="etcthree" name="detail_type" >기타</p>
    </div>
    <div class="sub_choice_click sell">
        <p id="admethod" name="detail_type" >광고 이용방법</p>
        <p id="adtest" name="detail_type" >광고 심사</p>
        <p id="adpoint" name="detail_type" >광고포인트</p>
        <p id="up" name="detail_type" >UP하기</p>
        <p id="etcfour" name="detail_type" >기타</p>
    </div>
    <div class="sub_choice_click etc">
        <p id="phone" name="detail_type" >내폰시세</p>
        <p id="delivery" name="detail_type" >택배서비스</p>
        <p id="clining" name="detail_type" >클리닝 서비스(슈클린/프리미엄)</p>
        <p id="polishing" name="detail_type" >폴리싱 서비스(시계/주얼리)</p>
        <p id="promotion" name="detail_type" >프로모션</p>
        <p id="etcfive" name="detail_type" >기타</p>
    </div>
    <div class="sub_choice_click error">
        <p id="disable" name="detail_type" >장애신고</p>
        <p id="etcsix" name="detail_type" >기타신고</p>
        <p id="suggestion" name="detail_type" >서비스제안</p>
    </div>
    
     <script>
    function handleClickOne(event) {
        var idOne = $(this).attr("name");
        var valueOne = $(this).text();
        $("#first").attr("name", idOne);
        $("#first").val(valueOne);
    }
    $("#click_choice p").click(handleClickOne);
    
    function handleClickTwo(event) {
        var idTwo = $(this).attr("name");
        var valueTwo = $(this).text();
        //alert(idTwo + valueTwo);
        $("#second").attr("name", idTwo);
        $("#second").val(valueTwo);
    }
    $(".sub_choice_click p").click(handleClickTwo);
</script>
</body>
</html>