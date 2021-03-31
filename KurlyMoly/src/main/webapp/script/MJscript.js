//상단메뉴바 고정
window.onscroll = function sticky() {
    var nav = document.getElementsByClassName("gnbMenu");


    if(window.pageYOffset > nav[0].offsetTop){
        nav[0].classList.add("nav");


    }else{
        nav[0].classList.remove("nav");

    }
}
//index.html 사이드바 top을 512px로 고정, 515이상스크롤 되었을 때 내려감
$(function(){

	//사이드바 스크롤
	
    const scrollHeight = 512;

	function sidebar(){
		if($(document).scrollTop() > scrollHeight){
			let top = $(document).scrollTop();

			document.getElementById('qnbMain').style.top = top +'px'; //스크롤내릴때 top값


		}else{
            document.getElementById('qnbMain').style.top = '512px'; //고정값
        }
	}

	sidebar();

	$(document).scroll(()=>{
		sidebar();
	});

});
//index.html을 제외한 나머지 사이드바 스크롤 
//몇몇 페이지 하단부분 사이드바 꺼짐-->수정(borad:전체,goods:cart,dtail,order,member:join,mypage:전체,event페이지전체)
$(function(){

	//사이드바 스크롤
	
    const scrollHeight = 300;

	function sidebar(){
		if($(document).scrollTop() > scrollHeight){
			let top = $(document).scrollTop();

			document.getElementById('qnb').style.top = top +'px'; //스크롤내릴때 top값

		}else{
            document.getElementById('qnb').style.top = '150px'; //고정값(padding-top+top=300px)
        }
	}

	sidebar();

	$(document).scroll(()=>{
		sidebar();
	});

});

//카테고리메뉴펼치기-->카테고리 항목으로 커서 옮길시 none 처리 돼버림
//지도아이콘 커서올릴시 display:block
$(document).ready(function(){
    $('.menu1 > a').mouseenter(function(){
        $('.gnb_sub').css('display','block');
    });
    $('.gnb_sub .inner_sub ').mouseleave(function(){
        $('.gnb_sub').css('display','none');
    });
    $('.inner_sub > ul > li').mouseenter(function(){
        $('.gnb_sub').css('width','438px');
    });
    $('.inner_sub .sub_menu2 > li ').mouseenter(function(){
        $('.gnb_sub').css('width','715px');
    });
    $('.inner_sub > ul > li ').mouseleave(function(){
        $('.gnb_sub').css('width','219px');
    });
    $('.location_set').mouseenter(function(){
        $('.layer_location').css("display","block");
    });
    $('.layer_location').mouseleave(function(){
        $('.layer_location').css("display","none");
    });
    //카테고리 메뉴
    $('.menu').mouseenter(function(){
        $(this).siblings('.sub_menu').css("display","block");
    });
    $('.menu').mouseleave(function(){
        $(this).siblings('.sub_menu > li').css("display","none");
        
    });
    $('.sub_menu').mouseenter(function(){
        $(this).css("display","block");
    });
    $('.menu').mouseleave(function(){
        $(this).siblings('.sub_menu').css("display","none");
    });
    //카테고리메뉴2
    $('.menu').mouseenter(function(){
        $(this).siblings('.sub_menu2').css("display","block");
    });
    $('.menu').mouseleave(function(){
        $(this).siblings('.sub_menu2 > li').css("display","none");
        
    });
    $('.sub_menu2').mouseenter(function(){
        $(this).css("display","block");
    });
    $('.menu').mouseleave(function(){
        $(this).siblings('.sub_menu2').css("display","none");
    });
    $('.btn_dropup').click(function(){
        if($('.list').is(":visible")){
            $('.list').css("display","none");
        }else{
            $('.list').css("display","block");
        }
    });
    $('.btn').click(function(){
        if($('.list_product').is(":visible")){
            $('.list_product').css("display","none");
            $('.info_product .btn').css("-webkit-transform","rotate(180deg)");
        }else{
            $('.list_product').css("display","block");
            $('.info_product .btn').css("-webkit-transform","none");
        }
    });
    $('.btn').click(function(){
        if($('.short_info').is(":visible")){
            $('.short_info').css("display","none");
        }else{
            $('.short_info').css("display","block");
            
        }
        
    });
    $('.view_popselbox').click(function(){
        if($('.layer_coupon').is(":visible")){
            $('.layer_coupon').css("display","none");
        }else{
            $('.layer_coupon').css("display","block");
        }
    });
    


});
//셀렉트체인지
// $('.list > li').on("change",function(){
//     $(this).
// });


