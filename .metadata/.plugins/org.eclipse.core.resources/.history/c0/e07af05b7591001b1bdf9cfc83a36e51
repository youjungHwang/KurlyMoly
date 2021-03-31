/**
 * 기능명세
 * pc, mobile 구분
 * 해당 페이지에 주소 노출 폼이 있는 경우 해당 값 추가 (backEnd 전달 용이기 때문에 아이디 또는 네임은 기존 그대로 유지)
 * 나머지 주소에 글자수 체크 적용 필요
 *
 */
var addressAction = (function(global) {
  var addressData = {};

  var _address = {
    setAddress: function(data) {
      var that = this;
      addressData = JSON.parse(data);
      /**
       * 배송유형 선택
       */
      var apiURL = '/addressbook/v1/regions/check-address?t=' + (new Date()).valueOf()
      var postData = {'address': addressData.roadAddress, 'address_detail': addressData.addressSub, 'base_address_type': 'R'};

      kurlyApi.post(apiURL, postData)
        .then(function (res) {
          if (res.status === 200) {
            var objDeliveryPolicy = {
              'direct': 0,
              'indirect': 1,
              'disable': '',
            };

            var deliveryType = res.data.data.delivery_type;

            if (deliveryType === null) {
              alert('일시적인 오류로 배송지 정보를 불러오지 못했습니다. 다시 시도해주세요.');
              return false;
            } else {
              addressData.deliPoli = objDeliveryPolicy[deliveryType];
              that.layerAction();
              that.sendFormDataAdd();
              that.insertViewData();
            }
          } else {
            console.error('API 응답 이상', res);
          }
        })
        .catch(function (err) {
            return window.apiErrorHandler(err)
        });
    },

    /**
     * form 전송 input에 값 추가
     */
    sendFormDataAdd: function(){
      if($('#deliPoli').length === 0){
        return;
      }
      $('#zipcode0').val(addressData.zipCode0);
      $('#zipcode1').val(addressData.zipCode1);
      $('#zonecode').val(addressData.zoneCode);
      $('#address').val(addressData.address || addressData.roadAddress);
      $('#address_sub').val(addressData.addressSub);
      $('#road_address').val(addressData.roadAddress);
      $('#deliPoli').val(addressData.deliPoli);
      $('#baseAddressType').val(addressData.sType === 'road' ? 'R' : 'J');
    },


    /**
     * UI 용 노출형 텍스트
     */
    insertViewData: function(){
      if($('#selectAddress').length === 0){
        return;
      }

      var $selector = {
        eventTarget: $('#addressSearch'),
        delivery: $('#delivery'),
        selectAddr: $('#selectAddress'),
        selectSub: $('#selectAddressSub'),
        addr: $('#addr'),
        addrNo: $('#addressNo'),
        addrSub: $('#address_sub')
      }

      var that = this, deliveryText = '샛별배송';
      var addrText = addressData.sType ===  'zipcode' ? addressData.address : addressData.roadAddress

      $selector.selectAddr.show();
      $selector.selectSub.show();

      // 문구
      $selector.delivery.removeAttr('class');
      if(addressData.deliPoli === 0) {
        $selector.delivery.addClass('type1');
      }
      if(addressData.deliPoli === 1){
        deliveryText = '택배배송';
        $selector.delivery.addClass('type2');
      }
      if(addressData.deliPoli === ''){
        deliveryText = '배송불가';
        $selector.delivery.addClass('type3');
      }

      if(addressData.device === 'm'){
        // mobile
        $selector.addrNo.hide();
        $selector.addr.text(addrText);
      }else{
        // pc
        $selector.eventTarget.addClass('re_search');
        $selector.addrNo.text($selector.addrNo.data('text'));
        $selector.addr.val(addrText);
      }
      $selector.delivery.text(deliveryText);
      $selector.addrSub.text( addressData.addressSub );

      that.countAction();
    },


    /**
     * PD-818 : 나머지 주소 텍스트 입력시 카운트 되도록 설정
     */
    countAction: function(){
      var maxByteLimit = 99; // 글자수제한
      var staticLengthAddr = null; // length
      var $addressSub = null; // 세부주소
      var $addressSubValue = null; // 세부주소값
      var $addressValue = null; // 주소값
      var $fieldAddressSub = null;

      var subAddress = {
        default : function(){
          var that = this;
          $addressSub = $('[name=address_sub]');

          if(addressData.sType ===  'zipcode'){
            $addressValue = addressData.address;
          }else{
            $addressValue = addressData.roadAddress;
          }

          $addressSubValue = $addressSub.val();

          staticLengthAddr = $addressValue.length;
          that.addressSubSplit();

          $addressSub.on('change keyup paste cut focus', function(e){
            e.preventDefault();
            $addressSubValue = $(this).val();
          });
        },
        addressSubSplit : function(){ // 최대입력가능한 글자수 초과시 뒷글자 제거
          var maxAddress = maxByteLimit - staticLengthAddr - 1; // 1은 주소와 세부 주소 사이의 공백

          $addressSub.attr('maxlength', maxAddress);
          $addressSub.val($addressSubValue.substring(0, maxAddress));

          $addressSubValue = $addressSub.val();
          if( $fieldAddressSub !== null){
            $fieldAddressSub.text($addressSub.val());
          }
        },
      }

      subAddress.default();
    },


    /**
     * 결과 레이어 노출 => 확인후 삭제 예정
     */
    layerAction: function(){
      var $layerDSR = $("#layerDSR");
      var $dsrThumb = $layerDSR.find('.ani img');
      var layerType = '.layer_star'; // 샛별배송

      $layerDSR.show();
      $layerDSR.find('.inner_layer').hide();

      // KM-1955 : 이미지교체
      $dsrThumb.each(function(){
        $(this).attr('src', $(this).data('src'));
      });

      if (addressData.deliPoli === 1) { // 택배배송
        layerType = '.layer_normal';
      }

      if (addressData.deliPoli === '') { // 배송불가
        layerType = '.layer_none';
      }
      $layerDSR.find(layerType).show();
    }
  }
  return _address
})(window);

