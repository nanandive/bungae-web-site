
/* 타이틀 클릭시 하단 메뉴 변경 */

function change_color(color) {
    $("#list_title > div > div").css('color', '#CCC');
    $(color).css('color', 'black');
}

function fn_none() {
    $('#general_lists_area').css('display', 'none');
    $('#change_policy_lists_area').css('display', 'none');
    $('#fraud_prevention_lists_area').css('display', 'none');
}


$(document).ready(function(){
    $("#general").click(function(){
        fn_none();

        $('#general_lists_area').css('display', 'block');
        
        change_color(this);
    })
})

$(document).ready(function(){
    $("#change_policy").click(function(){
        fn_none();

        $('#change_policy_lists_area').css('display', 'block');

        change_color(this);
    })
})

$(document).ready(function(){
    $("#fraud_prevention").click(function(){
        fn_none();
        
        $('#fraud_prevention_lists_area').css('display', 'block');

        change_color(this);
    })
})