function createSpan(){
    var obj = document.getElementsByClassName('.box');   
    var newSpan = document.createElement("span");   
    newSpan.innerHTML = '';
    newSpan.setAttribute("class","bg");
    newSpan.style.display = "none";
    newSpan.style.height = "10px";
    newSpan.style.borderTop = "1px solid #ccc";
    newSpan.style.backgroundColor = "#f4f4f4";

    obj.appendChlid(newSpan);


    
}
function createP(){
    var obz = document.getElementsByClassName('.bg');
    var newP = document.createElement("p");
    newP.innerHTML='장바구니에 담긴 상품이 없습니다.';
    newP.setAttribute("class","txt");
    newP.style.width = "100%";
    newP.style.marginTop = "0";
    newP.style.padding = "115px 0 116px";
    newP.style.fontWeight = "700";
    newP.style.fontSize = "16px";
    newP.style.color = "#333";
    newP.style.textAlign = "center";

    obz.appendChlid(newP);

}



//Onclick
$(function(){
    $('.page_article #top_menu ul li a').click(function(){
        $(this).toggleClass("Onclick");
        if($('.page_article #top_menu ul li').click()){
            $('.page_article #top_menu ul li a').toggleClass("page_article #top_menu ul li a");
        }
    });
});
//스위치기능
$(function(){
    $('.list_round').click(function(){
        $('#goodsList label').toggleClass("switchOn1");
        $('.btn_onoff').toggleClass("switchOn2");
    });
});
//찜기능,장바구니아이콘클릭
$(function(){
    $(".turn_off").click(function(){
        $(this).toggleClass("turnOn");
    });
    $('.chart_btn').click(function(){
        $('#cartPut').css("display","block");
    });
});
//goods_list 장바구니창 취소버튼(닫기)
$(function(){
    $('.btn_type2').click(function(){
        $('#cartPut').css("display","none");
    });
});
//goods_cart


//페이지롤링
$(function () {

    function AutoSlider($trigger, time) {
        this.$trigger = $trigger;
        this.interval = null;
        this.time = time || 5000;
    }
    AutoSlider.prototype.start = function () {
        this.interval = setTimeout(function () {
            this.$trigger.trigger('click');
        }.bind(this), this.time);
        return this;
    }
    AutoSlider.prototype.stop = function () {
        clearTimeout(this.interval);
        return this;
    }

    $(".__slide-wrapper[data-slide-auto]").each(function () {
        var $wrapper = $(this);
        var time = +$wrapper.data("slide-auto");
        $wrapper.data("slide-auto-timer", new AutoSlider($wrapper.find(".__slide-go-right"), time));
        $wrapper.data("slide-auto-timer").start();
        $wrapper.on('mouseover mouseout', function (e) {
            $(this).data("slide-auto-timer")[e.type === 'mouseover' ? 'stop' : 'start']();
        });
    });

    $(".main-slider.__slide-wrapper").on({
        mouseenter: function () {
            var $wrapper = $(this);
            var time = +$wrapper.data("slide-auto");
            $(this).data("slide-auto-timer").stop();
        },
        mouseleave: function () {
            var $wrapper = $(this);
            var time = +$wrapper.data("slide-auto");
            $(this).data("slide-auto-timer").start();
        }
    })

    $(document).on("click", ".__slide-go-left, .__slide-go-right, [data-slide-go]", function ($e) {
        $e.preventDefault();
        function AutoSlider($trigger, time) {
            this.$trigger = $trigger;
            this.interval = null;
            this.time = time || 5000;
        }
        AutoSlider.prototype.stop = function () {
            clearTimeout(this.interval);
            return this;
        }

        var $trigger = $(this);
        var $wrapper = $trigger.closest(".__slide-wrapper");
        var $mover = $wrapper.find(".__slide-mover").eq(0);
        if ($mover.is(":animated")) {
            return;
        }
        var $items = $mover.find("> .__slide-item");
        var $target, moveTo = 0;
        var itemSize = $wrapper.data("slide-item") || 1;
        var slideWidth = $items.eq(1).outerWidth(true) * itemSize;


        //console.log($items.length, itemSize);
        if ($items.length > itemSize) {
            if ($trigger.hasClass('__slide-go-left')) {
                $target = $items.slice(-itemSize);
                $target.clone().prependTo($mover);
                $mover.css('left', -slideWidth + 'px');
            } else if ($trigger.hasClass('__slide-go-right')) {
                $target = $items.slice(0, itemSize);
                $target.clone().appendTo($mover);
                moveTo = -slideWidth;
            } else {
                if ($trigger.hasClass("__active")) {
                    return;
                }
                moveTo = -slideWidth * +$trigger.data("slide-go");
                $trigger.siblings('.__active').removeClass('__active');
                $trigger.addClass('__active');
                //console.log(moveTo);
            }
            // auto slider option
            var $timer = null;
            if ($wrapper.data("slide-auto-timer") instanceof AutoSlider) {
                $timer = $wrapper.data("slide-auto-timer");
            } else if ($trigger.data("slide-auto-keep") === "parent") {
                //console.log($wrapper);
                $timer = $wrapper.closest("[data-slide-auto]").data("slide-auto-timer");
                //console.log($timer);
            }
            $timer && $timer.stop();
            //autoSlider.stop();
            $mover.animate({ 'left': moveTo + 'px' }, 300, function () {
                $target && $target.remove();
                $target && $mover.css('left', 0);
                $timer && $timer.start();
            });
        }
    });
});
//선텍 삭제

