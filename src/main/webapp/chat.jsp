<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1" >
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/custom.css" />
<title>실시간 채팅</title>
<link rel="icon"type="image/x-icon"href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<style>

thead th{
   background-color: #006DCC;
   color: white;
   text-align: center;
}
tr td:first-child,
tr th:first-child{
   border-top-left-radius: 6px;
   border-bottom-left-radius: 6px 
}

tr td:first-child,
tr th:first-child{
   border-top-right-radius: 6px;
   border-bottom-right-radius: 6px 
}

 

/* 모달창 css처리 */

 .portlet {
    margin-bottom: 15px;
}

.btn-white {
    border-color: #cccccc;
    color: #333333;
    background-color: #ffffff;
}

.portlet {
    border: 1px solid;
}

.portlet .portlet-heading {
    padding: 0 15px;
}

.portlet .portlet-heading h4 {
    padding: 1px 0;
    font-size: 16px;
}

.portlet .portlet-heading a {
    color: #fff;
}

.portlet .portlet-heading a:hover,
.portlet .portlet-heading a:active,
.portlet .portlet-heading a:focus {
    outline: none;
}

.portlet .portlet-widgets .dropdown-menu a {
    color: #333;
}

.portlet .portlet-widgets ul.dropdown-menu {
    min-width: 0;
}

.portlet .portlet-heading .portlet-title {
    float: left;
}

.portlet .portlet-heading .portlet-title h4 {
    margin: 10px 0;
}

.portlet .portlet-heading .portlet-widgets {
    float: right;
    margin: 8px 0;
}

.portlet .portlet-heading .portlet-widgets .tabbed-portlets {
    display: inline;
}

.portlet .portlet-heading .portlet-widgets .divider {
    margin: 0 5px;
}

.portlet .portlet-body {
    padding: 15px;
    background: #fff;
}

.portlet .portlet-footer {
    padding: 10px 15px;
    background: #e0e7e8;
}

.portlet .portlet-footer ul {
    margin: 0;
}

.portlet-green,
.portlet-green>.portlet-heading {
    border-color: #16a085;
}

.portlet-green>.portlet-heading {
    color: #fff;
    background-color: #16a085;
}

.portlet-orange,
.portlet-orange>.portlet-heading {
    border-color: #f39c12;
}

.portlet-orange>.portlet-heading {
    color: #fff;
    background-color: #f39c12;
}

.portlet-blue,
.portlet-blue>.portlet-heading {
    border-color: #2980b9;
}

.portlet-blue>.portlet-heading {
    color: #fff;
    background-color: #2980b9;
}

.portlet-red,
.portlet-red>.portlet-heading {
    border-color: #e74c3c;
}

.portlet-red>.portlet-heading {
    color: #fff;
    background-color: #e74c3c;
}

.portlet-purple,
.portlet-purple>.portlet-heading {
    border-color: #8e44ad;
}

.portlet-purple>.portlet-heading {
    color: #fff;
    background-color: #8e44ad;
}

.portlet-default,
.portlet-dark-blue,
.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    border-color: #34495e;
}

.portlet-default>.portlet-heading,
.portlet-dark-blue>.portlet-heading {
    color: #fff;
    background-color: #34495e;
}

.portlet-basic,
.portlet-basic>.portlet-heading {
    border-color: #333;
}

.portlet-basic>.portlet-heading {
    border-bottom: 1px solid #333;
    color: #333;
    background-color: #fff;
}

@media(min-width:768px) {
    .portlet {
        margin-bottom: 30px;
    }
}

.img-chat{
width:40px;
height:40px;
}

.text-green {
    color: #16a085;
}

.text-orange {
    color: #f39c12;
}

.text-red {
    color: #e74c3c;
}               
</style>

