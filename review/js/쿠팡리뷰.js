<!-- 상품평 리스트 이미지 상세보기 -->
<script class="js_reviewVideoTemplate" type="text">
  <video id="{{id}}" class="{{class}}" preload="{{preload}}" data-setup="{{data}}" controls="{{controls}}" autoplay="{{autoplay}}"></video>
</script>

<script class="js_reviewCssTemplate" type="text">
  <link rel="stylesheet" href="{{href}}" type="text/css" />
</script>

<script class="js_reviewSingleImageTemplate" type="text">
  <img class="{{class}}" src="{{src}}" />
</script>

<script class="js_reviewArticleGalleryImageTemplate" type="text">
  <img class="sdp-review__article__gallery__section__table__content__image js_reviewArticleCrop js_reviewArticleGalleryImg {{class}}" src="{{src}}">
</script>

<script class="js_reviewArticleGalleryImageThumbnailTemplate" type="text">
  <div class="sdp-review__article__gallery__section__thumbnail__list {{class}} js_reviewArticleGalleryThumbnailImage" data-index="{{index}}" data-has-caption="{{hasCaption}}">
      <img class="sdp-review__article__gallery__section__thumbnail__list__image" src="{{src}}"/>
      <span class="sdp-review__caption_tip"></span>
  </div>
</script>

<!-- 상품평 등록시 파일 첨부 이미지-->
<script class="js_reviewRegisterImageTemplate" type="text">
  <button class="sdp-review__register__file-delete-btn js_reviewRegisterImageDeleteBtn" type="button"></button>
  <img class="sdp-review__register__file-img js_reviewRegisterImage" src="{{src}}" data-uploadedFilePath="{{uploadedFilePath}}">
</script>

<!-- 상품평 수정시 파일 첨부 이미지 -->
<script class="js_reviewModifyImageTemplate" type="text">
  <button class="sdp-review__modify__file-delete-btn js_reviewModifyImageDeleteBtn" type="button"></button>
  <img class="sdp-review__modify__file-img js_reviewModifyImage" src="{{src}}" data-uploadedFilePath="{{uploadedFilePath}}">
</script>

<!-- 파일 업로드 iframe -->
<script class="js_reviewRegisterIframeTemplate" type="text">
  <iframe
          class="sdp-review__register__frame-tag js_reviewRegisterIframeTag"
          src="{{url}}"
          data-token="{{token}}"
          data-serviceInfo="{{serviceInfo}}"
  ></iframe></iframe>
</script>

<script src="//asset2.coupangcdn.com/customjs/jserror/1.2.2/jslog-combined.min.js" type="text/javascript"></script>

<script type="text/javascript">
		new JsLog('pc_web_sdp', '', {
			memberSrl: '125314641',
			pcid: '28834769110790944539957'
		}).enableTrap();
	</script>

    <script>

    window.logRequireTime = function(){};

    try {
        if (window.performance && window.performance.now) {
            window.redwoodTimeLog = {
                requirejs: {
                    start: window.performance.now()
                }
            };
            window.logRequireTime = function () {
                window.redwoodTimeLog.requirejs.end = window.performance.now();
                window.redwoodTimeLog.requirejs.time = window.redwoodTimeLog.requirejs.end - window.redwoodTimeLog.requirejs.start;
            }
        }
    } catch(e) {}



</script>

<script src="/resources/20210304120458/np/js/lib/requirejs/require-2.1.14.min.js" type="text/javascript" onload="logRequireTime()"></script>

<script type="text/javascript">
    
        define('templates/contents/side/include/recentlyViewedProduct.hbs', ['handlebars'], function(Handlebars) {
  var template = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, helper;
  buffer += "\n		<div class=\"recently-viewed-prod-navi\">\n            <span class=\"counter\" data-pagenumber=\"";
  if (helper = helpers.pageNumber) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.pageNumber); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\" data-totalpagenumber=\"";
  if (helper = helpers.totalPageCount) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.totalPageCount); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\">\n                <strong class=\"page-num\">";
  if (helper = helpers.pageNumber) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.pageNumber); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</strong>\n                <span>/";
  if (helper = helpers.totalPageCount) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.totalPageCount); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</span>\n            </span>\n            <span class=\"paging-btn\">\n                <a href=\"javascript:;\" class=\"btn prev\" title=\"이전 페이지 보기\">prev</a>\n                <a href=\"javascript:;\" class=\"btn next\" title=\"다음 페이지 보기\">next</a>\n            </span>\n		</div>\n    ";
  return buffer;
  }

