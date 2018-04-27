<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>


<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/order/updateStatusToSend" id="order-send-form" class="form-horizontal" method="post">
			<input type="hidden" name="id" value="${n.id }"/>
			
             <div class="form-group">
                 <label class="col-sm-2 control-label">配送状态</label>
                 <div class="col-sm-10">
                 	<select data-placeholder="选择状态" id="distributeStatus" name="distributeStatus" style="width:100%;" class="form-control chosen-select" tabindex="2" >
		            	<option value="">请选择</option>
		            	<c:forEach items="${distributeStatusList}" var="item">
                           <option value="${item.value}"
                               ${n.distributeStatus == item.value ? 'selected="selected"'  :'' }>
                               ${item.remark}</option>
                       	</c:forEach>
		          	</select>
                 </div>
             </div>	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
