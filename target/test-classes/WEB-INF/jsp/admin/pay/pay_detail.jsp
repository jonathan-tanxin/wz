<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="pay"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/pay/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">用户</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="customer.id" value="${n.customer.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">系统内编号</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="payNO" value="${n.payNO }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">微信交易流水号</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="wxPayNo" value="${n.wxPayNo }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">应付金额</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="amount" value="${n.amount }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">实付金额</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="actualPayAmount" value="${n.actualPayAmount }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">交易类型，1购买菜品会员卡，2购买桶装水会员卡</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="type" value="${n.type }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">关联会员卡id</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="card.id" value="${n.card.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">创建时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="createTime" value="<fmt:formatDate value='${n.createTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">支付更新时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="payUpdateTime" value="<fmt:formatDate value='${n.payUpdateTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">状态</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="status" value="${n.status }">
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
