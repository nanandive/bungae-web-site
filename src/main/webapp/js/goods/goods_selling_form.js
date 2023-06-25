$(document).ready(function ( ) {
    document.querySelectorAll(".goods_Lcategory > div").forEach(lcategory => {
        lcategory.addEventListener("click", function() {
            document.querySelectorAll("div[class^='goods_Scategory'] > div").forEach(scategory => {
                scategory.classList.remove("selected");
            });
            document.querySelectorAll(".goods_Lcategory > div").forEach(sib => {
                sib.removeAttribute("class");
            });
            this.setAttribute("class", "selected");
            document.querySelector(".goods_category").style.borderColor="rgb(245, 126, 0)";
            document.querySelector(".goods_category + p").classList.remove("hidden");
            
            document.querySelector("div.goods_Scategory").classList.add("hidden");

            if(lcategory.innerText === "의류"){
                document.querySelector("div.goods_Scategory_acc").classList.add("hidden");
                const classList = document.querySelector("div.goods_Scategory_cloth").classList;
                classList.remove("hidden");
            } else {
                document.querySelector("div.goods_Scategory_cloth").classList.add("hidden");
                const classList = document.querySelector("div.goods_Scategory_acc").classList;
                classList.remove("hidden");
            }

            document.querySelector(".goods_category_area span.selected_category").innerText = this.innerText;
        });
    });

    document.querySelectorAll("div[class^='goods_Scategory'] > div").forEach(scategory => {
        scategory.addEventListener("click", function() {
            const children = this.parentElement.children
            for (let i = 0; i < children.length; i++) {
                children[i].removeAttribute("class");
            }
            this.classList.add("selected");

            document.querySelector(".goods_category").style.borderColor="rgb(220, 219, 228)";
            document.querySelector(".goods_category + p").classList.add("hidden");

            let selectedCategory = document.querySelector(".goods_category_area span.selected_category").innerText.split(" ");
            document.querySelector(".goods_category_area span.selected_category").innerText = selectedCategory[0] + " > " + this.innerText;
        });
    });

    document.querySelector(".goods_tag > input").addEventListener("keyup", tagAdd);
    document.querySelector(".checkbox_safePay > input[type='checkbox']").addEventListener("click", thunerPay);
});

function setImages(event){
    let cnt = document.querySelector(".image_num").innerText

    for(var image of event.target.files){
        var reader = new FileReader();
        
        reader.onload = function(event){
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "preview");
            document.querySelector("div.preview_wrap").appendChild(img);
            cnt++;
            document.querySelector(".image_num").innerText = cnt;
        };
        
        reader.readAsDataURL(image);
        if(cnt >= 4){
            break;
        }
    }
}

function countTitleLength(event) {
    document.querySelector("span.goods_title_length span").innerText = event.target.value.length;
}

function countInfoLength(event) {
    document.querySelector("span.info_length span").innerText = event.target.value.length;
}

function valueIsNumber(event){
    event.target.value = event.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
}

function tagDelete(event) {
    let lastParent = event.target;
    while(true){
        lastParent =  lastParent.parentElement;
        if(lastParent.className === "tag_button"){
            lastParent.replaceChildren();
            lastParent.remove()
            break;
        }
    }
}


function tagAdd(event){
    if(event.keyCode == 32){
        const tag_button = document.querySelectorAll(".tag_button").length;
        if(tag_button >= 6){
            alert("태그는 최대 5개까지만 입력가능합니다");
        } else{
            event.preventDefault();
            let tagBtn = document.querySelector("div.tag_button").cloneNode(true);
            tagBtn.children[0].innerText = event.target.value;
            tagBtn.classList.remove("hidden");
            document.querySelector("div.goods_tag").insertBefore(tagBtn, this);
            event.target.value = "";
        }
    }
}

function thunerPay() {
    if(this.checked){
        document.querySelectorAll("div.safe_pay_notice span.check").forEach(check => {
            check.style.borderLeftColor="#ff5058"
            check.style.borderBottomColor="#ff5058"
        })
    } else{
        document.querySelectorAll("div.safe_pay_notice span.check").forEach(check => {

            check.style.borderLeftColor="rgb(250, 250, 253)"
            check.style.borderBottomColor="rgb(250, 250, 253)"
        })
    }
}