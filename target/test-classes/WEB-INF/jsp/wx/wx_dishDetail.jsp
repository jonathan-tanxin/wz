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

<main id="mian" class="pb100" style="padding-bottom: 2rem;">
	<div class="fx mb20 bacWhite p10 fxFw-w">
	   <div class="photonews h80 w" style="background:url(${image}) no-repeat center; background-size:cover; "></div>
	   <div class="fx w bbt mb10 pt5 pb5 fxJc-sb  fxFd-c">
	   <section><span class="f20 lh52">${n.name }</span></section>
	   <section class="f14">￥<em class="tc-gules f32">${n.price }</em>/斤</section>
	   </div>
	   <div class="fx w bbt mb10 pt5 pb5 fxJc-sb fonGray ">
	   <section class="f18 lh52">运费：免运费</section>
	   <section class="f18 lh52">剩余：${n.stock }斤</section>
	   <section class="f18 lh52">销量：${n.totalSold }斤</section>
	   </div>
	</div>
	   <div class="fx mb20 bacWhite  fxFd-c f28 fonGray">
		<section class="p30 fx bbt fxAi-c" onclick="showImages()"><span class="fxFl1">商品详情</span><span class="f24 mr5">建议在WIFI情况下查看</span></section>
		</div>
	   <ul id="images" class="f18 w" style="display:none">
	   	<c:forEach items="${images }" var="i">
	   	<li class="fx pt10 pb10">
	   	<img src="${i}" style="width: 100%">
	   	</li>
	   	</c:forEach>
	   </ul>
</main>


<div class="pfix w" style="bottom:0; height: 0.8rem;">
	<c:if test="${n.price == null || n.price <= 0 }">
	<button id="direct-buy" class=" h80 f18 fx fxAi-c w fxJc-c f28 show-layer" style="background: #f4053e;color: #ffffff; width:50%;float:right;"  onclick="alert('该菜品只对会员开放')">直接购买</button>
	</c:if>
	<c:if test="${n.price > 0 }">
	<button id="direct-buy" class=" h80 f18 fx fxAi-c w fxJc-c f28 show-layer" style="background: #f4053e;color: #ffffff;width:50%;float:right;"  data-show-layer="hw-layer" >直接购买</button>
	</c:if>
	<button id="member-buy" class=" h80 f18 fx fxAi-c w fxJc-c f28 show-layer" style="background: #555555;color: #ffffff;width:50%;float:left;" onclick="location='${ctx}/wx/dishSelect'">会员点菜</button>
</div>
<!-- <button id="xhlbet" class="pfix h80 f18 fx fxAi-c w fxJc-c f28 show-layer"  data-show-layer="hw-layer" >会员点菜</button> -->

<div class="hw-overlay" id="hw-layer">
<div class="cpxqzf pfix w h300 bacWhite ">
<div class="hw-overlayMain" id="cart">

	   <div class="f20 mb5 f24 p10 mb30">
	   	<li class="fx p5 bbt">
	   	<section><div class="photonews h80 " style="background:url('${n.listImage}') no-repeat center; width:1.5rem; margin-top: -.8rem; background-size:cover; "></div></section>
	   	<section class="tl mb20 ml10">
	   	<p>${n.name }</p>
	   	<p>￥<em class="tc-gules f32">
	   	<fmt:formatNumber value="${n.price }" type="currency" pattern="0.00"/>
	   	</em>/${n.unit }</p>
	   	</section>
	   	</li>
	   	<li class="fx fxJc-sb p10 bbt fxAi-c">
	   <section class="fx fxFd-c"><span>购买数量：</span><span></span></section>
	   	<section>
	   		<i class="fa fa-plus-square-o mr10" @click="num++"></i>
	   		<input class="w40 h40 tc f24 mr10" type="text" v-model="num">
	   		<i class="fa fa-minus-square-o" @click="if (num > 1) num--"></i>
	   	</section>
	   	</li>
	   </div>
	  
	   <div class="fx pt30">
	   <span class="fxFl1 fx fxAi-c fxJc-r pr20 f24">合计：￥<em class="">{{totalPrice}}</em></span>
	   <button  class="f4053e w200 h80 bt-no f28" @click='buy'>去付款</button>
	   </div>
</div>
</div>
</div>


<%@include file="wx_foot.jsp" %>

<script>
function showImages(){
	$('#images').toggle();
}
</script>

<script>
	var vm = new Vue({
		el: '#cart',
		data: {
			listImage: '${n.listImage}',
			price: ${n.price == null ? 0 : n.price},
			unit: '${n.unit}',
			name: '${n.name}',
			num: 1
		},
		methods: {
			buy: function() {
				if (this.num < 1) {
					alert('请选择正确的数量');
					return;
				}
				location = "${ctx }/wx/pay/directBuy?id=${n.id}&num=" + this.num;
			}
		},
		computed: {
			totalPrice: function() {
				return this.price * this.num;
			}
		}
	});
</script>
</body>
</html>