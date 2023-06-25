
/* 햄버거에 마우스 호버 시 */
$(document).ready(function(){
    $(".hamburger").hover(function(){
        $('#menu').attr('src', 'images/market/ch_hamburger.png');
        $('#test_cates').css('display', 'block');
    })
})
/* 햄버거에서 마우스 떠날 시 */
$(document).ready(function(){
    $(".hamburger").mouseleave(function(){
        $('#menu').attr('src', 'images/market/hamburger.png');
        $('#test_cates').css('display', 'none');
    })
})


/* 대분류 메뉴 호버 시*/
$(document).ready(function(){
    $("#test_cates").hover(function(){
        $('#test_cates').css('display', 'block');
    })
})
/* 대분류 메뉴 떠날 시 */
$(document).ready(function(){
    $("#test_cates").mouseleave(function(){
        $('#test_cates').css('display', 'none');
    })
})


/* 대분류 */
/* 의류에 호버 시 */
$(document).ready(function(){
    $("#1").hover(function(){
        $('#test_clos').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
/* 의류에서 떠날 시 */
$(document).ready(function(){
    $("#1").mouseleave(function(){
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})
/* 악세서리에 호버 시 */
$(document).ready(function(){
    $("#2").hover(function(){
        $('#test_accs').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
/* 악세서리에서 떠날 시 */
$(document).ready(function(){
    $("#2").mouseleave(function(){
        $('#test_accs').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

//////////////////////////////////////////////////////////////////////////////////
//여기서부터 내가 계속 짠거다////////////////////////////////////////

//신발
$(document).ready(function(){
    $("#3").hover(function(){
        $('#shoes').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#3").mouseleave(function(){
        $('#shoes').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

$(document).ready(function(){
    $("#shoes").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#shoes').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#shoes").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#shoes').css('display', 'none');
    })
})

// 가방/지갑
$(document).ready(function(){
    $("#4").hover(function(){
        $('#bag').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#4").mouseleave(function(){
        $('#bag').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

$(document).ready(function(){
    $("#bag").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#bag').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#bag").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#bag').css('display', 'none');
    })
})

//시계
$(document).ready(function(){
    $("#5").hover(function(){
        $('#watch').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#5").mouseleave(function(){
        $('#watch').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

$(document).ready(function(){
    $("#watch").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#watch').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#watch").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#watch').css('display', 'none');
    })
})

//쥬얼리
$(document).ready(function(){
    $("#6").hover(function(){
        $('#jewerly').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#6").mouseleave(function(){
        $('#jewerly').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

$(document).ready(function(){
    $("#jewerly").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#jewerly').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#jewerly").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#jewerly').css('display', 'none');
    })
})

//패션 액세서리
$(document).ready(function(){
    $("#7").hover(function(){
        $('#fassion').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#7").mouseleave(function(){
        $('#fassion').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

$(document).ready(function(){
    $("#fassion").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#fassion').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#fassion").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#fassion').css('display', 'none');
    })
})

//디지털
$(document).ready(function(){
    $("#8").hover(function(){
        $('#digital').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#8").mouseleave(function(){
        $('#digital').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

$(document).ready(function(){
    $("#digital").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#digital').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#digital").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#digital').css('display', 'none');
    })
})

//가전제품
$(document).ready(function(){
    $("#9").hover(function(){
        $('#home').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#9").mouseleave(function(){
        $('#home').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

$(document).ready(function(){
    $("#home").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#home').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#home").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#home').css('display', 'none');
    })
})

//스포츠/레저
$(document).ready(function(){
    $("#10").hover(function(){
        $('#sports').css('display', 'block');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#10").mouseleave(function(){
        $('#sports').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'none');
    })
})

$(document).ready(function(){
    $("#sports").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#sports').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#sports").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');
        $('#sports').css('display', 'none');
    })
})





/////////////////////////////////////////////////////////////////////////////////


/* 소분류 표시 */
$(document).ready(function(){
    $("#test_clos").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'block');

        $('#test_accs').css('display', 'none');

        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#test_clos").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');

        $('#test_accs').css('display', 'none');
    })
})


$(document).ready(function(){
    $("#test_accs").hover(function(){
        $('#test_cates').css('display', 'block');
        $('#test_accs').css('display', 'block');

        $('#test_clos').css('display', 'none');

        $('#test_cates > h2 > span').css('display', 'block');
    })
})
$(document).ready(function(){
    $("#test_accs").mouseleave(function(){
        $('#test_cates').css('display', 'block');
        $('#test_clos').css('display', 'none');

        $('#test_accs').css('display', 'none');
    })
})