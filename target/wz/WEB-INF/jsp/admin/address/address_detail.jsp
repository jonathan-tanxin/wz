<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="address"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/address/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">用户</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="customer.id" value="${n.customer.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">联系人</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="name" value="${n.name }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">联系电话</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="mobile" value="${n.mobile }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">地址</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="address" value="${n.address }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">省</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="province.id" value="${n.province.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">城市</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="city.id" value="${n.city.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">地区</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="district.id" value="${n.district.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">配送中心</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="distributionCenter.id" value="${n.distributionCenter.id }">
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
