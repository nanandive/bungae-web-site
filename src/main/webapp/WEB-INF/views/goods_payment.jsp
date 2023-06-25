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
<title>결제 페이지</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 결제페이지 CSS -->
<link rel="stylesheet" href="css/goods/goods_payment.css">
<!-- 파비콘 -->
<link rel="icon" href="images/market/favicon.ico">

<!-- 약관 동의 체크 -->
<script src="js/market/jquery-3.6.0.min.js"></script>
<script src="js/goods/goods_agree.js"></script>
</head>
<body>

	<header>
		<div>
			<i class="bi bi-chevron-left"></i>
		</div>
	</header>
	<div id="wrapper">
		<div id="pay">
			<h1>결제하기</h1>

			<div class="pay_content">
				<div class="pay_content_img">
					<a href="#"> <img src="${product.image_path }" alt="테스트 사진">
					</a>
				</div>
				<div class="pay_content_goods">
					<p>${product.price}원</p>
					<p>${product.title}</p>
				</div>
			</div>
			<div>
				<span
					style="display: block; float: left; font-weight: 600; font-size: 14px; color: rgb(178, 178, 178);">거래방법</span>
				<span
					style="display: block; min-width: 250px; margin-left: 67px; padding-right: 30px; font-size: 14px; font-weight: 500">
					${product.sale_method}</span>
			</div>

			<div>
				<span
					style="display: block; float: left; font-weight: 600; font-size: 14px; color: rgb(178, 178, 178);">결제방법</span>

				<c:if test="${product.safety_sell == '일반결제'}">
					<span
						style="display: block; min-width: 250px; margin-left: 67px; padding-right: 30px; font-size: 14px; font-weight: 500">
						${product.safety_sell} </span>
				</c:if>
				<c:if test="${product.safety_sell != '일반결제'}">
					<span
						style="display: block; min-width: 250px; margin-left: 67px; padding-right: 30px; font-size: 14px; font-weight: 500">
						<img alt="페이사진" src="images/pay.svg"> ${product.safety_sell}
					</span>
				</c:if>

			</div>
		</div>

		<div id="main_content">
			<form action="orders.do">
				<div id="delivery">
					<h2>배송지</h2>
					<div class="delivery_content">
						<div>
							<p style="height: 20px; font-weight: 700; font-size: 16px;">${member.name }


								<span> <a href="#">변경</a>
								</span>
							</p>
							<p style="font-weight: 500; font-size: 14px; line-height: 150%">${member.address }</p>
							<p style="font-weight: 500; font-size: 14px; line-height: 150%">${member.tel }</p>

						</div>
					</div>
				</div>

				<div id="point">
					<h2>번개포인트</h2>
					<div class="point_content">
						<input type="text">
						<button>전액사용</button>


					</div>
					<p>
						사용 가능한 번개 포인트 <span>${ member.point }</span>
					</p>
				</div>


				<div id="total">
					<h2>결제금액</h2>
					<div class="total_content">
						<div>
							<p>
								<span>상품금액</span><span>${product.price }원</span>
							</p>

							<p>
								<span>배송비</span><span>배송비별도</span>
							</p>
							<c:choose>
								<c:when test="${ product.safety_sell == '일반결제'}">
									<p>
										<span>안전결제 수수료</span><span>0원</span>
									</p>
								</c:when>
								<c:otherwise>
									<p>
										<span>안전결제 수수료</span><span>${product.price * 3.5 / 100}원</span>
									</p>
								</c:otherwise>
							</c:choose>

							<p>
								<span>번개포인트 사용</span><span id="minus">0원</span>
							</p>
							<p id="under_line"></p>


							<c:choose>
								<c:when test="${ product.safety_sell == '일반결제'}">
									<p>
										<span>총 결제금액</span><span id="totalprice">${product.price}원</span>
									</p>
								</c:when>
								<c:otherwise>
									<p>
										<span>총 결제금액</span><span id=totalprice>${product.price+product.price * 3.5 / 100}원</span>
									</p>
								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>







				<div id="payment_method">
					<h2>결제수단</h2>
					<div class="payment_method_img">
						<img src="images/goods/payment_method.png" alt="결제수단 혜택">
					</div>
					<div id="payment-method-container"
						style="width: 570px; overflow: hidden;">
						<select id="payment-method" name="payment-method" required
							style="width: 100%;">
							<option value="">선택하세요</option>
							<option value="토스페이">토스페이</option>
							<option value="카카오페이">카카오페이</option>
							<option value="페이코">페이코</option>
							<option value="휴대폰결제">휴대폰결제</option>
							<option value="무통장(가상계좌)">무통장(가상계좌)</option>
							<option value="편의점결제">편의점결제</option>
						</select>
					</div>
				</div>


				<div id="event">
					<h4>오늘의 혜택 놓치지마세요</h4>
					<p>더보기</p>
					<div>
						<div>
							<div>
								<img src="images/goods/payco.PNG" alt="페이코">
							</div>
							<p>페이코</p>
							<p>페이코 2,000P 혜택&럭키 드로우</p>
						</div>
						<div>
							<div>
								<img src="images/goods/bangae.PNG" alt="번개장터 간편결제">
							</div>
							<p>번개장터 간편결제</p>
							<p>케이뱅크 번개포인트 2,000P 혜택</p>
						</div>
					</div>
				</div>

				<div id="border"></div>

				<div id="agree">
					<div class="agree_content">
						<div>
							<i class="bi bi-check" id="agree_check"></i>
							<p>개인정보 제 3자 제공동의와 결제대행 서비스 이용약관에 동의합니다.</p>
						</div>
						<p>자세히보기</p>
						<p>“BGZT Digital”, “BGZT Lab 1”, “BGZT Lab 2”, “BGZT 컬렉션” 상점의
							판매상품을 제외한 모든 상품들에 대하여, 번개장터 ㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가
							아니며, 입점판매자가 등록한 상품정보 및 거래에 대해책임을 지지 않습니다.</p>
					</div>
					<button>결제하기</button>
				</div>




				<div>
					<input type="hidden" id="product_id" name="product_id"
						value="${product.product_id}">
					<!-- 여기에 id 값 넘겨줘야함  -->

					<input type="hidden" id="member_id" name="member_id"
						value="${member.member_id}">
					<!-- 여기에 id 값 넘겨줘야함  -->

					<input type="hidden" id="delivery-method" name="delivery-method"
						value="${product.sale_method}"> <input type="hidden"
						id="product-price" name="product-price" value="${product.price}">

					<input type="hidden" id="member-address" name="member-address"
						value="${member.address}">


				</div>


			</form>
		</div>
		<!--// main_content-->
	</div>
	<!-- // wrapper -->






	<!--수정할면서 해야함  -->
	<script>
		window.addEventListener('DOMContentLoaded', function() {
			var button = document.querySelector('#point button');
			var input = document.querySelector('#point input');
			var pointValue = document.querySelector('#point span').textContent;
			var totalPriceElement = document.getElementById('totalprice');
			var originalPrice = parseInt(totalPriceElement.textContent);

			button.addEventListener('click', function(event) {
				event.preventDefault();
				input.value = pointValue;
				updateMinus();
				updateTotal();
			});

			input.addEventListener('input', function() {
				updateMinus();
				updateTotal();
			});

			function updateMinus() {
				var inputValue = parseInt(input.value, 10);
				if (isNaN(inputValue)) {
					inputValue = 0;
				}
				var usedPoint = Math.min(inputValue, parseInt(pointValue, 10));
				var minusElement = document.getElementById('minus');
				minusElement.textContent = '-' + usedPoint + '원';
			}

			function updateTotal() {
				var inputValue = parseInt(input.value, 10);
				if (isNaN(inputValue)) {
					inputValue = 0;
				}
				var discountedPrice = originalPrice - inputValue;
				totalPriceElement.textContent = discountedPrice + '원';
			}
		});
	</script>
	<script>
		window.addEventListener('DOMContentLoaded', function() {
			var selectContainer = document
					.querySelector('#payment-method-container');
			var selectElement = document.querySelector('#payment-method');

			// 동적으로 select 요소의 너비 설정
			selectElement.style.width = selectContainer.clientWidth + 'px';

			// 창 크기 변경 시 select 요소의 너비 업데이트
			window.addEventListener('resize', function() {
				selectElement.style.width = selectContainer.clientWidth + 'px';
			});
		});
	</script>

</body>
</html>
