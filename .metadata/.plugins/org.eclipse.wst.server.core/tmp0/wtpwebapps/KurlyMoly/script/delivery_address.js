/**
 * ��ɸ�
 * pc, mobile ����
 * �ش� �������� �ּ� ���� ���� �ִ� ��� �ش� �� �߰� (backEnd ���� ���̱� ������ ���̵� �Ǵ� ������ ���� �״�� ����)
 * ������ �ּҿ� ���ڼ� üũ ���� �ʿ�
 *
 */
var addressAction = (function(global) {
  var addressData = {};

  var _address = {
    setAddress: function(data) {
      var that = this;
      addressData = JSON.parse(data);
      /**
       * ������� ����
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
              alert('�Ͻ����� ������ ����� ������ �ҷ����� ���߽��ϴ�. �ٽ� �õ����ּ���.');
              return false;
            } else {
              addressData.deliPoli = objDeliveryPolicy[deliveryType];
              that.layerAction();
              that.sendFormDataAdd();
              that.insertViewData();
            }
          } else {
            console.error('API ���� �̻�', res);
          }
        })
        .catch(function (err) {
            return window.apiErrorHandler(err)
        });
    },

    /**
     * form ���� input�� �� �߰�
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
     * UI �� ������ �ؽ�Ʈ
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

      var that = this, deliveryText = '�������';
      var addrText = addressData.sType ===  'zipcode' ? addressData.address : addressData.roadAddress

      $selector.selectAddr.show();
      $selector.selectSub.show();

      // ����
      $selector.delivery.removeAttr('class');
      if(addressData.deliPoli === 0) {
        $selector.delivery.addClass('type1');
      }
      if(addressData.deliPoli === 1){
        deliveryText = '�ù���';
        $selector.delivery.addClass('type2');
      }
      if(addressData.deliPoli === ''){
        deliveryText = '��ۺҰ�';
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
     * PD-818 : ������ �ּ� �ؽ�Ʈ �Է½� ī��Ʈ �ǵ��� ����
     */
    countAction: function(){
      var maxByteLimit = 99; // ���ڼ�����
      var staticLengthAddr = null; // length
      var $addressSub = null; // �����ּ�
      var $addressSubValue = null; // �����ּҰ�
      var $addressValue = null; // �ּҰ�
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
        addressSubSplit : function(){ // �ִ��Է°����� ���ڼ� �ʰ��� �ޱ��� ����
          var maxAddress = maxByteLimit - staticLengthAddr - 1; // 1�� �ּҿ� ���� �ּ� ������ ����

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
     * ��� ���̾� ���� => Ȯ���� ���� ����
     */
    layerAction: function(){
      var $layerDSR = $("#layerDSR");
      var $dsrThumb = $layerDSR.find('.ani img');
      var layerType = '.layer_star'; // �������

      $layerDSR.show();
      $layerDSR.find('.inner_layer').hide();

      // KM-1955 : �̹�����ü
      $dsrThumb.each(function(){
        $(this).attr('src', $(this).data('src'));
      });

      if (addressData.deliPoli === 1) { // �ù���
        layerType = '.layer_normal';
      }

      if (addressData.deliPoli === '') { // ��ۺҰ�
        layerType = '.layer_none';
      }
      $layerDSR.find(layerType).show();
    }
  }
  return _address
})(window);

/**
 * �ش� �Լ��� �ּҰ˻� PHP ���Ͽ��� params���� �������־� ����.
 * ȸ�����Կ��� ���
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
    sType: data.s_type, //�ּҰ˻� Ÿ�� => zipcode : ���� �����ȣ �˻�, road : ���θ��ּ� �˻�
    device: data.gubun === 'mobile' ? 'm' : 'pc'
  }

  // iframe Ÿ��(mobile) , popup Ÿ��(pc) �����ʿ�. (appResult ����)
  // ��۹�� �ڵ�����
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
    // PC - ȸ������
    opener.parent.addressAction.setAddress(JSON.stringify(addressData));
    // windows���� ����â ���� ��� ���������� ������ ���ư��� ����
    window.parent.close();
  }
}


// KQA-2037 [App][mWeb][PC] ��ȸ���� ��ٱ��Ͽ��� �߰��� �ּ���, ȸ������ �������� ���ԷµǾ� ����Ǵ� ����
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
          s_type: getData.base_address_type === 'R' ? 'road' : 'zipcode', //�ּҰ˻� Ÿ�� => zipcode : ���� �����ȣ �˻�, road : ���θ��ּ� �˻�
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
