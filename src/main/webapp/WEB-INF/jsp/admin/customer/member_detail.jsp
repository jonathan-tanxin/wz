<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="customer"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/customer/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
                 <label class="col-sm-2 control-label">昵称</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="nickName" value="${n.nickName }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">头像</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="headImage" value="${n.headImage }"  style="display:none;">
                 	<input type="file" name="imageFile"  value="" class="form-control"/>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">openid</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="openid" value="${n.openid }">
                 </div>
             </div>
			<input type="hidden" value="true" name="isDishMember">
			<input type="hidden" value="true" name="isWaterMember">
			<div class="form-group">
                 <label class="col-sm-2 control-label">菜品剩余可购</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="dishLeft" value="${n.dishLeft }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">桶装水剩余可购</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="waterLeft" value="${n.waterLeft }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">邀请码</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="inviteCode" value="${n.inviteCode }" >
                 </div>
             </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">地址</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="addr.address" value="${addr.address }" readonly="readonly">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">配送中心名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="addr.distributionCenter.name" value="${addr.distributionCenter.name}" readonly="readonly">
                </div>
            </div>
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
