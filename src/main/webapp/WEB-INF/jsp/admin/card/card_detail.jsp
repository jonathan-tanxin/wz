<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="card"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/card/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label" name="l_name">会员卡名称</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="name" value="${n.name }" required="true"/>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label" name="l_description">描述</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="description" value="${n.description }"/>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label" name="l_type">类型</label>
                 <div class="col-sm-10">
                 	<select id="type" name="type" class="form-control" value="${n.type }">
                 		<option value="">请选择</option>
                 		<option value="1">购菜</option>
                 		<option value="2">购水</option>
                 	</select>
                 	<!-- 
                 	<input type="text" class="form-control" name="type" value="${n.type }">
                 	 -->
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label" >月数（6个月，1年）</label>
                 <div class="col-sm-10">
                 	<select id="months" name="months" class="form-control" value="${n.months }">
                 		<option value="">请选择</option>
                 		<option value="6">6个月</option>
                 		<option value="12">1年</option>
                 	</select>
                 	<!-- 
                 	<input type="text" class="form-control" name="months" value="${n.months }"> -->
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">购卡金额</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="money" value="${n.money }" />
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">购买数量</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="amount" value="${n.amount }" />
                 </div>
             </div>	
        	
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	var typeVal = $("#type").attr("value");
	if(typeVal){
		$("#type").find("option[value="+typeVal+"]").attr("selected",true);
	}
	var monthsVal = $("#months").attr("value");
	if(monthsVal){
		$("#months").find("option[value="+monthsVal+"]").attr("selected",true);
	}
});
</script>
