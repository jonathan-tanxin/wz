<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="profitDetail"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/profitDetail/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">返利类型</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="type" value="${n.type }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">用户</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="customer.id" value="${n.customer.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">返利id</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="profit.id" value="${n.profit.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">返利时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="profitTime" value="<fmt:formatDate value='${n.profitTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">状态</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="status" value="${n.status }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">返利金额</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="amount" value="${n.amount }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">当前返的是第几期</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="phase" value="${n.phase }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">总共多少期</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="totalPhases" value="${n.totalPhases }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">创建时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="createTime" value="<fmt:formatDate value='${n.createTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">备注</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="remark" value="${n.remark }">
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
