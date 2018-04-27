<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="dish"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/dish/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
                 <label class="col-sm-2 control-label">菜品类别</label>
                 <div class="col-sm-10">
                 	<input type="hidden" id="categoryIdVal" value="${n.category.id }"/>
                 	<select  class="form-control" id="categoryId" name="category.id" >
                 		
                 	</select>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">菜品名</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="name" value="${n.name }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">单位</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="unit" value="${n.unit }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">库存</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="stock" value="${n.stock }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">列表页的图片</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="listImage" value="${n.listImage }" style="display:none;">
                 	<input type="file" name="listImageFile"  value="" class="form-control"/>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">图片</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="images" value="${n.images }" style="display:none;">
                 	<input type="file" name="imagesFile"  value="" class="form-control"/>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">星级</label>
                 <div class="col-sm-10">
                 	<select value="${n.stars }" class="form-control" id="stars" name="stars" >
                 		<option value="0">无</option>
                 		<option value="1">一星</option>
                 		<option value="2">二星</option>
                 		<option value="3">三星</option>
                 		<option value="4">四星</option>
                 		<option value="5">五星</option>
                 	</select>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">总销量</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" id="totalSold" name="totalSold" value="${n.totalSold }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">月销量</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" id="monthSold" name="monthSold" value="${n.monthSold }" >
                 </div>
             </div>	
             <div class="form-group">
                 <label class="col-sm-2 control-label">价格</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" id="price" name="price" value="${n.price }" >
                 </div>
             </div>	
        	<div class="form-group">
                 <label class="col-sm-2 control-label">是否属于会员</label>
                 <div class="col-sm-10">
                 	<input type="radio"  checked="true" value="true" name="isCustomerOwner"> <i></i> 是</label>
                 	<input type="radio"  value="false" name="isCustomerOwner"> <i></i> 否</label>
                 </div>
             </div>	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	if($("#totalSold").val()==""){
		$("#totalSold").val(0)
	}
	if($("#monthSold").val()==""){
		$("#monthSold").val(0)
	}
	$.ajax({
		url: "${ctx}/admin/category/queryList",
		data: {
			
		},
		success: function(data) {
			var obj = eval("("+data+")");
			var categoryId = $("#categoryIdVal").val();
			$("#categoryId").html("<option>请选择</option");
			$.each(obj.list, function(i, item){
				if(item.id == categoryId){
					$("#categoryId").append("<option value='"+item.id+"' selected>" + item.name + "</option>");
				} else {
					$("#categoryId").append("<option value='"+item.id+"'>" + item.name + "</option>");
				}
			});
			
		}
	});
	var isCustomerOwner = "${n.isCustomerOwner}";
	if(isCustomerOwner != ""){
		$("input[name=isCustomerOwner][value='"+isCustomerOwner+"']").attr("checked", "checked");
	}
});

</script>
