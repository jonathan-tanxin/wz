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
	<c:forEach items="${cards }" var="card">
	<div class="fx mb20 bacWhite f24 p30 fxAi-c">
    <ul class="fxFl1 lh36">
    	<li class="fx "><span>${card.name }${card.money }元</span></li>
        <li class="fx fonGray"><span>${card.description}</span></li>
    </ul>
    
    <c:if test="${hasAddress }">
    <button class="w80 h40 p5 bt bacWhite br5 f18 show-layer" onclick="location='${ctx}/wx/pay/memberPay?cardId=${card.id }'">开通</button>
    </c:if>
    <c:if test="${not hasAddress }">
    <button data-show-layer="hw-layer" class="w80 h40 p5 bt bacWhite br5 f18 show-layer">开通</button>
    </c:if>
	</div>
	</c:forEach>
	
	
</main>


<div class="hw-overlay" id="hw-layer">
<div class="hw-layer-wrap">
<span class="fa fa-remove hwLayer-close"></span>
<div class="hw-overlayMain">
	   <div class="mb30">
	   <div class="f20 mb5 f24">提示</div>
	   <ul>
	    <li class="fx fxJc-sb f18">您尚未填写收货地址，请先完善收货地址，以免无法为您提供上门服务</li>

	   </ul>
	   </div>
	  
	   <div class="fx pt30 pb30">
	   <button id="tjddan" class="mar-au" onclick="location='${ctx}/wx/addressAdd'">去填写</button>
	   <button id="tjddan" class="mar-au">取消</button>
	   </div>
</div>
</div>
</div>


<%@include file="wx_foot.jsp" %>

</body>
</html>