// 찜목록에 아무것도 없을 때
$(document).ready(function() {
    const forLength 
    = document.querySelectorAll('input[name="check"]');
    if(forLength.length == 0){
        $('.hasNone').css("display" , "table-row");
    }
});


    // 삭제버튼 스크립트
// $(document).ready(function(){
//     $('.solo').on('click', function(e){
//     $(this).parentsUntil("tbody").remove()

//     const forLength 
//         = document.querySelectorAll('input[name="check"]');
//         if(forLength.length == 0){
//             $('.hasNone').css("display" , "table-row");
//         }
//     });
// });

//goods_cart삭제
function deleteChecked() {
const CH = document.querySelectorAll('input[name="check"]:checked');

$('input:checkbox[name="check"]').each(function() {
    if (this.checked){
            var $li_id = $(this).parent().parent().parent();
            $li_id.remove(); // 삭제하기
    }
});
if(!CH.length>0){
    alert("선택한 항목이 없습니다!")
}
$("input[type=checkbox]").prop("checked", false);


const forLength 
    = document.querySelectorAll('input[name="check"]');
    if(forLength.length == 0){
        $('.hasNone').css("display" , "none")
    }

}  


function checkSelectAll()  {
// 전체 체크박스
const checkboxes 
    = document.querySelectorAll('input[name="check"]');
// 선택된 체크박스
const checked 
    = document.querySelectorAll('input[name="check"]:checked');
// select all 체크박스
const selectAll 
    = document.querySelector('input[name="selectall"]');

if(checkboxes.length === checked.length)  {
    selectAll.checked = true;
    
}else {
    selectAll.checked = false;
    
}

}
function checkAll(selectAll)  {
const checkboxes 
    = document.getElementsByName('check');
checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
});
}

//장바구니페이지 세부스크립트(마켓컬리스크립트)

//
gnbMenu.update();

// 검색창 클래스 추가/삭제
var searchInputAction = (function () {
    var $target = {};

    var _searchInputAction = {
        setSeletor: function () {
            $target = {
                $parent: $('#gnb'),
                $search: $('#gnb [name=sword]'),
                $deleteBtn: $('#searchInit'),
                $edit: $('#edit')
            }

            this.setAction();
        },
        setAction: function () {
            var that = this;
            $target.$search.focus(function () {
                that.changeClass($target.$search, 'add', 'focus');
                that.deleteCheck();
            }).blur(function () {
                that.changeClass($target.$search, 'remove', 'focus');
                that.deleteCheck(false);
            }).on('keyup', function () {
                if ($target.$edit.val() !== 'Y') {
                    $target.$edit.val('Y');
                }
                that.deleteCheck();
            });

            $target.$deleteBtn.on('click', function () {
                $target.$search.val('');
                that.deleteCheck();
            });
        },
        deleteCheck: function (type) {
            var that = this, count = $.trim($target.$search.val()).length;
            if (count === 0 || (typeof type !== 'undefined' && !type)) {
                that.changeClass($target.$deleteBtn, 'remove', 'on');
            } else {
                that.changeClass($target.$deleteBtn, 'add', 'on');
            }
        },
        changeClass: function (target, type, className) {
            if (type === 'add') {
                target.addClass(className);
            } else {
                target.removeClass(className);
            }
        }
    }

    _searchInputAction.setSeletor();
})();

