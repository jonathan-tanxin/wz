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
	<div class="fx mb20 bacWhite f24 p30 fxAi-c fxJc-c">
         <div class="fx fxFd-c fxAi-c">
         <i class="fa fa-check-circle fa-5x foncls"></i>
         <span class="foncls f32 mb50">支付成功</span>
         <span class="mb20">恭喜您成为我们的年卡会员</span>
         <span class="mb20">每天享受健康食材，拥有健康好身材</span>
         </div>
	</div>
<div class="fx fxAi-c fxJc-c mb20">
<button class="p30 f32 w800 bt-no bacls" onclick="location='${ctx}/wx/dishSelect'">会员点菜</button>
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

</body>
</html>