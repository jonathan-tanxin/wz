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

<div class="fx mb30 bacWhite  fxFd-c f24 ">
<section class="p30 fx bbt fxAi-c">
<span class="w200 mr50">指标采集时间</span><form class="fonGray">
	<input placeholder="请输入" type="date" id="date" class="f28 p10 lh32 bbt"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w200 mr50">糖化血红蛋白</span><form class="fonGray"><input id="xhdb" placeholder="请输入" type="number" class="f28 p10 lh32 bbt"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w200 mr50">血常规</span><form class="fonGray"><input id="xzg" placeholder="请输入" type="number" class=" f28 p10 lh32 bbt"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w200 mr50">舒张压</span><form class="fonGray"><input id="szy" placeholder="请输入" type="number" class=" f28 p10 lh32 bbt"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w200 mr50">收缩压</span><form class="fonGray"><input id="ssy" placeholder="请输入" type="number" class=" f28 p10 lh32 bbt"></form>
</section>
</div>
<div class="fx fxAi-c fxJc-c">
<button class="p30 f32 w800 bt-no bacls" onclick="save()">专家指导</button>
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

<script>
	function save() {
		post('${ctx}/wx/saveHealth', {
			date: $('#date').val(),
			xhdb: $('#xhdb').val(),
			xzg: $('#xzg').val(),
			szy: $('#szy').val(),
			ssy: $('#ssy').val()
		}, function(data) {
		if (isSuccess(data)) {
			location = '${ctx}/wx/myHealth';
		}
	});
	}
</script>

<%@include file="wx_foot.jsp" %>
</body>
</html>