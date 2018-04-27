<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="customerBalanceDetail"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/customerBalanceDetail/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">用户</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="customer.id" value="${n.customer.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">变化前</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="balanceBefore" value="${n.balanceBefore }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">变化量</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="amount" value="${n.amount }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">变化后</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="balanceAfter" value="${n.balanceAfter }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">关联订单</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="order.id" value="${n.order.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="time" value="<fmt:formatDate value='${n.time }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">类型</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="type" value="${n.type }">
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
