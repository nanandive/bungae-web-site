<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
html, body {
   width: 100%;
   height: 100%;
   background-color: #f9f9f9;
}

.container {
   display: flex;
   align-items: center;
   justify-content: center;
   height: 100%;
   width: 40%;
   background-color: white;
   margin: -7px auto 0;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.inner {
   margin-top: -300px;
   margin-left: 30px;
   margin-right: 30px;
   width: 100%;
}

h1 {
   margin-top: -200px;
   font-size: 30px;
   font-weight: bold;
   color: rgb(63, 63, 63);
}

#logout,
#delete {
   width: 100%;
   height: 3.75rem;
   padding: 0px;
   font-size: 1.3125rem;
   font-weight: 700;
   border-bottom: 1px solid rgb(229, 229, 229);
   outline: none;
   appearance: none;
}

input {
   font-synthesis: none;
   -webkit-font-smoothing: antialiased;
   direction: ltr;
   text-align: left;
   color: rgb(33, 33, 33);
   letter-spacing: -0.5px;
   outline: 0px;
   border: 0px;
   margin-bottom: 20px;
}

button {
    background-color: transparent;
    cursor: pointer;
    outline: none;
    border: none;
}
</style>
</head>
<body>
   <div class="container">
      <div class="inner">
         <h1> 
            <button><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxwYXRoIGZpbGw9IiMxRTFEMjkiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTE5IDguOTk2SDMuNjZMOS42NTcgMy43NWExIDEgMCAwIDAtMS4zMTYtMS41MDZsLTggN2MtLjAwOC4wMDctLjAxLjAxOC0uMDE5LjAyNWEuOTc1Ljk3NSAwIDAgMC0uMTc3LjI0Yy0uMDE4LjAzLS4wNDUuMDU0LS4wNTkuMDg3YS45NzUuOTc1IDAgMCAwIDAgLjgwMmMuMDE0LjAzMy4wNDEuMDU3LjA2LjA4OC4wNS4wODcuMTAzLjE3LjE3Ni4yMzkuMDA4LjAwNy4wMTEuMDE4LjAyLjAyNWw4IDdhLjk5Ni45OTYgMCAwIDAgMS40MS0uMDk1IDEgMSAwIDAgMC0uMDk1LTEuNDExTDMuNjYgMTAuOTk2SDE5YTEgMSAwIDEgMCAwLTIiLz4KPC9zdmc+Cg==" alt="back" width="20" height="20">
            </button>      
            계정설정
         </h1>
         <form action="#" method="post">
            <button id="logout" style="text-align: left; color: #999999;">로그아웃</button>
            </form>
            <form action="delete.do" method="post">
            <button id="delete" style="text-align: left; color: #999999;">탈퇴</button>
            </form>
         
      </div>
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