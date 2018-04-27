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

<header id="header" class="h80 f18 fx fxAi-c">
<a href="#" class="fxFl"><i class="fa fa-angle-left fa-fw fa-2x"></i></a>
<h1 class="fxFl1 tc">收货地址修改</h1>
<a href="#" class="fxFl"><i class=""></i></a>
</header>

<main id="mian" class=" pb100">

<div class="fx mb30 bacWhite  fxFd-c f24 ">
<section class="p30 fx bbt fxAi-c">
<span class="w100 mr50">收货人：</span><form class="fonGray">
	<input placeholder="请输入" type="text" id="name" value="${n.name }" class="bt-no f28 p10 lh32"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w100 mr50">联系电话</span><form class="fonGray">
<input placeholder="请输入" type="text" id="mobile" value="${n.mobile }" class="bt-no f28 p10 lh32"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w100 mr50">收货地区</span><form class="fonGray">
<select name="select" id="province" class="bt-no f28 p10 lh32">
	<option>选择省份</option>
	<c:forEach items="${provinces }" var="p">
	<option value="${p.id }" ${p.id eq n.district.city.province.id ? 'selected' : '' }>${p.name }</option>
	</c:forEach>
</select>
<select name="select" id="city" class="bt-no f28 p10 lh32">
	<option>选择城市</option>
	<option value="${n.district.city.id }" selected>${n.district.city.name }</option>
</select>
<select name="select" id="district" class="bt-no f28 p10 lh32">
	<option>选择地区</option>
	<option value="${n.district.id }" selected>${n.district.name }</option>
</select>
</form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w100 mr50">详细地址</span><form class="fonGray"><input value="${n.address }" id="address" placeholder="请输入" type="text" class="bt-no f28 p10 lh32"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w100 mr50">配送中心</span><form class="fonGray">
<select name="select" id="center" class="bt-no f28 p10 lh32">
	<c:forEach items="${centers }" var="c">
	<option value="${c.id }" ${n.distributionCenter.id eq c.id ? 'selected' : '' }>${c.name }</option>
	</c:forEach>
</select></form>
</section>
</div>
<div class="fx fxAi-c fxJc-c">
<button class="p30 f32 w800 bt-no bacls" onclick="save()">保存</button>
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

<script>
function save() {
	post('${ctx}/wx/saveAddress', {
			id: '${n.id}',
			name: $('#name').val(),
			mobile: $('#mobile').val(),
			districtId: $('#district').val(),
			address: $('#address').val(),
			centerId: $('#center').val()
		}, function(data) {
		if (isSuccess(data)) {
			location = '${ctx}/wx/addressList';
		}
	});
}

$('#province').change(function() {
	var provinceId = $(this).val();
	$('#city').html('');
	$('#district').html('');
	$('#district').append('<option value="">选择地区</option>');
	if (provinceId != '') {
		$.ajax({
			url: "${ctx}/province/findArea?provinceId=" + provinceId,
			dataType: "json",
			success: function(array) {
				$('#city').append('<option value="">选择城市</option>');
				for (var i = 0; i < array.length; i++) {
					var obj = array[i];
					var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
					$('#city').append(option);	
				}
			}
		});
	}
});

$('#city').change(function() {
var cityId = $(this).val();
$('#district').html('');
if (cityId != '') {
	$.ajax({
		url: "${ctx}/province/findArea?cityId=" + cityId,
		dataType: "json",
		success: function(array) {
			$('#district').append('<option value="">选择地区</option>');
			for (var i = 0; i < array.length; i++) {
				var obj = array[i];
				var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
				$('#district').append(option);	
			}
		}
	});
}
});
</script>
</body>
</html>