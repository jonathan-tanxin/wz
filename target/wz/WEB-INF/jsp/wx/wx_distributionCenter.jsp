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
    <p class="w  tc lh42">${customer.nickName }</p>
    </div>
    <div class="fx fxJc-sa bbt">
    	<ul class="lh36 tc fxFl1 brt p15"><li>联系人</li><li><a class="tc-gules">${address.name }</a></li></ul>
    	<ul class="lh36 fxFl1 tc p15"><li>联系电话</li><li><a class="tc-gules">${address.mobile }</a></li></ul>
    </div>
    <section class="p30 fx bbt fxAi-c"><span class="w100">配送点：</span><span class="fonGray">${address.distributionCenter.name }</span></section>
    <section class="p30 fx  fxAi-c"><span class="w100">地址：</span><span class="fonGray">${address.distributionCenter.address }</span></section>
	</div>
<div class="fx mb20 bacWhite  fxFd-c f24 fonGray">
<section class="p30 fx  fxAi-c"><span class="fxFl1">补货申请</span><i class="fa fa-angle-right fa-2x"></i></section>
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

<%@include file="wx_foot.jsp"%>


</body>
</html>