<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="profitPhase"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/profitPhase/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">返利</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="profit.id" value="${n.profit.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">计划返利日期</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="planDate" value="<fmt:formatDate value='${n.planDate }' pattern='yyyy-MM-dd'/>" onclick="laydate({format: 'YYYY-MM-DD'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">实际返利时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="actualTime" value="<fmt:formatDate value='${n.actualTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">状态</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="status" value="${n.status }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">失败原因</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="failMessage" value="${n.failMessage }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">期数</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="phase" value="${n.phase }">
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