// 로고 클릭 이벤트
$('#header .link_main').on('click', function (e) {
    e.preventDefault();
    KurlyTracker.setAction('select_main_logo').sendData();
    location.href = $(this).attr('href');
});

$('#gnb .gnb .link').on('click', function (e) {
    e.preventDefault();
    var _event_name, _event_info;
    if ($(this).hasClass('new')) {
        _event_name = 'select_new_product_subtab';
    } else if ($(this).hasClass('best')) {
        _event_name = 'select_popular_product_subtab';
    } else if ($(this).hasClass('bargain')) {
        _event_name = 'select_bargain_subtab';
    } else if ($(this).hasClass('event')) {
        _event_name = 'select_event_list_subtab';
    }
    _event_info = $(this).attr('href');

    KurlyTracker.setEventInfo(_event_info).setAction(_event_name).sendData();
    location.href = _event_info;
});

// 장바구니 아이콘 클릭이벤트
$('#gnbMenu .btn_cart').on('click', function (e) {
    e.preventDefault();
    KurlyTracker.setAction('select_cart').sendData();
    location.href = $(this).attr('href');
});











//회원가입페이지//

//아이디 정규식확인
$(document).ready(function () {
    $('input[name=name]').on('keyup keydown blur', function () {
        preventSpecialChars($(this), 'write');
    });

    $("#formSubmit .btn_submit").click(function () {
        $("input[type='text']").each(function () {
            var input_txt = $(this).val();
            var input_trim_txt = input_txt.replace(/(^\s*)|(\s*$)/gi, "");
            $(this).val(input_trim_txt);
        })
    });

    // PRDPJ-159 장차석 : 사용자 아이디와 추처인 아이디 중복 안되도록 처리
    var $nameRecommid = $('[name=recommid]');
    var $nameMId = $('[name=m_id]');
    $($nameRecommid, $nameMId).blur(function () {
        if ($.trim($nameMId.val()) !== '' && $.trim($nameRecommid.val()) !== '' &&
            ($nameRecommid.val() === $nameMId.attr('data-id') || $nameRecommid.val() === $nameMId.val())) {
            $nameRecommid.val('');
            alert('추천인 아이디에는 본인 아이디를 입력할 수 없습니다.');
        }
    });

    //개인정보처리방침
    function getAgreement() {
        jQuery.ajax({
            url: "/shop/service/private.php",
            cache: false,
            dataType: "html",
            type: "GET",
            contentType: 'text/html; charset=euc-kr',
            success: function (data) {
                jQuery(".agreement_box").html(jQuery(data).find('.hundred'));
            }
        });
    }
    getAgreement();

    // 레이어 열기,닫기
    $('.check_view .btn_link').on('click', function (e) {
        e.preventDefault();
        var $layer1 = $(this).is('.btn_agreement');
        var $layer2 = $(this).is('.btn_essential');
        var $layer3 = $(this).is('.btn_choice');
        var bgDimd = $('.bg_dim');
        var $target = $(this).parents('.reg_agree').find('.layer');

        var $agreement = $(this).parents('.reg_agree').find('.layer_agreement');
        var $essential = $(this).parents('.reg_agree').find('.layer_essential');
        var $choice = $(this).parents('.reg_agree').find('.layer_choice');
        var topResult = null;

        if ($layer1 == true) {
            bgDimd.show();
            $agreement.show();
            $essential.hide();
            $choice.hide();
            topResult = $agreement;
        } else if ($layer2 == true) {
            bgDimd.show();
            $essential.show();
            $agreement.hide();
            $choice.hide();
            topResult = $essential;
        } else if ($layer3 == true) {
            bgDimd.show();
            $choice.show();
            $essential.hide();
            $agreement.hide();
            topResult = $choice;
        }
        topResult.css({
            'margin-top': -topResult.height() / 2
        });
    });
    $('.reg_agree .btn_ok,.reg_agree .btn_close').on('click', function (e) {
        e.preventDefault();
        $(this).parents('.layer').hide();
        $('.bg_dim').hide();
    });

    // 이용약관전체동의
    var agree = $('.reg_agree');
    $('.check_agree input[name = agree_allcheck]').change(function () {
        if ($(this).is(':checked') === true) {
            $('.check_agree').addClass('checked')
            agree.find('input[type=checkbox]').attr('checked', 'checked');
            agree.find('input[type=checkbox]').prop('checked', 'checked');
            agree.find('input[type=checkbox]').val('y');
            $('#consentHidden').val('y');
        } else {
            $('.check_agree').removeClass('checked')
            agree.find('input[type=checkbox]').attr('checked', '');
            agree.find('input[type=checkbox]').prop('checked', '');
            agree.find('input[type=checkbox]').val('n');
            $('#consentHidden').val('n');
        }
    });
    $('.reg_agree').find('input[type=checkbox]').change(function () {
        if ($(this).is(':checked')) {
            $(this).parent().addClass('checked');
            $(this).attr('checked', 'checked');
            $(this).prop('checked', 'checked');
            $(this).val('y');
            if ($(this).attr('name') == 'hiddenCheck') $('#consentHidden').val('y');
        } else {
            $(this).parent().removeClass('checked');
            $(this).attr('checked', '');
            $(this).prop('checked', '');
            $(this).val('n');
            if ($(this).attr('name') == 'hiddenCheck') $('#consentHidden').val('n');
        }
        $('.reg_agree').find('input[type=checkbox]').each(function () {
            if ($(this).is(':checked') === false) {
                $('.label_all_check').removeClass('checked');
                return false;
            }
        });
        if ($(this).attr('name') === 'marketing') {
            if ($(this).is(':checked')) {
                $('.email_sms').find('.check_agree').addClass('checked');
                $('.email_sms').find('input').attr('checked', 'checked');
                $('.email_sms').find('input').prop('checked', 'checked');
                $('.email_sms').find('input').val('y');
            } else {
                $('.email_sms').find('.check_agree').removeClass('checked');
                $('.email_sms').find('input').attr('checked', '');
                $('.email_sms').find('input').prop('checked', '');
                $('.email_sms').find('input').val('n');
            }
        }
        if ($(this).attr('name') === 'mailling' || $(this).attr('name') === 'sms') {
            var emailSmsCount = 0;
            $(this).parents('.email_sms').find('input').each(function () {
                if ($(this).is(':checked')) emailSmsCount++;
            });
            if (emailSmsCount === 2) {
                $('input[name=marketing]').parent().addClass('checked');
                $('input[name=marketing]').attr('checked', 'checked');
                $('input[name=marketing]').prop('checked', 'checked');
            } else {
                $('input[name=marketing]').parent().removeClass('checked');
                $('input[name=marketing]').attr('checked', '');
                $('input[name=marketing]').prop('checked', '');
            }
        }

        // 전체동의
        if ($('.reg_agree').find('.checked').length >= 7) {
            $('.check_agree input[name = agree_allcheck]').parent().addClass('checked');
            $('.check_agree input[name = agree_allcheck]').prop('checked', 'checked');
        } else {
            $('.check_agree input[name = agree_allcheck]').parent().removeClass('checked');
            $('.check_agree input[name = agree_allcheck]').prop('checked', '');
        }
    });

    function inputFocus() {
        $('#form input').focus(function () {
            var element = $(this);
            if (element.offset().top - $(window).scrollTop() < 80) {
                $('html, body').animate({
                    scrollTop: element.offset().top - 80
                }, 0);
            }
        });
    }
    inputFocus();


    // 글자 갯수확인 + 문장조합확인
    var checkType1 = false;// 갯수
    var checkType2 = false;// 문자
    var checkType3 = false;// 문자만
    function check_confirm(characterReg, minNum) {
        if (characterReg.length < minNum) {
            checkType1 = false;
        } else {
            checkType1 = true;
        }

        var checkNumber = characterReg.search(/[0-9]/g); // 숫자
        var checkEnglish = characterReg.search(/[a-zA-Z]/ig); // 대소문자
        var checkSpecial = characterReg.search(/[~`!>@?/<#"'\$;:\]%\.\^,&\[*()_\+\-=|\\{}]/ig); // 특수문자
        var checkAscii = characterReg.search(/[^a-zA-Z0-9~`!>@?/<#"'\$;:\]%\.\^,&\[*()_\+\-=|\\{}]/ig); // 아스키 특수문자

        if (checkNumber >= 0 && checkEnglish >= 0 && checkAscii === -1) {
            checkType2 = true;
            checkType3 = true;
            if (checkSpecial !== -1) checkType3 = false;
        } else if (checkNumber >= 0 && checkSpecial !== -1 && checkAscii === -1) {
            checkType2 = true;
            checkType3 = false;
        } else if (checkEnglish >= 0 && checkSpecial !== -1 && checkAscii === -1) {
            checkType2 = true;
            checkType3 = false;
        } else if (checkEnglish >= 0 && checkSpecial === -1 && checkAscii === -1) {
            checkType3 = true;
            if (checkNumber === -1) checkType2 = false;
        } else {
            checkType2 = false;
            checkType3 = false;
        }
    }


    // 아이디검증
    var saveId;
    $('[name=m_id]').on('focus', function () {
        saveId = $(this).val();
        $(this).parent().find('.txt_guide').show();
    });
    $('[name=m_id]').on('keyup', function () {
        var $target = $(this).parent().find('.txt_guide');
        var $chkVal = $(this).val();
        var $numMin = 6;
        if (saveId !== $chkVal) class_change($target.eq(1), 'bad');// 중복확인후 수정될때
        check_confirm($chkVal, $numMin);
        if (checkType1 === true && checkType3 === true) {
            class_change($target.find('.txt_case1'), 'good');
            $(this).attr('data-validator', "true");
        } else {
            class_change($target.find('.txt_case1'), 'bad');
            $(this).attr('data-validator', "false");
        }
        if ($('[name=chk_id]').val() == 1) {
            $('[name=chk_id]').val('');
            class_change($target.find('.txt_case2'), 'bad');
        }
    });

    // 비밀번호검증
    $('[name=password], [name=newPassword], [name=password2], [name=confirmPassword]').on('focus', function () {
        $(this).parent().find('.txt_guide').show();
    });
    $('[name=password], [name=newPassword], [name=password2], [name=confirmPassword]').on('blur', function () {
        if ($(this).parent().find('.txt').hasClass('bad') || $.trim($(this).val()) === "") {
            if (!$(this).hasClass('bad')) $(this).addClass('bad');
        } else {
            if ($(this).hasClass('bad')) $(this).removeClass('bad')
        }
    });
    $('input[name=password2], [name=confirmPassword]').on('keyup', function () {
        var $target = $(this).parent().find('.txt_guide');

        if (($("[name=password]").val() === $('[name=password2]').val() && $.trim($("[name=password]").val()) != "") || ($("[name=newPassword]").val() === $('[name=confirmPassword]').val() && $.trim($("[name=newPassword]").val()) != "")) {
            class_change($target.find('.txt_case1'), 'good');
        } else {
            class_change($target.find('.txt_case1'), 'bad');
        }
    });

    $('input[name=password], [name=newPassword]').on('keyup', function (e) {
        var $target = $(this).parent().find('.txt_guide');
        var $chkVal = $(this).val();
        var $numMin = 10;

        check_confirm($chkVal, $numMin);

        if (checkType1 === false && checkType2 === false) {
            class_change($target.find('.txt_case1'), 'bad');
            class_change($target.find('.txt_case2'), 'bad');
        }
        if (checkType1 === true && checkType2 === false) {
            class_change($target.find('.txt_case1'), 'good');
            class_change($target.find('.txt_case2'), 'bad');
        }
        if (checkType1 === false && checkType2 === true) {
            class_change($target.find('.txt_case1'), 'bad');
            class_change($target.find('.txt_case2'), 'good');
        }
        if (checkType1 === true && checkType2 === true) {
            class_change($target.find('.txt_case1'), 'good');
            class_change($target.find('.txt_case2'), 'good');
        }

        var hasThreeOrMoreConsecutiveNumbers = pwValidate.hasThreeOrMoreConsecutiveNumbers($chkVal)
        if (hasThreeOrMoreConsecutiveNumbers) {
            class_change($target.find('.txt_case3'), 'bad');
        } else {
            class_change($target.find('.txt_case3'), 'good');
        }

        if ($(this).attr('id') == 'newPassword') {
            if ($('[name=originalPassword]').val() == $('[name=newPassword]').val()) {
                class_change($target.find('.txt_case4'), 'bad');
            } else {
                class_change($target.find('.txt_case4'), 'good');
            }
            $('[name=confirmPassword]').trigger('keyup');
            var newPasswordCheckNum = 0;
            $target.find('.txt').each(function () {
                if ($(this).hasClass('good')) newPasswordCheckNum++;
                $('[name=newPasswordCheck]').val(newPasswordCheckNum);
            });
        } else {
            $('[name=password2]').trigger('keyup');
        }
    });

    $("#selectRecommend label").on('click', function (e) {
        var target = $(e.target)
        var wrapper = target.closest('.group_radio')

        var inputOptions = wrapper.find('label')
        var targetInput = target.closest('.radio_wrapper').find('label')

        var selectOptionId = targetInput.find('input').attr('id')
        var inputWrapper = wrapper.siblings('.input_wrapper')
        var textBox = inputWrapper.find('input')
        var defaultMessage = {
            'recommendId': '추천인 아이디를 입력해주세요.',
            'eventName': '참여 이벤트명을 입력해주세요.'
        }
        var placeholderMessage = defaultMessage[selectOptionId]

        // 라디오버튼 토글
        inputOptions.not(targetInput).removeClass('checked')
        targetInput.addClass('checked')

        // 기존 텍스트 리셋
        textBox.val("")

        // placeholder 텍스트 변경
        textBox.attr('placeholder', placeholderMessage)

        // input name, value값 변경
        var nameOptions = {
            'recommendId': 'recommid',
            'eventName': 'ex2'
        }
        textBox.attr('id', nameOptions[selectOptionId])
        inputWrapper.addClass('selected')
    })
});

// 클래스변경
function class_change(obj, state) {
    if (state === 'good') {
        if (obj.hasClass('bad')) obj.removeClass('bad');
        obj.addClass('good');
    } else {
        if (obj.hasClass('good')) obj.removeClass('good');
        obj.addClass('bad');
    }
}

// 중복확인
function chkId() {
    var alertMsg = "아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다";
    var $target = $("[name='m_id']").parent().find('.txt_case2');
    var id_txt = $("[name='m_id']").val();
    var id_trim_txt = id_txt.replace(/(^\s*)|(\s*$)/gi, "");
    $("input[name='m_id']").val(id_trim_txt);
    var form = document.frmMember;
    if ($("input[name='m_id']").val() === "") {
        alert("아이디를 입력해 주세요.");
        return;
    }
    if ($("input[name='m_id']").val().length < 6) { alert("아이디는 6자 이상의 영문 혹은 영문과 숫자 조합만 가능합니다"); return; }
    if (!chkText(form.m_id, form.m_id.value, "아이디를 입력해주세요")) return;
    var idPattern = /^[a-zA-Z0-9]{1}[^"']{3,15}$/; // chkPatten 메소드에서 가져옴
    var isValidId = eval(idPattern);
    if (!isValidId.test(form.m_id.value)) {
        alert(alertMsg);
        return;
    }
    var $idValidator = $("[name='m_id']").attr('data-validator');
    if ($idValidator === "false") {
        $("[name=chk_id]").val('');
        alert(alertMsg);
        if ($target.hasClass('good')) $target.removeClass('good');
        $target.addClass('bad');
    } else {
        ifrmHidden.location.href = "indb.php?mode=chkId&m_id=" + form.m_id.value;
    }
}
function chkId2(num) {
    var $target = $("[name='m_id']").parent().find('.txt_case2');
    var id_txt = $("[name='m_id']").val();
    if (num == 1) {
        if ($target.hasClass('bad')) $target.removeClass('bad');
        $target.addClass('good');
        $("[name='m_id']").attr('data-id', id_txt);
    } else {
        if ($target.hasClass('good')) $target.removeClass('good');
        $target.addClass('bad');
    }
}

//
function chkEmailChange($target) {
    if ($target.val() === $target.data('email') && $target.val().trim() !== '') {
        $('[name=chk_email]').val('1');
    } else {
        $('[name=chk_email]').val('0');
    }
}
// 이메일 중복확인
function chkEmail() {
    var email_txt = $("input[name='email']").val();
    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
    var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    $("input[name='email']").val(trim_txt)
    if ($("input[name='email']").val() === "") {
        alert("이메일 주소를 입력해 주세요.");
        $('[name=chk_email]').val('0');
        return false;
    }
    if (email_regex.test(trim_txt) === false) {
        alert("잘못된 이메일 형식입니다.");
        $('[name=chk_email]').val('0');
        return false;
    }

    var form = document.frmMember;
    if (!chkText(form.email, form.email.value, "이메일을 입력해주세요")) {
        $('[name=chk_email]').val('0');
        return;
    }
    if (!chkPatten(form.email, form.email.getAttribute('option'), "정상적인 이메일 주소를 입력해주세요.")) {
        $('[name=chk_email]').val('0');
        return;
    }

    $('[name=chk_email]').val('1');

    var chkUrl = "indb.php?mode=chkEmail&email=" + form.email.value + "&m_id=";
    ifrmHidden.location.href = chkUrl;
}

$("input[name='mobileInp']").change(function () {
    $("input[name='check_mobile']").val("0");
});

// 생년월일 입력시 폼 포커스 이벤트
$('.birth_day input').focus(function () {
    $(this).parent().addClass('on');
}).keyup(function () {
    var inputText = $(this).val();
    var number = $(this).val().replace(/[^0-9]/g, '');
    $(this).val(number);
}).blur(function () {
    $(this).parent().removeClass('on');
    // KM-1261 회원가입 14세 인증
    birthCheckAction.validatorText();
});


// 현재 비밀번호 확인
function checkCurrentPassword(el) {
    var currentPassword = $(el).val();
    var errorMessage = $(el).parent().find(".txt_guide");
    if (currentPassword.trim() === "") {
        errorMessage.hide();
        $('[name=originalPasswordCheck]').val('1');
        return false;
    }
    var req = { password: currentPassword };
    kurlyApi({
        method: 'post',
        // url:'/v1/users/check/password',
        url: '/v3/auth/check-password',
        data: req
    }).then(function (response) {
        if (response.status === 204) {
            errorMessage.hide();
            $('[name=originalPasswordCheck]').val('1');
            return true;
        } else {
            errorMessage.show();
            $('[name=originalPasswordCheck]').val('0');
            return false;
        }
    }.bind(this)).catch(function (err) {
        errorMessage.show();
        $('[name=originalPasswordCheck]').val('0');
        return false;
    });
}

function chkForm2(f) {
    if ($('[name=originalPasswordCheck]').val() === '0') {
        alert('현재 비밀번호를 확인해주세요', function () {
            $('[name=originalPassword]').focus();
        });
        return false;
    }

    if ($('#originalPassword').val() != "" || $('#newPassword').val() != "" || $('#confirmPassword').val() != "") {
        if ($('[name=newPasswordCheck]').val() < 4) {
            alert('새 비밀번호를 확인해주세요', function () {
                $("[name=newPassword]").focus();
            });
            return false;
        }
        if ($('#confirmPassword').val() != $('#newPassword').val()) {
            alert('새 비밀번호 확인을 확인해주세요', function () {
                $('#confirmPassword').focus();
            });
            return false;
        }
    }

    if ($('[name=chk_email]').val() !== '1') {
        alert('이메일 중복확인을 확인해주세요', function () {
            $('[name=email]').focus();
        });
        return false;
    }

    if (!preventSpecialChars($('input[name=name]'), 'result')) {
        return false;
    }

    if ($("input[name='check_mobile']").val() !== "1") {
        alert("휴대폰 인증을 완료해 주세요.", function () {
            $('#btn_cert').focus();
        });
        return false;
    }


    var email_txt = $("input[name='email']").val();
    var trim_txt = email_txt.replace(/(^\s*)|(\s*$)/gi, "");
    var email_regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
    $("input[name='email']").val(trim_txt)
    if (email_regex.test(trim_txt) === false) {
        alert('잘못된 이메일 형식입니다.', function () {
            $('input[name=email]').focus();
        });
        return false;
    }

    // KM-1261 회원가입 14세 인증
    if (!birthCheckAction.validatorForm()) {
        return false;
    }

    if (chkForm(f) === false) {
        return false;
    }
    return true;
}

$(document).ready(function () {
    // 추천인 자동 설정
    var recommRegExp = new RegExp("recommid=([^&]+)", "i");
    var match = location.search.match(recommRegExp);
    if (match !== null && match.length === 2) {
        $('#labelRecomm').click();
        $('input[name=recommid]').val("");
    }
});


// KM-1483 Amplitude
KurlyTracker.setScreenName('sign_up').setAction('view_sign_up').sendData();

//주소찾기
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}








