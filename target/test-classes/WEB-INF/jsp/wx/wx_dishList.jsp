<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="enum" uri="http://www.daxia.com/enum"%>
<%@include file="wx_head.jsp"%>
<style type="text/css">
		.wrapper03 {position:relative;height: 1.5rem;width: 100%;overflow: hidden;margin:0 auto;background:#FFFfff; margin-bottom: .25rem;}
		.wrapper03 .scroller {position:absolute}
		.wrapper03 .scroller li {height: 1rem;color:#333;float: left;line-height: 1rem;font-size: .4rem;text-align: center}
		.wrapper03 .scroller li a{color:#333;display:block;margin:0 .3rem}
		/* .wrapper03 .scroller li.cur a{color:#1cbb9b;height:.9rem;border-bottom:.1rem solid #1cbb9b} */
	</style>

<div id="vm">
<main class="pb100  ">
<div id="wrapper03" class="wrapper03 wrapper">
<div class="scroller">
	<ul class="clearfix fx  mb20 bacWhite h100  pt20 pb20">
		<li class="fx fxFd-c  fxAi-c  w200" v-for="c in categories" @click="category=c">
			<img :src="c.image" class="w80 h80">
			<p class="lh30 f20">{{c.name}}</p>
		</li>
	</ul>
</div>
</div>
	
<div class="fx mb20 bacWhite p10 fxFw-w">
	<ul class="f18 w">
		<li class="fx fxAi-c  bbd  pt10 pb10" v-for="d in category.dishes" @click="location='${ctx }/wx/dishDetail?id=' + d.id">
			<section class="fx fxAi-c mr10">
				<img :src="d.listImage" class="w100 mr10" style="">
			</section>
			<section>
				<p class="f24 lh48">{{d.name}}</p>
				<p class="f24 lh48">
					￥<em class="tc-gules f32">{{d.price}}</em>/{{d.unit}}
				</p>
				<p class="rating">
					<template v-for="n in parseInt(d.stars)">
					<i class="fa fa-star "></i>
					</template>
						<span class="fonGray ml10">月销售：{{d.monthSold}}{{d.unit}}</span>
				</p>
			</section>
		</li>
	</ul>
</div>




</main>


<button id="xhlbet"
	class="pfix h80 f18 fx fxAi-c w fxJc-c f28 show-layer"
	onclick="location='${ctx}/wx/dishSelect'">会员点菜</button>

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
</div>
<%@include file="wx_foot.jsp"%>
<script type="text/javascript">
	$(function(){
		//demo示例一到四 通过lass调取，一句可以搞定，用于页面中可能有多个导航的情况
		$('.wrapper').navbarscroll();
	});
</script>

<script>
	var vm = new Vue({
		el : '#vm',
		data: {
			category: {},
			categories: []
		},
		created: function() {
			get('${ctx}/wx/getCategories2', function(data) {
				vm.categories = data;
				if (vm.categories.length > 0) {
					vm.category = vm.categories[0];
				}
			})
		}
	});
</script>
</body>
</html>