</head>
<body>
<li class="active"><a href="find.jsp">친구찿기</a></li>
   <div class="container bootstrap snippet">
      <div class="row">
         <div class="col-xs-12">
            <div class="portlet portlet-default">
               <div class="portlet-heading">
                  <div class="portlet-title">
                     <h4><i class="fa fw-circle text-green"></i>실시간 채팅창</h4>
                  </div>
                  <div class="clearfix"></div>
               </div>
               <div id="chat" class="panel-collapse collapse in">
                  <div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; hegiht:600px;">
                  
                  </div>
                  <div class="portlet-footer">
                     <div class="row" style="height: 900px;">
                        <div class="form-group col-xs-10">
                           <textarea style="height: 80px" id="chatContent" class="form-control" placeholder="메시지를입력하세요." maxlength="100"></textarea>
                        </div>
                        <div class="form-group col-xs-2">
                           <button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
                           <div class="clearfix"></div>
                        </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   
   <div class="alert alert-success" id="successMessage" style="display : none;">
      <strong>메시지 전송에 성공했습니다.</strong>
   </div>
   
   <div class="alert alert-danger" id="dangerMessage" style="display : none;">
      <strong>이름과 내용을 모두 입력해주세요.</strong>
   </div>
   
   <div class="alert alert-warning" id="warningMessage" style="display : none;">
      <strong>데이터베이스 오류가 발생했습니다.</strong>
   </div>
   
   

<script type="text/javascript">
   function autoClosingAlert(selector, delay) {
      var alert = $(selector).alert();
      alert.show();
      window.setTimeout(function() { alert.hide() }, delay );
   }
   
   function submitFunction() {
      // var member_id = "tlatms2003";
      var member_id = '<%= session.getAttribute("member_id") %>';

      var product_id = 1;
       var chatContent = $("#chatContent").val();
       $.ajax({
           type: "POST",
           url: "/bungae/chatHandler.ajax", 
           data: {
                member_id: encodeURIComponent(member_id),
               product_id: product_id, 
               chatContent: encodeURIComponent(chatContent)
           },
           cache:false,
           success: function(result) {
    
              
              alert(result)
               if (result == "1") {
                   autoClosingAlert("#successMessage", 2000);
               } else if (result == "0") {
                   autoClosingAlert("#dangerMessage", 2000);
               } else {
                   autoClosingAlert("#warningMessage", 2000);
               }
           }
       });
       $("#chatContent").val('');
   }
   var lastID = 0; // 마지막으로 대화한 데이터 chatid
   function chatListFunction(lt){ 
       var member_id = '<%= session.getAttribute("member_id") %>';

         var product_id = 1;
          $.ajax({
                type:"POST",
                url : "/bungae/chatListHandler.ajax",
                data : {
                      member_id: encodeURIComponent(member_id),
                     product_id: product_id ,
                     listType:lt
                   
                },
                dataType:"json",
                cache:false,
                success : function(  data  ){
                 if(  !data || lastID == 0)  { 
                    $(data).each(function (index, element){
                       addChat( element.member_id , element.chatContent ,  element.chatTime ); 
                       lastID = element.chatID;
                    });
                }
                   
console.log("> lastID : " + lastID) // ++ commit 작업해봐라
                }
             });
   }
   
   function addChat(chatName, chatContent, chatTime){
      $("#chatList").append('<div class="row">' +
             '<div class="col-lg-12">' +
             '<div class="media">' +
             '<a class="media-object img-circle" style="width:30px; height: 30px;" src="images/dong1.jpg" alt="">' +
             '</a>' +
             '<div class="media-body">' +
             '<h4 class="media-heading">' +
             chatName +
             '<span class="small pull-right">' +
             chatTime +
             '</span>' +
             '</h4>' +
             '<p>' +
             chatContent +
             '</p>' +
             '</div>' +
             '</div>' +
             '</div>' +
             '</div>' +
             '<hr>');
         $("#chatList").scrollTop($("#chatList")[0].scrollHeight);

   }
   function getInfiniteChat() { //몇초간격으로 계속 새로운메시지 가져옴
      setInterval(function(){
         console.log( "XX : " + lastID );
         chatListFunction(lastID);
      },3000) //3초에 한번씩
   }

   
</script>
   
   
   <script type="text/javascript">
   $(document).ready(function() {
        chatListFunction('ten');
        getInfiniteChat();
      });
   </script>
   
</body>
</html>