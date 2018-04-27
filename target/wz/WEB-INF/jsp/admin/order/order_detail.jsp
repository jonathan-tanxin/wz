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
<c:set var="module" value="order"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/order/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">用户</label>
                 <div class="col-sm-10">
		          	<input type="text"  class="form-control" value="${n.customer.nickName}" readonly/>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">订单号</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="orderNo" value="${n.orderNo }" readonly>
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-2 control-label">订单总额</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="totalAmount" value="${n.totalAmount }" readonly>
                 </div>
             </div>
			<div class="form-group">
                 <label class="col-sm-2 control-label">完成这单后菜剩余可购</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="dishLeft" value="${n.dishLeft }" readonly>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">完成这单后水剩余可购</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="waterLeft" value="${n.waterLeft }" readonly>
                 </div>
             </div>
			<div class="form-group">
                 <label class="col-sm-2 control-label">状态</label>
                 <div class="col-sm-10">
                 	${enum:detail('DistributeStatus', 'distributeStatus', n.distributeStatus) }
                 </div>
             </div>	
				
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>
<script src="${ctx }/res/chosen_v1/chosen.jquery.js" type="text/javascript"></script>
<script src="${ctx }/res/chosen_v1/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx }/res/chosen_v1/docsupport/init.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
