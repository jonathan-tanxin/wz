<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="profit"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/profit/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">受益用户</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="profitCustomer.id" value="${n.profitCustomer.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">被邀用户</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="inviteeCustomer.id" value="${n.inviteeCustomer.id }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">总期数</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="totalPhases" value="${n.totalPhases }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">月返利金额</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="profitPerMonth" value="${n.profitPerMonth }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">反利总额</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="totalProfit" value="${n.totalProfit }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">未返期数</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="notProfitPhases" value="${n.notProfitPhases }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">创建时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="createTime" value="<fmt:formatDate value='${n.createTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">最后更新时间</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="lastUpdateTime" value="<fmt:formatDate value='${n.lastUpdateTime }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
