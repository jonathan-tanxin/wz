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
<c:set var="module" value="distributionCenter"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/distributionCenter/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">关联负责人</label>
                 <div class="col-sm-10">
                 	<select data-placeholder="选择一个用户" id="customerId" name="customer.id" style="width:100%;" class="form-control chosen-select" tabindex="2" value="${n.customer.id }">
		            	<option value=""></option>
		            	<c:forEach items="${customerList}" var="item">
                           <option value="${item.id}"
                               ${n.customer.id == item.id ? 'selected="selected"'  :'' }>
                               ${item.nickName}</option>
                       	</c:forEach>
		          	</select>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">名称</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="name" value="${n.name }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">地址</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="address" value="${n.address }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">负责人</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="leader" value="${n.leader }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">电话</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="mobile" value="${n.mobile }">
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>

<script src="${ctx }/res/chosen_v1/chosen.jquery.js" type="text/javascript"></script>
<script src="${ctx }/res/chosen_v1/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx }/res/chosen_v1/docsupport/init.js" type="text/javascript" charset="utf-8"></script>
