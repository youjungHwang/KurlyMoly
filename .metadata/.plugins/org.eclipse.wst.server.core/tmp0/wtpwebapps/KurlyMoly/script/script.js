'use strict';

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
