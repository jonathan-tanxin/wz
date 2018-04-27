<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>
  <link rel="stylesheet" href="${ctx }/res/chosen_v1/docsupport/style.css">
  <link rel="stylesheet" href="${ctx }/res/chosen_v1/docsupport/prism.css">
  <link rel="stylesheet" href="${ctx }/res/chosen_v1/chosen.css">
<c:set var="module" value="distributionCenter"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/distributionCenter/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">微信昵称</label>
                 <div class="col-sm-10">
                 	<select data-placeholder="选择一个用户" id="customerId" name="customer.id" style="width:100%;" class="form-control chosen-select" tabindex="2" value="${n.customer.id }">
		            	<option value=""></option>
		            	<c:forEach items="${customerList}" var="item">
                           <option value="${item.id}"
                               ${n.customer.id == item.id ? 'selected="selected"'  :'' }>
                               ${item.nickName}</option>
                       	</c:forEach>
		          	</select>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">配送中心名称</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="name" value="${n.name }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">负责人</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="leader" value="${n.leader }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">电话</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="mobile" value="${n.mobile }">
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-2 control-label">所在省</label>
                 <div class="col-sm-10">
                 	<select name="province.id" class="form-control" id="provinceId">
						<c:forEach items="${provinces }" var="p">
						<option value="${p.id }" ${n.province.id eq p.id ? 'selected' : '' }>${p.name }</option>
						</c:forEach>
					</select>
                 </div>
             </div>	
             <div class="form-group">
                 <label class="col-sm-2 control-label">所在市</label>
                 <div class="col-sm-10">
                 	<select name="city.id" class="form-control" id="cityId">
                 		<c:if test="${not empty(n.city.id) }">
                 		<option value="${n.city.id }">${n.city.name }</option>
                 		</c:if>
					</select>	
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-2 control-label">所在区</label>
                 <div class="col-sm-10">
                 	<select name="district.id" class="form-control" id="districtId">
	                 	<c:if test="${not empty(n.district.id) }">
	                 		<option value="${n.district.id }">${n.district.name }</option>
                 		</c:if>
					</select>
                 </div>
             </div>			
			<div class="form-group">
                 <label class="col-sm-2 control-label">地址</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="address" value="${n.address }">
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

<script>
$('#provinceId').change(function() {
	var provinceId = $(this).val();
	$('#cityId').html('');
	$('#districtId').html('');
	if (provinceId != '') {
		$.ajax({
			url: "${ctx}/admin/province/findArea?provinceId=" + provinceId,
			dataType: "json",
			success: function(array) {
				$('#cityId').append('<option value="">城市</option>');
				for (var i = 0; i < array.length; i++) {
					var obj = array[i];
					var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
					$('#cityId').append(option);	
				}
			}
		});
	}
	
});

$('#cityId').change(function() {
	var cityId = $(this).val();
	$('#districtId').html('');
	if (cityId != '') {
		$.ajax({
			url: "${ctx}/admin/province/findArea?cityId=" + cityId,
			dataType: "json",
			success: function(array) {
				$('#districtId').append('<option value="">地区</option>');
				for (var i = 0; i < array.length; i++) {
					var obj = array[i];
					var option = '<option value="' + obj.id + '">' + obj.name + '</option>';
					$('#districtId').append(option);	
				}
			}
		});
	}
});
</script>
</body>
</html>

<script src="${ctx }/res/chosen_v1/chosen.jquery.js" type="text/javascript"></script>
<script src="${ctx }/res/chosen_v1/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx }/res/chosen_v1/docsupport/init.js" type="text/javascript" charset="utf-8"></script>
