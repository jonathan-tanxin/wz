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
		<form action="${ctx }/admin/profit/saveSet?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">返利比例</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="profitRatio" value="${n.profitRatio }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">返利期数</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="profitCount" value="${n.profitCount }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">是否自动返利</label>
                 <div class="col-sm-10">
                     <select id="auto" name="auto" class="form-control" value="${n.auto }">
                         <option value="">请选择</option>
                         <option value="true">是</option>
                         <option value="false">否</option>
                     </select>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">邀新返利说明</label>
                 <div class="col-sm-10">

                 	<input type="text" class="form-control" name="profitDesc" value="${n.profitDesc }">
                 </div>
             </div>
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
<script type="text/javascript">
    $(document).ready(function(){
        var autoVal = $("#auto").attr("value");
        if(autoVal) {
            $("#auto").find("option[value=" + autoVal + "]").attr("selected", true);
        }
    });
</script>