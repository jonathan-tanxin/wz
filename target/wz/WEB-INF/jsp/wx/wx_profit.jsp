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
	<div class="fx mb20 bacWhite h100 p10 fxAi-c">
		<i class="w90 h80 mr10" style="background:url(${customer.headImage}) no-repeat; background-size:cover;"></i>
		<ul class="fxFl1">
            <li class="f24 fx fxJc-sb"><span >${customer.nickName }</span><span>邀请码：<em>${customer.inviteCode }</em></span></li>
		</ul>
	</div>
	<c:forEach items="${profits }" var="p">
	<div class=" mb20 bacWhite ">
    <div class="fx h100 p10 fxAi-c">
		<i class="w90 h80 mr10" style="background:url(${p.profitCustomer.headImage}) no-repeat; background-size:cover;"></i>
		<ul class="fxFl1">
            <li class="f24 fx fxJc-sb"><span >${p.profitCustomer.nickName }</span><span>会员等级：<em>3000</em></span></li>
		</ul>
	</div>
	<div class="fx p-not p15 fxAi-c bbt">
		<i class="w90  mr10"></i>
		<ul class="fxFl1 ">
            <li class="f24 fx fxJc-sb lh36"><span>返利总额：<em>${p.totalProfit }元</em></span><span>月返利金额：<em>${p.profitPerMonth }元</em></span></li>
            <li class="f24 fx fxJc-sb lh36"><span>总期数：<em>${p.totalPhases }期</em></span><span>未返利期数：<em>${p.notProfitPhases }期</em></span></li>
		</ul>
	</div>
	</div>
	</c:forEach>

</main>



<div class="hw-overlay" id="hw-layer">
<div class="hw-layer-wrap">
<span class="fa fa-remove hwLayer-close"></span>
<div class="hw-overlayMain">
	   <div class="mb30">
	   <div class="f20 mb5 f24">邀新活动说明</div>
	   <ul>
	    <li class="fx fxJc-sb f18">邀新活动说明，邀新活动说明，邀新活动说明</li>

	   </ul>
	   </div>
	  
	   <div class="fx pt30 pb30">
	   <button id="tjddan" class="mar-au bbt bacWhite hwLayer-ok">我知道了</button>
	   </div>
</div>
</div>
</div>

<button id="xhlbet" class="pfix h80 f18 fx fxAi-c w fxJc-c f28 show-layer"  data-show-layer="hw-layer" >邀新活动说明</button>

<%@include file="wx_foot.jsp" %>

</body>
</html>