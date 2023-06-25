<%@ page contentType="text/html; charset=UTF-8"%>
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
   background-color: white; /* 바탕색 */
   margin: 100px auto 0;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.inner {
   margin-top: -50px;
   margin-left: 30px;
   margin-right: 30px;
}

h1 {
   margin-bottom: 45px;
   font-size: 30px;
   font-weight: bold;
   color: rgb(63, 63, 63);
}

#member_id {
   width: 68%;
   height: 3.75rem;
   padding: 0px;
   font-size: 1.3125rem;
   font-weight: 700;
   border-bottom: 1px solid rgb(229, 229, 229);
   outline: none;
   appearance: none;
}

#birth {
   width: 100%;
   height: 3.75rem;
   padding: 0px;
   font-size: 1.3125rem;
   font-weight: 700;
   border-bottom: 1px solid rgb(229, 229, 229);
   outline: none;
   appearance: none;
}

#name {
   width: 100%;
   height: 3.75rem;
   padding: 0px;
   font-size: 1.3125rem;
   font-weight: 700;
   border-bottom: 1px solid rgb(229, 229, 229);
   outline: none;
   appearance: none;
}

#pwd {
   width: 100%;
   height: 3.75rem;
   padding: 0px;
   font-size: 1.3125rem;
   font-weight: 700;
   border-bottom: 1px solid rgb(229, 229, 229);
   outline: none;
   appearance: none;
}

#address {
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
   display: inline-flex;
   width: 100%;
   height: 72px;
   border-radius: 6px;
   background-color: rgb(216, 12, 24);
   -webkit-box-align: center;
   align-items: center;
   -webkit-box-pack: center;
   justify-content: center;
   font-size: 1.125rem;
   font-weight: 700;
   color: rgb(255, 255, 255);
   text-align: center;
   border: none;
}

.but:disabled {
   opacity: 0.3;
   cursor: not-allowed;
}

#btnIDDuplicateCheck:disabled {
   opacity: 0.3;
   cursor: not-allowed;
}

#btnIDDuplicateCheck {
   width: 20%;
   height: 3.00rem;
   margin-left: 40px;
}
</style>
</head>
<body>
   <div class="container">
      <div class="inner">
         <h1>본인 정보를 입력해주세요</h1>
         <form action="join.do" method="post">
            <input type="text" id="member_id" placeholder="아이디" name="member_id" />
            <button type="button" id="btnIDDuplicateCheck" disabled="disabled"
               name="btnIDDuplicateCheck">중복확인</button>
            <input type="text" id="pwd" placeholder="휴대폰번호" maxlength="11"
               name="pwd" /> <input type="text" id="name" placeholder="이름"
               maxlength="4" name="name" /> <input type="text" id="birth"
               placeholder="생년월일 ex)981107" maxlength="6" name="birth"
               onblur="validateBirth(this)" /> <input type="text" id="address"
               placeholder="주소" maxlength="30" name="address" />
            <button type="submit" disabled="disabled" class="but">다음</button>
         </form>
      </div>
   </div>
   <script>
      $(document).ready(function() {
         $('input').on('input', function() {
            var allInputsFilled = true;
            $('input').each(function() {
               if ($(this).val() === '') {
                  allInputsFilled = false;
                  return false;
               }
            });
            if (allInputsFilled) {
               $('.but').prop('disabled', false);
            } else {
               $('.but').prop('disabled', true);
            }
         });
         $('#member_id').on('input', function() {
            var inputVal = $(this).val();
            if (inputVal.length > 0) {
               $('#btnIDDuplicateCheck').prop('disabled', false);
            } else {
               $('#btnIDDuplicateCheck').prop('disabled', true);
            }
         });
      });

      $("#btnIDDuplicateCheck").on("click", function() {
         var params = "member_id=" + $("#member_id").val();

         alert(params);
         $.ajax({
            url : "/bungae/idCheck.ajax",
            dataType : "json",
            type : "GET",
            data : params,
            cache : false,
            success : function(data, textStatus, jqXHR) {
               if (data.result == true) {
                  alert("사용 가능한 아이디입니다.");
               } else if (data.result == false) {
                  alert("사용 불가능한 아이디입니다.");
                  $("#id").val("").focus(); // 중복된 게 있으니 지우고 포커싱
               }
            },
            error : function() {
               alert("에러~~~ ");
            }
         });
      });

      function validateBirth(input) {
         var birth = input.value;

         // 생년월일은 6자리 숫자로 이루어져야 함
         var regex = /^\d{6}$/;

         if (!regex.test(birth)) {
            alert("생년월일은 6자리 숫자로 입력해주세요.");
            input.value = "";
            input.focus(); // 입력 필드에 다시 포커스 설정
            return;
         }

         var year = parseInt(birth.substr(0, 2));
         var month = parseInt(birth.substr(2, 2));
         var day = parseInt(birth.substr(4, 2));

         // 월은 1~12 사이여야 함
         if (month < 1 || month > 12) {
            alert("월은 1에서 12 사이의 값을 입력해주세요.");
            input.value = "";
            input.focus(); // 입력 필드에 다시 포커스 설정
            return;
         }

         // 일은 1~30 사이여야 함
         if (day < 1 || day > 30) {
            alert("일은 1에서 30 사이의 값을 입력해주세요.");
            input.value = "";
            input.focus(); // 입력 필드에 다시 포커스 설정
            return;
         }

         // 다음 입력 필드로 포커스 이동
         var nextInput = input.parentElement.nextElementSibling.querySelector("input");
         if (nextInput) {
            nextInput.focus();
         }
         
         
         
      }
   </script>
</body>
</html>
