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

<main id="mian" class=" pb100">
	<div class="fx mb20 bacWhite f24 p30 fxAi-c">
    <i class="fa fa-pencil-square-o fa-2x" onclick="location='${ctx}/wx/addressEdit?id=${address.id }'"></i>
    <ul class="fxFl1 lh36">
    	<li class="fx fxJc-sb"><span>${address.name }</span><span>${address.mobile }</span></li>
        <li class="fx fxJc-sb"><span>收货地址：${address.address }</span></li>
        <li class="fx fxJc-sb"><span>指定的配送中心：${address.distributionCenter.name }</span></li>  
    </ul>
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