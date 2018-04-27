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


<main id="mian" class="p15 pb100">
	<div class="fx mb20 bacWhite  fxFd-c">
    <div class="fx fxJc-c fxAi-c fxFw-w bbt f24 p30">
    <i class="w100 h100" style="background:url(${customer.headImage}) no-repeat; background-size:cover;"></i>
    <p class="w  tc lh42 f32">${customer.nickName }</p>
    </div>
    <div class="fx fxJc-sa f24">
    	<ul class="lh36 tc fxFl1 brt p15"><li>菜品剩余可购</li>
    		<c:if test="${hasDishCard }">
    		<em class="f32 tc-gules mr20">${customer.dishLeft }</em>斤
    		</c:if>
    		<c:if test="${not hasDishCard }">
    		<a class="tc-gules" href="${ctx }/wx/memberType?cardType=1">开通会员享好菜</a>
    		</c:if>
    	</ul>
    	<ul class="lh36 fxFl1 tc p15"><li>桶装水剩余可购</li>
    	<li>
    		<c:if test="${hasWaterCard }">
    		<em class="f32 tc-gules mr20">${customer.waterLeft }</em>桶
    		</c:if>
    		<c:if test="${not hasWaterCard }">
    		<a class="tc-gules" href="${ctx }/wx/memberType?cardType=2">开通会员享好水</a>
    		</c:if>
    	</li>
    	
    	</ul>
    </div>
	</div>
<div class="fx mb20 bacWhite  fxFd-c f28 fonGray">
<section class="p30 fx bbt fxAi-c" onclick="location='${ctx }/wx/addressList'"><span class="fxFl1">管理收货地址</span><i class="fa fa-angle-right fa-2x"></i></section>
<section class="p30 fx bbt fxAi-c" onclick="location='${ctx }/wx/profit'"><span class="fxFl1">邀请返利</span><i class="fa fa-angle-right fa-2x"></i></section>
<section class="p30 fx bbt fxAi-c" onclick="location='${ctx }/wx/orderList'"><span class="fxFl1">购买记录</span><i class="fa fa-angle-right fa-2x"></i></section>
<section class="p30 fx bbt fxAi-c"><span class="fxFl1">我的健康指导</span><span class="f24 mr5">获的专家1V1的指导</span><i class="fa fa-angle-right fa-2x"></i></section>
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
	   <button id="tjddan" class="mar-au">确认</button>
	   <button id="tjddan" class="mar-au">取消</button>
	   </div>
</div>
</div>
</div>

<%@include file="wx_foot.jsp" %>

</body>
</html>