function program3(depth0,data) {
  
  
  return "\n    ";
  }

  buffer += "<h2>\n    <strong>최근본상품</strong>\n    ";
  stack1 = helpers['if'].call(depth0, (depth0 && depth0.recentlyViewedProducts), {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</h2>\n";
  return buffer;
  });
  var templates = Handlebars.templates = Handlebars.templates || {};
  templates['templates/contents/side/include/recentlyViewedProduct.hbs'] = template;
  var partials = Handlebars.partials = Handlebars.partials || {};
  partials['templates/contents/side/include/recentlyViewedProduct.hbs'] = template;
  return template;
});
define('templates/contents/side/include/recentlyViewedProductList.hbs', ['handlebars'], function(Handlebars) {
  var template = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n    ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.recentlyViewedProducts), {hash:{},inverse:self.noop,fn:self.programWithDepth(2, program2, data, depth0),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n";
  return buffer;
  }
function program2(depth0,data,depth1) {
  
  var buffer = "", stack1, helper;
  buffer += "\n        <li class=\"viewed-product\">\n            <a href=\""
    + escapeExpression(((stack1 = (depth1 && depth1.coupangWebDomain)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1));
  if (helper = helpers.link) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.link); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\" title=\"";
  stack1 = helpers['with'].call(depth0, (depth0 && depth0.imageAndTitleArea), {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\">\n                <span class=\"img-container\">\n                    <img src=\"";
  stack1 = helpers['with'].call(depth0, (depth0 && depth0.imageAndTitleArea), {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\"  alt=\"";
  stack1 = helpers['with'].call(depth0, (depth0 && depth0.imageAndTitleArea), {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\" />\n                </span>\n                <span class=\"product-title\">";
  stack1 = helpers['with'].call(depth0, (depth0 && depth0.imageAndTitleArea), {hash:{},inverse:self.noop,fn:self.program(3, program3, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "</span>\n                <span class=\"border\">border</span>\n            </a>\n            <a href=\"javascript:;\" class=\"delete\" title=\"삭제\" data-productid=\"";
  if (helper = helpers.legacyProductId) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.legacyProductId); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\">삭제</a>\n        </li>\n    ";
  return buffer;
  }
function program3(depth0,data) {
  
  var stack1;
  return escapeExpression(((stack1 = (depth0 && depth0.title)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1));
  }

function program5(depth0,data) {
  
  var stack1;
  return escapeExpression(((stack1 = (depth0 && depth0.defaultUrl)),typeof stack1 === functionType ? stack1.apply(depth0) : stack1));
  }

function program7(depth0,data) {
  
  
  return "\n    <table class=\"no-products\">\n        <tbody>\n            <tr>\n                <td>\n                    최근 본 상품이<br/>없습니다.\n                </td>\n            </tr>\n        </tbody>\n    </table>\n";
  }

  stack1 = helpers['if'].call(depth0, (depth0 && depth0.recentlyViewedProducts), {hash:{},inverse:self.program(7, program7, data),fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n";
  return buffer;
  });
  var templates = Handlebars.templates = Handlebars.templates || {};
  templates['templates/contents/side/include/recentlyViewedProductList.hbs'] = template;
  var partials = Handlebars.partials = Handlebars.partials || {};
  partials['templates/contents/side/include/recentlyViewedProductList.hbs'] = template;
  return template;
});

define('templates/contents/side/include/recentlyViewedProductMain.hbs', ['handlebars'], function(Handlebars) {
  var template = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
  this.compilerInfo = [4,'>= 1.0.0'];
helpers = this.merge(helpers, Handlebars.helpers); data = data || {};
  var buffer = "", stack1, helper, functionType="function", escapeExpression=this.escapeExpression, self=this;

function program1(depth0,data) {
  
  var buffer = "", stack1, helper;
  buffer += "\n        <em>";
  if (helper = helpers.totalCount) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.totalCount); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</em>\n        ";
  return buffer;
  }

function program3(depth0,data) {
  
  
  return "\n        <em>0</em>\n    ";
  }

function program5(depth0,data) {
  
  
  return "\n            <li class=\"no-item\">최근본 상품이<br />없습니다.</li>\n        ";
  }

function program7(depth0,data) {
  
  var buffer = "", stack1;
  buffer += "\n        ";
  stack1 = helpers.each.call(depth0, (depth0 && depth0.pageNumbers), {hash:{},inverse:self.noop,fn:self.program(8, program8, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    ";
  return buffer;
  }
function program8(depth0,data) {
  
  var buffer = "";
  buffer += "\n            <ul id=\"recentlyViewedProduct"
    + escapeExpression((typeof depth0 === functionType ? depth0.apply(depth0) : depth0))
    + "\" data-pagenumber=\""
    + escapeExpression((typeof depth0 === functionType ? depth0.apply(depth0) : depth0))
    + "\" style=\"display:none;\"></ul>\n        ";
  return buffer;
  }

function program10(depth0,data) {
  
  var buffer = "", stack1, helper;
  buffer += "\n            <span class=\"counter\" id=\"recentlyViewedProductPageInfo\" data-pagenumber=\"";
  if (helper = helpers.pageNumber) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.pageNumber); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\"\n                  data-totalpagenumber=\"";
  if (helper = helpers.totalPageCount) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.totalPageCount); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\">\n                <strong id=\"pageNumber\">";
  if (helper = helpers.pageNumber) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.pageNumber); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</strong>/<em>";
  if (helper = helpers.totalPageCount) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.totalPageCount); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "</em></span>\n            <span id=\"recentlyViewedProductBtnArea\">\n                <a href=\"javascript:;\" class=\"move prev\" title=\"이전 페이지 보기\" data-gaclick='{\"hitType\":\"event\", \"eventCategory\":\"Floatingbanner\", \"eventAction\":\"click\", \"eventLabel\":\"floatingbanner_recentlyviewed_left}}\", \"eventValue\":0}'>prev</a>\n                <a href=\"javascript:;\" class=\"move next\" title=\"다음 페이지 보기\" data-gaclick='{\"hitType\":\"event\", \"eventCategory\":\"Floatingbanner\", \"eventAction\":\"click\", \"eventLabel\":\"floatingbanner_recentlyviewed_right}}\", \"eventValue\":0}'>next</a>\n            </span>\n        ";
  return buffer;
  }

  buffer += "<dt>\n    <strong>최근본상품</strong>\n    ";
  stack1 = helpers['if'].call(depth0, (depth0 && depth0.totalCount), {hash:{},inverse:self.program(3, program3, data),fn:self.program(1, program1, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n</dt>\n<dd id=\"recentlyViewedProductList\">\n    <ul id=\"recentlyViewedProduct1\" data-pagenumber=\"";
  if (helper = helpers.pageNumber) { stack1 = helper.call(depth0, {hash:{},data:data}); }
  else { helper = (depth0 && depth0.pageNumber); stack1 = typeof helper === functionType ? helper.call(depth0, {hash:{},data:data}) : helper; }
  buffer += escapeExpression(stack1)
    + "\">\n        ";
  stack1 = helpers['if'].call(depth0, (depth0 && depth0.displayNoneNotice), {hash:{},inverse:self.noop,fn:self.program(5, program5, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </ul>\n    ";
  stack1 = helpers['if'].call(depth0, (depth0 && depth0.displayTotalPageCount), {hash:{},inverse:self.noop,fn:self.program(7, program7, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    <p class=\"paging\">\n        ";
  stack1 = helpers['if'].call(depth0, (depth0 && depth0.displayTotalPageCount), {hash:{},inverse:self.noop,fn:self.program(10, program10, data),data:data});
  if(stack1 || stack1 === 0) { buffer += stack1; }
  buffer += "\n    </p>\n</dd>";
  return buffer;
  });
  var templates = Handlebars.templates = Handlebars.templates || {};
  templates['templates/contents/side/include/recentlyViewedProductMain.hbs'] = template;
  var partials = Handlebars.partials = Handlebars.partials || {};
  partials['templates/contents/side/include/recentlyViewedProductMain.hbs'] = template;
  return template;
});
    
    var coupangWebRequire = require.config({
        baseUrl: '/resources/20210304120458/np/js/modules',
        context : 'coupangWeb',
	    waitSeconds: 7000,
        paths: {
            jquery: '//asset2.coupangcdn.com/cdnjs/jquery/1.11.1/jquery.min',
            hashchange: '../lib/jquery/jquery.ba-hashchange-1.3-browser-patch',
            handlebars: '//asset2.coupangcdn.com/cdnjs/handlebars.js/1.3.0/handlebars.min',
            text: '//asset2.coupangcdn.com/cdnjs/require-text/2.0.12/text.min',
            moment: '//asset2.coupangcdn.com/cdnjs/moment.js/2.10.2/moment.min',
            momentLocale: '//asset2.coupangcdn.com/cdnjs/moment.js/2.10.2/locales.min',
            lodash: '//asset2.coupangcdn.com/cdnjs/lodash.js/3.10.1/lodash.min',
            template: '/resources/20210304120458/np/html/template',
			facebook: '//connect.facebook.net/ko_KR/sdk',
            couLog: '//asset2.coupangcdn.com/customjs/cou-log/2.0.0/cou-log.min',
            speedChecker: '//asset2.coupangcdn.com/customjs/speed-checker/0.7.3/speed-checker.min',
            ezPlus: '//asset2.coupangcdn.com/customjs/jquery-elevatezoom-plus/1.1.11/jquery.ez-plus.min',
            fodiumWidgetLoader: '//asset2.coupangcdn.com/customjs/fodium-widget-loader/1.0.1/fodiumWidgetLoader.min',
            videojs: '//asset2.coupangcdn.com/cdnjs/video.js/5.16.0/video.min',
            videohls: '//asset2.coupangcdn.com/cdnjs/videojs-contrib-hls/5.1.1/videojs-contrib-hls',
            weblog: '//asset2.coupangcdn.com/customjs/coupang-web-log/1.3.0/web-log.umd.min',
            incorrectInfoBundle: 'sdp/incorrectInfoReport/webpack/incorrectInfoBundle'
        },
        shim: {
            handlebars: {
                exports: 'Handlebars'
            },
            hashchange: {
            	deps: ['jquery'],
            	exports: 'Hashchange'
        	},
			facebook : {
				exports: 'FB'
			},
			couLog: {
				deps: ['jquery'],
				exports: 'couLog'
			},
            speedChecker: {
                deps: ['jquery','couLog'],
                exports: 'speedChecker'
            }
        }
    });
    
        
    
coupangWebRequire(['jquery','couLog'], function (jquery ) {
    
    coupangWebRequire(['redwood/sdp/atf/container'], function(){
        coupangWebRequire(['../page-controllers/common/controller']);
    });
});

</script>

<noscript><img src="https://www.coupang.com/akam/11/pixel_5f9196e?a=dD1iMDYzYWRmN2IzMGExYjBkNzIxYjcyMDNkZTQzYTcxNGVkYmNmYTQwJmpzPW9mZg==" style="visibility: hidden; position: absolute; left: -999px; top: -999px;" /></noscript>

<script type="text/javascript">var _cf = _cf || []; _cf.push(['_setFsp', true]);  _cf.push(['_setBm', true]);  _cf.push(['_setAu', '/clientlibs/d57eb8aa3no1971eb430c76c49992de']); </script>

<script type="text/javascript" src="/clientlibs/d57eb8aa3no1971eb430c76c49992de"></script>

