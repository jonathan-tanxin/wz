<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="customerCard"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/customerCard/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">用户</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="customer.id" value="${n.customer.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">会员卡</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="card.id" value="${n.card.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">购买金额</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="money" value="${n.money }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">开始时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="startTime" value="<fmt:formatDate value='${n.startTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">结束时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="endTime" value="<fmt:formatDate value='${n.endTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">创建时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="createTime" value="<fmt:formatDate value='${n.createTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
