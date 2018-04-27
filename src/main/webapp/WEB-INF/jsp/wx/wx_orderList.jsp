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

<main id="main" class=" pb100">
	<template v-for="o in orderList">
	<div class=" f24 mb20">
    <ul class="fxFl1 lh48 bbt p15 bacWhite">
    	<li class="fx fxJc-sb" v-if="o.buyDish > 0"><span>购菜</span><span>{{o.buyDish}}斤</span><span>剩余可购买：<em>{{o.dishLeft}}斤</em></span></li>
    	<li class="fx fxJc-sb" v-if="o.buyWater > 0"><span>购水</span><span>{{o.buyWater}}桶</span><span>剩余可购买：<em>{{o.waterLeft}}桶</em></span></li>
        <li class="fx fxJc-sb">
        <span><a class="fb4" @click="o.showDetails = !o.showDetails">查看详细</a> 
        	<i :class="o.showDetails? 'fa fa-angle-double-down' : 'fa fa-angle-double-up'"></i>
        </span>
        <span>
        状态：{{o.status}}
        </span>
        <span>{{o.createTime}}</span>
        </li>  
    </ul>
    <div class="m10 bacG9 f24 p15 m-not" v-show="o.showDetails">
    	<ul class="fxFl1 lh36">
    		<li class="fx fxJc-sb pb5" v-for="i in o.items"><span>{{i.dishName}}</span><span>{{i.num}}{{i.unit}}</span></li>
    	</ul>
    </div>
	</div>
	</template>

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

<script>
	var vm = new Vue({
		el: '#main',
		data: {
			orderList: []
		},
		created: function() {
			get('${ctx}/wx/getOrderList', function(data) {
				vm.orderList = data.data;
			});
		}
		
	});
</script>
</body>
</html>