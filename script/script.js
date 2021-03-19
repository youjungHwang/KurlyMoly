'use strict';

// $(document).ready(function () {
//     $("#top-message-close").on("click", function () {
//         setCookie('top_msg_banner2', 'set_cookie', 1)
//     });
//     if (getCookie('top_msg_banner2') == 'set_cookie') {
//         $("#top-message").hide()
//     } else {
//         $("#top-message").show();
//     }
// });

// function setCookie(cookieName, value, exdays) {
//     var exdate = new Date();
//     exdate.setDate(exdate.getDate() + exdays);
//     var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
//     document.cookie = cookieName + "=" + cookieValue + "; path=/;"
// }

// function getCookie(cookieName) {
//     cookieName = cookieName + '=';
//     var cookieData = document.cookie;
//     var start = cookieData.indexOf(cookieName);
//     var cookieValue = '';
//     if (start != -1) {
//         start += cookieName.length;
//         var end = cookieData.indexOf(';', start);
//         if (end == -1) end = cookieData.length;
//         cookieValue = cookieData.substring(start, end);
//     }
//     return unescape(cookieValue);
// }


$('.cc_kakao .tit').on('click',function(e){
    e.preventDefault();
    $.ajax({
        type: "GET",
        url: apiDomain+'/v1/mypage/asks/confirm/kakao',
        dataType: 'json',
        success: function(data) {
            if(data.data.ok_button_action_url.indexOf('https://api.happytalk.io/') > -1){
                if(confirm('['+data.data.title+'] '+data.data.message)) window.open(data.data.ok_button_action_url,'_blank');
            }else{
                alert(data.data.title+'\n'+data.data.message);
            }
        }
    })
});
