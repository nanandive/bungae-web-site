<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세 내용</title>
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <!-- 고객센터 공통 CSS -->
    <link rel="stylesheet" href="css/customer_service/customer_service_common.css">
    <!-- 해당 페이지 CSS -->
    <link rel="stylesheet" href="css/customer_service/customer_notice.css">
    <style>
    
    #top_menu_name {
    text-align: left;
    color: #888;
}

#notice_title {
    font-size: 22px;
    font-weight: bold;
}

.body {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
    padding: 20px;
}

.container {
    max-width: 800px;
    width: 100%;
    margin-top: 40px;
    padding: 20px;
    background-color: #fff;
    box-shadow: none; /* Remove box shadow */
}

   #notice_date {
            margin: 10px 0px 0px;
            font-size: 0.75rem;
            font-weight: 500;
            font-stretch: normal;
            font-style: normal;
            line-height: 1;
            letter-spacing: normal;
            color: rgba(102, 102, 102, 0.5);
        }
        

#notice_date::after {
    content: "";
    display: block;
    width: 100%;
    height: 1px;
    background-color: rgb(246, 246, 246);
    margin-bottom: 30px;
    margin-top: 30px;
}



#menuname{
    font-size: 0.75rem;
   margin-top: 15px;
   font-weight: 500;
   font-stretch: normal;
   font-style: normal;
   line-height: 1;
   letter-spacing: normal;
   color: rgb(178, 178, 178);
   text-align: left;
   margin-bottom: 10px;
}
  .abc {
    width: 100%;
    height: 12px;
    background-color: rgb(246, 246, 246);
    margin-top: 100px;
}

#status {
   color: #CCCCCC/* rgb(153, 153, 153) */;
   font-size: 0.75rem;
   font-weight: bold;
   font-stretch: normal;
   font-style: normal;
   line-height: 1;
   letter-spacing: normal;
   margin-top: 10px; /* 위쪽에 10px의 마진 값을 설정 */
}

 
    
    #status[data-status="답변완료"] {
        color: #5CB391; /* #5CB391 */; /* 답변완료인 경우의 글자색 */
    }

#detail_date{
   font-size: 8px;
   color: #CCCCCC;
   font-weight: bold;
   font-stretch: normal;
   font-style: normal;
   line-height: 1;
   letter-spacing: normal;
   margin-top: 10px; /* 위쪽에 10px의 마진 값을 설정 */

}



    #qna {
        margin-top: 20px;
         margin-left: 200px;
        font-size: 16px;
        line-height: 1.5;
        /* Add any other size-related styles here */
    }
</style>



    </style>
</head>
<body>
    <header>
    <div>
        <div style="display: flex; align-items: center;">
            <a href="/bungae/inquiry.do">
                <i class="bi bi-chevron-left"></i>
            </a>
            
        </div>
    </div>
</header>

    <!-- wrapper 영역 -->
     <div id="wrapper">
        <div class="container text-left">
        
            <a href="customer_notice_detail.jsp">    
                <h3 id="notice_title">
                <p id="menuname" >
                 ${selectinquiry[0].type }
            </p>    ${selectinquiry[0].detail_type }
                </h3>
            </a>
            <div>
                <p id="notice_date">
                     ${selectinquiry[0].write_date }
                </p>
            </div>
            <p id="notice_content">
                 ${selectinquiry[0].inquiry_ct }
            </p>
        </div>
        <div class="abc"></div>
        
        
        <div ="qna">
        <p id="status" data-status="답변완료">${selectinquiry[0].status }</p>
        <span id="detail_date">${selectinquiry[0].write_date }</span>
        <pre>
${selectinquiry[0].answer }
        </pre>
        </div>

    </div>
    
    
    
</body>
</html>