/**
 * 해당 함수는 주소검색 PHP 파일에서 params값을 전달해주어 사용됨.
 * 회원가입에서 사용
 * @param data Object
 */
var setDeliveryAddress = function (data, type) {
  var addressData = {
    zipCode0: data.zipcode0,
    zipCode1: data.zipcode1,
    zoneCode: data.zonecode,
    address: data.address,
    addressSub: data.address_sub,
    roadAddress: data.road_address,
    sType: data.s_type, //주소검색 타입 => zipcode : 기존 우편번호 검색, road : 도로명주소 검색
    device: data.gubun === 'mobile' ? 'm' : 'pc'
  }

  // iframe 타입(mobile) , popup 타입(pc) 구분필요. (appResult 없음)
  // 배송방법 자동선택
  if(type === 'current'){
    addressAction.setAddress(JSON.stringify(addressData));
    return false;
  }
  if (addressData.device == 'm') {
    parent.addressAction.setAddress(JSON.stringify(addressData));
    if (typeof parent.addressPopup !== 'undefined'){
      parent.addressPopup.close();
    } else {
      window.parent.close();
    }
  } else {
    // PC - 회원가입
    opener.parent.addressAction.setAddress(JSON.stringify(addressData));
    // windows에서 본인창 닫을 경우 정상적으로 로직이 돌아가지 않음
    window.parent.close();
  }
}


// KQA-2037 [App][mWeb][PC] 비회원때 장바구니에서 추가한 주소지, 회원가입 페이지에 미입력되어 노출되는 현상
var adddressCheck = (function(global) {

  var _addressCheck = {
    get: function () {
      if(typeof global.webStatus === 'undefined'){
        return false;
      }
      var deviceCheck = global.webStatus.device

      kurlyApi({
        method: 'get',
        url: '/cart/v1/cart'
      }).then(function (response) {
        if (response.data.data.address === '' || response.status !== 200) {
          return false;
        }

        var getData = response.data.data;
        var dataTemp = {
          zipcode0: '',
          zipcode1: '',
          zonecode: getData.road_zonecode,
          address: getData.address,
          address_sub: getData.address_sub,
          road_address: getData.road_address,
          s_type: getData.base_address_type === 'R' ? 'road' : 'zipcode', //주소검색 타입 => zipcode : 기존 우편번호 검색, road : 도로명주소 검색
          gubun: deviceCheck
        }
        setDeliveryAddress(dataTemp, 'current');
      }).catch(function (e) {
        console.log(e)
      });
    }
  }
  return _addressCheck
})(window);

adddressCheck.get();
