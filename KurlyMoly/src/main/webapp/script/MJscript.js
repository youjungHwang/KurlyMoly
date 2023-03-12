//상단메뉴바 고정
window.onscroll = function sticky() {
	var nav = document.getElementsByClassName("gnbMenu");


	if (window.pageYOffset > nav[0].offsetTop) {
		nav[0].classList.add("nav");


	} else {
		nav[0].classList.remove("nav");

	}
}

//index.html 사이드바 top을 512px로 고정, 515이상스크롤 되었을 때 내려감
$(function() {

	//사이드바 스크롤

	const scrollHeight = 512;

	function sidebar() {
		if ($(document).scrollTop() > scrollHeight) {
			let top = $(document).scrollTop();

			document.getElementById('qnbMain').style.top = top + 'px'; //스크롤내릴때 top값


		} else{
			document.getElementById('qnbMain').style.top = '512px'; //고정값
		}
	}

	sidebar();

	$(document).scroll(() => {
		sidebar();
	});

});
//index.html을 제외한 나머지 사이드바 스크롤 
//몇몇 페이지 하단부분 사이드바 꺼짐-->수정(borad:전체,goods:cart,dtail,order,member:join,mypage:전체,event페이지전체)
$(function() {

	//사이드바 스크롤

	const scrollHeight = 300;

	function sidebar() {
		if ($(document).scrollTop() > scrollHeight) {
			let top = $(document).scrollTop();

			document.getElementById('qnb').style.top = top + 'px'; //스크롤내릴때 top값

		} else {
			document.getElementById('qnb').style.top = '150px'; //고정값(padding-top+top=300px)
		}
	}

	sidebar();

	$(document).scroll(() => {
		sidebar();
	});

});
//event페이지들 좌측 플로팅메뉴바 따라오기
$(function() {
	let lastScroll = 0;
	$(window).scroll(function(event) {
		let scroll = $(this).scrollTop();
		if (scroll > 170) {
			// 이벤트를 적용시킬 스크롤 높이
			$('.menu_Event').addClass("gnb_stop");
		} else {
			$('.menu_Event').removeClass("gnb_stop");
		}
		lastScroll = scroll;
	});
});

//카테고리메뉴펼치기-->카테고리 항목으로 커서 옮길시 none 처리 돼버림
//지도아이콘 커서올릴시 display:block
$(document).ready(function() {
	$('.menu1 > a').mouseenter(function() {
		$('.gnb_sub').css('display', 'block');
	});
	$('.gnb_sub .inner_sub ').mouseleave(function() {
		$('.gnb_sub').css('display', 'none');
	});
	$('.inner_sub > ul > li').mouseenter(function() {
		$('.gnb_sub').css('width', '438px');
	});
	$('.inner_sub .sub_menu2 > li ').mouseenter(function() {
		$('.gnb_sub').css('width', '715px');
	});
	$('.inner_sub > ul > li ').mouseleave(function() {
		$('.gnb_sub').css('width', '219px');
	});
	$('.location_set').mouseenter(function() {
		$('.layer_location').css("display", "block");
	});
	$('.layer_location').mouseleave(function() {
		$('.layer_location').css("display", "none");
	});
	//카테고리 메뉴
	$('.menu').mouseenter(function() {
		$(this).siblings('.sub_menu').css("display", "block");
	});
	$('.menu').mouseleave(function() {
		$(this).siblings('.sub_menu > li').css("display", "none");

	});
	$('.sub_menu').mouseenter(function() {
		$(this).css("display", "block");
	});
	$('.menu').mouseleave(function() {
		$(this).siblings('.sub_menu').css("display", "none");
	});
	//카테고리메뉴2
	$('.menu').mouseenter(function() {
		$(this).siblings('.sub_menu2').css("display", "block");
	});
	$('.menu').mouseleave(function() {
		$(this).siblings('.sub_menu2 > li').css("display", "none");

	});
	$('.sub_menu2').mouseenter(function() {
		$(this).css("display", "block");
	});
	$('.menu').mouseleave(function() {
		$(this).siblings('.sub_menu2').css("display", "none");
	});
	$('.btn_dropup').click(function() {
		if ($('.list').is(":visible")) {
			$('.list').css("display", "none");
		} else {
			$('.list').css("display", "block");
		}
	});
	$('.btn').click(function() {
		if ($('.list_product').is(":visible")) {
			$('.list_product').css("display", "none");
			$('.info_product .btn').css("-webkit-transform", "rotate(180deg)");
		} else {
			$('.list_product').css("display", "block");
			$('.info_product .btn').css("-webkit-transform", "none");
		}
	});
	$('.btn').click(function() {
		if ($('.short_info').is(":visible")) {
			$('.short_info').css("display", "none");
		} else {
			$('.short_info').css("display", "block");

		}

	});
	$('.view_popselbox').click(function() {
		if ($('.layer_coupon').is(":visible")) {
			$('.layer_coupon').css("display", "none");
		} else {
			$('.layer_coupon').css("display", "block");
		}
	});



});

//index배너 클릭 삭제
$('.btn_top_bnr').click(function() {
	$('.bnr_header').css("display", "none");
});



