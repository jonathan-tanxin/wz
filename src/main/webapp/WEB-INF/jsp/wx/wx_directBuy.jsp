<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="enum" uri="http://www.daxia.com/enum" %> 

<%@include file="wx_head.jsp" %>

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<main id="mian" class=" pb100">
	<div class="fx mb20 bacWhite f24 p30 fxAi-c">
    <ul class="fxFl1 lh36">
    	<li class="fx fxJc-sb lh48 bbt p5 mb20"><span>商品名称</span><span>${dish.name }</span></li>
    	<li class="fx fxJc-sb lh48 bbt p5 mb20"><span>数量</span><span>${num }</span></li>
    	<li class="fx fxJc-sb lh48 bbt p5 mb20"><span>支付金额</span><span>
    	<fmt:formatNumber value="${dish.price * num }" type="currency" pattern="0.00"/>
    	元</span></li>
    </ul>
	</div>
<div class="fx fxAi-c fxJc-c mb20">
<button class="p30 f32 w800 bt-no bacls" onclick="pay()">立即支付</button>
</div>



</main>


<div class="hw-overlay" id="hw-layer">
<div class="hw-layer-wrap">
<span class="fa fa-remove hwLayer-close"></span>
<div class="hw-overlayMain">
	   <div class="mb30">
	   <div class="f20 mb5 f24">提示</div>
	   <ul>
	    <li class="fx fxJc-sb f18">内容</li>

	   </ul>
	   </div>
	  
	   <div class="fx pt30 pb30">
	   <button id="tjddan" class="mar-au">去填写</button>
	   <button id="tjddan" class="mar-au">取消</button>
	   </div>
</div>
</div>
</div>

<%@include file="wx_foot.jsp" %>
<script>
function pay() {
	//location='${ctx}/wx/paySuccess';
	 wx.chooseWXPay({
	    timestamp: ${timestamp}, // 支付签名时间戳，注意微信jssdk中的所有使用timestamp字段均为小写。但最新版的支付后台生成签名使用的timeStamp字段名需大写其中的S字符
	    nonceStr: '${nonce_str_pay}', // 支付签名随机串，不长于 32 位
	    package: 'prepay_id=${prepayId}', // 统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=***）
	    signType: 'MD5', // 签名方式，默认为'SHA1'，使用新版支付需传入'MD5'
	    paySign: '${sign}', // 支付签名
	    success: function (res) {
	        // 支付成功后的回调函数
	        location="${ctx}/wx/directBuyPaySuccess?prepayId=${prepayId}";
	    }
	}); 
	
}	
</script>
<script>
 wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '${appId}', // 必填，公众号的唯一标识
    timestamp: ${timestamp} , // 必填，生成签名的时间戳
    nonceStr: '${nonceStr}', // 必填，生成签名的随机串
    signature: '${signature}',// 必填，签名，见附录1
    jsApiList: ['chooseWXPay'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
 
</script>

</body>
</html>