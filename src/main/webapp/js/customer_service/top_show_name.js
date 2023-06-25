$(document).ready(function(){
    $(window).scroll(function(){
    var scroll = $(window).scrollTop();
      //스크롤이 맨 위 일 경우
    if (scroll < 1) {
        $("#top_menu_name").css("display" , "none");
    }
      // 스크롤이 내려갈 경우 변경
    else{
        $("#top_menu_name").css("display" , "inline-block");
        }
    })
})