//Onclick
$(function() {
	$('.page_article #top_menu ul li a').click(function() {
		$(this).toggleClass("Onclick");
		if ($('.page_article #top_menu ul li').click()) {
			$('.page_article #top_menu ul li a').toggleClass("page_article #top_menu ul li a");
		}
	});
});
//스위치기능
$(function() {
	$('.list_round').click(function() {
		$('#goodsList label').toggleClass("switchOn1");
		$('.btn_onoff').toggleClass("switchOn2");
	});
});
//찜기능,장바구니아이콘클릭
$(function() {
	$(".turn_off").click(function() {
		$(this).toggleClass("turnOn");
	});
	$('.chart_btn').click(function() {
		$('#cartPut').css("display", "block");
	});
});
//goods_list 장바구니창 취소버튼(닫기)
$(function() {
	$('.btn_type2').click(function() {
		$('#cartPut').css("display", "none");
	});
});
//선텍 삭제

// 찜목록에 아무것도 없을 때
$(document).ready(function() {
	const forLength
		= document.querySelectorAll('input[name="chkItem"]');
	if (forLength.length == 0) {
		$('.hasNone').css("display", "table-row");
	}
});



//goods_cart삭제
function deleteChecked() {
	const CH = document.querySelectorAll('input[name="chkItem"]:checked');

	$('input:checkbox[name="chkItem"]').each(function() {
		if (this.checked) {
			var $li_id = $(this).parent().parent().parent();
			$li_id.remove(); // 삭제하기
		}
	});
	if (!CH.length > 0) {
		alert("선택한 항목이 없습니다!")
	}
	$("input[type=checkbox]").prop("checked", false);


	const forLength
		= document.querySelectorAll('input[name="chkItem"]');
	if (forLength.length == 0) {
		$('.hasNone').css("display", "none")
	}

}


//전체체크박스 

function Allcheck1() {
	if ($("input[name='checkAll1']").is(':checked')) {
		$("input[name='chkItem']").prop("checked", true);
		$("input[name='checkAll2']").prop("checked", true);
	} else {
		$("input[name='chkItem']").prop("checked", false);
		$("input[name='checkAll2']").prop("checked", false);
	}
}

function Allcheck2() {
	if ($("input[name='checkAll2']").is(':checked')) {
		$("input[name='chkItem']").prop("checked", true);
		$("input[name='checkAll1']").prop("checked", true);
	} else {
		$("input[name='chkItem']").prop("checked", false);
		$("input[name='checkAll1']").prop("checked", false);
	}
}


//전체아이템이 선택이 되면 전체선택 체크박스 체크

function getCheck() {
	//아이템 체크박스
	const Boxcheck = document.querySelectorAll('input[name="chkItem"]');
	//선택된 체크박스
	const Boxchecked = document.querySelectorAll('input[name="chkItem"]:checked');

	if (Boxcheck.length === Boxchecked.length) {
		$("input[name='checkAll1']").prop("checked", true);
		$("input[name='checkAll2']").prop("checked", true);
	} else {
		$("input[name='checkAll1']").prop("checked", false);
		$("input[name='checkAll2']").prop("checked", false);
	}
}


//														여기서 order.jsp 입니다 
//결제수단체크(모르겠다...)
$(document).ready(function () {
    $(".label_radio").on('click', function (e) {
        e.preventDefault();
        
        if ($(this).hasClass('checked')) {
            $(this).removeClass('checked');
        } else {
            $(this).addClass('checked');
        }
         
    });
});

//적립금 적용 스크립트(어디선가 작동이 되는거 같은데)
$(document).ready(function() {
	$(".emoney_chkbox").on('click', function(e) {
	  e.preventDefault();
	  if($(this).hasClass('disabled')) return false;
	  if($(this).hasClass('checked')){
	    $(this).removeClass('checked');
	    document.frmOrder.using_point.value = 0;
	    chk_emoney(document.frmOrder.using_point);
	    calcu_settle();
	  }else{
	    $(this).addClass('checked');
	    var all_emoney =  uncomma('0');
	    document.frmOrder.using_point.value = all_emoney;
	    chk_emoney(document.frmOrder.using_point);
	    calcu_settle();
	  }
	});
});

  







//장바구니페이지 세부스크립트(마켓컬리스크립트)

//
gnbMenu.update();

// 검색창 클래스 추가/삭제
var searchInputAction = (function() {
	var $target = {};

	var _searchInputAction = {
		setSeletor: function() {
			$target = {
				$parent: $('#gnb'),
				$search: $('#gnb [name=sword]'),
				$deleteBtn: $('#searchInit'),
				$edit: $('#edit')
			}

			this.setAction();
		},
		setAction: function() {
			var that = this;
			$target.$search.focus(function() {
				that.changeClass($target.$search, 'add', 'focus');
				that.deleteCheck();
			}).blur(function() {
				that.changeClass($target.$search, 'remove', 'focus');
				that.deleteCheck(false);
			}).on('keyup', function() {
				if ($target.$edit.val() !== 'Y') {
					$target.$edit.val('Y');
				}
				that.deleteCheck();
			});

			$target.$deleteBtn.on('click', function() {
				$target.$search.val('');
				that.deleteCheck();
			});
		},
		deleteCheck: function(type) {
			var that = this, count = $.trim($target.$search.val()).length;
			if (count === 0 || (typeof type !== 'undefined' && !type)) {
				that.changeClass($target.$deleteBtn, 'remove', 'on');
			} else {
				that.changeClass($target.$deleteBtn, 'add', 'on');
			}
		},
		changeClass: function(target, type, className) {
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
$('#header .link_main').on('click', function(e) {
	e.preventDefault();
	KurlyTracker.setAction('select_main_logo').sendData();
	location.href = $(this).attr('href');
});

$('#gnb .gnb .link').on('click', function(e) {
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
$('#gnbMenu .btn_cart').on('click', function(e) {
	e.preventDefault();
	KurlyTracker.setAction('select_cart').sendData();
	location.href = $(this).attr('href');
});









