/* 사진 첨부 이미지 추가 */
$(function () {
    $('.upload1').click(function (e) {
        e.preventDefault();
        $('.img_file1').click();
    });
});
$(function () {
    $('.upload2').click(function (e) {
        e.preventDefault();
        $('.img_file2').click();
    });
});
$(function () {
    $('.upload3').click(function (e) {
        e.preventDefault();
        $('.img_file3').click();
    });
});

function changeValue(input) {
    if(input.files && input.files[0] && input.name == "file1") {
        let reader = new FileReader();
        reader.onload=function (event) {
            document.querySelector(".upload1").src = event.target.result;
            document.querySelector(".upload1").classList.remove("img_upload");
            document.querySelector(".upload1").classList.add("change_img");
            console.log(event)
        }
        reader.readAsDataURL(input.files[0]);

    }else if(input.files && input.files[0] && input.name == "file2") {
        let reader = new FileReader();
        reader.onload=function (event) {
            document.querySelector(".upload2").src = event.target.result;
            document.querySelector(".upload2").classList.remove("img_upload");
            document.querySelector(".upload2").classList.add("change_img");
            console.log(event)
        }
        reader.readAsDataURL(input.files[0]);

    }else {
        let reader = new FileReader();
        reader.onload=function (event) {
            document.querySelector(".upload3").src = event.target.result;
            document.querySelector(".upload3").classList.remove("img_upload");
            document.querySelector(".upload3").classList.add("change_img");
            console.log(event)
        }
        reader.readAsDataURL(input.files[0]);
    }

    
    /* 사진 추가시 (0/3) 숫자 변경 */
    if(document.inquiry.file1.value.trim() != "") {
        document.querySelector("#up_num").innerHTML ="1";
    };
    if((document.inquiry.file1.value.trim() != "" && document.inquiry.file2.value.trim() != "") || (document.inquiry.file1.value.trim() != "" && document.inquiry.file3.value.trim() != "") || (document.inquiry.file2.value.trim() != "" && document.inquiry.file3.value.trim() != "")) {
        document.querySelector("#up_num").innerHTML ="2";
    };
    if(document.inquiry.file1.value.trim() != "" && document.inquiry.file2.value.trim() != "" && document.inquiry.file3.value.trim() != "") {
        document.querySelector("#up_num").innerHTML ="3";
    }
}