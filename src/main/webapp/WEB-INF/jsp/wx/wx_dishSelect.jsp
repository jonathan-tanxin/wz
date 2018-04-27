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

<style>
	.fa-plus-square-o:before {
	    content: "\f196";
	    font-size: 20px;
	}
	.fa-minus-square-o:before {
	    content: "\f147";
	    font-size: 20px;
	}
</style>


<div id="vm">
<main class="p15 pb100" >
	<div class="fx mb20 bacWhite h100 p10">
		<i class="w90 mr10" style="background:url(${customer.headImage}) no-repeat; background-size:cover;"></i>
		<ul class="fxFl1">
			<li class="f32">${customer.nickName }</li>
            <li class="f24 fx fxJc-sb">
            <span >菜品剩余可购：${customer.dishLeft }斤</span>
            </li>
            <li class="f24 fx fxJc-sb">
            
            <span>山泉水剩余可购：${customer.waterLeft }件</span></li>
		</ul>
	</div>
	<!-- <div style="margin-bottom:5px;">
		<span style="color:red;">备注：蔬菜5斤起送</span>
	</div> -->
	<p></p>
	<div class="fx mb20 bacWhite p10 fxFw-w" v-for="c in categories">
	   <div class="fx fxJc-sb fxAi-b w bbt mb10 pt5 pb5">
	   <span class="f32">{{c.name}}</span>
	   <span class="f20 fonGray">备注：剩余斤数为零时不可选</span>
	   </div>
	   <ul class="f24 w">
	   	<li class="fx fxAi-c fxJc-sb bbd  pt10 pb10" v-for="d in c.dishes">
	   	<section class="fx fxAi-c"><img :src="d.listImage" class="w90 mr10"><span>{{d.name}}</span><em>（余{{d.stock}}{{d.unit}}）</em></section>
	   	<section v-if="d.stock > 0">
	   		<i class="fa fa-plus-square-o mr10 mt10" @click="d.num++"></i>
	   		<input class="w40 h30 tc f24 mr10" type="text" v-model="d.num" >
	   		<i class="fa fa-minus-square-o mt10" @click="if (d.num > 0) d.num--"></i>
	   	</section>
	   	</li>
	   </ul>
	</div>
	<div class="fx mb20 bacWhite p10 fxFw-w">
		<div class="fx fxJc-sb fxAi-b w bbt mb10 pt5 pb5">
		   <span class="f32" style="color:red;">会员点菜须知</span>
			<%-- <div class="f28" style="color:red;">
				${remark }
			</div> --%>
		</div>
			<ul class="f28 w">
			   	<li class="fx fxAi-c fxJc-sb bbd  pt10 pb10">
			   	<span>${remark}</span>
			   	</li>
			</ul>
	</div>
</main>


<button id="xhlbet" class="pfix h80 f18 fx fxAi-c w fxJc-c f28 show-layer"  data-show-layer="hw-layer" >选好了</button>

<div class="hw-overlay" id="hw-layer">
<div class="hw-layer-wrap">
<span class="fa fa-remove hwLayer-close"></span>
<div class="hw-overlayMain" id="main1">
	   <div class="mb30">
	   <div class="f20 bbt mb5">菜品</div>
	   <ul>
	    <template v-for="c in categories">
	    <li class="fx fxJc-sb" v-for="d in c.dishes" v-if="d.num > 0 && !c.isWater">
	    <span>{{d.name}}</span><em>{{d.num}}</em></li>
	    </template>
	   	<li class="fx fxJc-sb"><span>合计</span><em>{{totalDish()}}</em></li>
	   	<li class="fx fxJc-r"><em>当前可购斤数：${customer.dishLeft }斤</em></li>
	   </ul>
	   </div>
	   <div>
	   <div class="f20 bbt">山泉水</div>
	   <ul>
	    <template v-for="c in categories">
	    <li class="fx fxJc-sb" v-for="d in c.dishes" v-if="d.num > 0 && c.isWater">
	    <span>{{d.name}}</span><em>{{d.num}}{{d.unit}}</em></li>
	    </template>
	   	<li class="fx fxJc-sb"><span>合计</span><em>{{totalWater()}}件</em></li>
	   	<li class="fx fxJc-r"><em>当前可购件数：${customer.waterLeft }件</em></li>
	   </ul>
	   </div>
	   <div>
	   <div class="f20 bbt mb5">收货地址</div>
	   <ul>
	    <li class="fx fxJc-sb"><span>收货人：${address.name }</span><span>联系电话：${address.mobile }</span></li>
	   	<li class="fx bbt mb5"><em>地址：${address.address }</em></li>
	   </ul>
	   </div>
	   <div class="fx pt30 pb30"><button id="tjddan" class="mar-au" @click="save">确认提交</button></div>
</div>
<div class="hw-overlayMain" id="main2">
	   您还没有填写收货地址
	   <div class="fx pt30 pb30"><button id="tjddan" class="mar-au" @click="goAddress">去填写</button></div>
</div>
</div>
</div>

</div>

<%@include file="wx_foot.jsp" %>

<script>
var hasAddress = ${not empty address};
if (hasAddress) {
	$('#main2').hide();
} else {
	$('#main1').hide();
}
var vm = new Vue({
	el : '#vm',
	data: {
		addressId: '${address.id}',
		category: {},
		categories: [],
		waterNum: 0
	},
	created: function() {
		get('${ctx}/wx/getCategories', function(data) {
			vm.categories = data;
			if (vm.categories.length > 0) {
				vm.category = vm.categories[0];
			}
		})
	},
	methods: {
		goAddress: function() {
			location = '${ctx}/wx/addressAdd';
		},
		totalDish: function() {
			var total = 0;
			for (var i = 0; i < this.categories.length; i++) {
				if (this.categories[i].isWater) {
					continue;
				}
				for (var j = 0; j < this.categories[i].dishes.length; j++) {
					total += parseInt(this.categories[i].dishes[j].num);
				}
			}
			return total;
		},
		totalWater: function() {
			var total = 0;
			for (var i = 0; i < this.categories.length; i++) {
				if (!this.categories[i].isWater) {
					continue;
				}
				for (var j = 0; j < this.categories[i].dishes.length; j++) {
					total += this.categories[i].dishes[j].num;
				}
			}
			return total;
		},
		save: function() {
			var idNums = new Array();
			for (var i = 0; i < this.categories.length; i++) {
				for (var j = 0; j < this.categories[i].dishes.length; j++) {
					if (this.categories[i].dishes[j].num > 0) {
						idNums.push(this.categories[i].dishes[j].id + '-' + this.categories[i].dishes[j].num);
					}
				}
			}
			$.ajax({
				url: '${ctx}/wx/saveOrder',
				type: 'post',
				dataType: 'json',
				data: {
					addressId: vm.addressId,
					dishInfo: idNums.join(',')
				},
				success: function(data) {
					if (data.success) { // 成功
						alert('提交成功');
						location = '${ctx}/wx/dishSelect';
						return;
					} else { // 失败
						alert(data.msg);
						return;
					}
					
				}
			});
		}
	}
});
</script>
</body>
</html>