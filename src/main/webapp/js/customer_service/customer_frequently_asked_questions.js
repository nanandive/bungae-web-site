
/* 타이틀 클릭시 하단 메뉴 변경 */

function change_color(color) {
    $("#top_menu_bar > div > div").css('color', '#CCC');
    $(color).css('color', 'black');
}

function fn_none() {
    $('#member_lists_area').css('display', 'none');
    $('#conflict_lists_area').css('display', 'none');
    $('#payment_lists_area').css('display', 'none');
    $('#care_lists_area').css('display', 'none');
    $('#sales_advertisement_lists_area').css('display', 'none');
    $('#etc_lists_area').css('display', 'none');
}


$(document).ready(function(){
    $("#member").click(function(){

        fn_none();
        $('#member_lists_area').css('display', 'block');
        change_color(this);
    })
})

$(document).ready(function(){
    $("#conflict").click(function(){

        fn_none();
        $('#conflict_lists_area').css('display', 'block');
        change_color(this);
    })
})

$(document).ready(function(){
    $("#payment").click(function(){

        fn_none();
        $('#payment_lists_area').css('display', 'block');
        change_color(this);
    })
})

$(document).ready(function(){
    $("#care").click(function(){

        fn_none();
        $('#care_lists_area').css('display', 'block');
        change_color(this);
    })
})

$(document).ready(function(){
    $("#sales_advertisement").click(function(){

        fn_none();
        $('#sales_advertisement_lists_area').css('display', 'block');
        change_color(this);
    })
})

$(document).ready(function(){
    $("#etc").click(function(){

        fn_none();
        $('#etc_lists_area').css('display', 'block');
        change_color(this);
    })
})