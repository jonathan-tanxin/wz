<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="user"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/systemConfig/save?id=${n.id }" id="reset-form" class="form-horizontal" method="post">
			 <div class="form-group">
                 <label class="col-sm-2 control-label"></label>
                 <div class="col-sm-10">
                 	<label>${n.remark }</label>
                 </div>
             </div>	
             <div class="form-group">
                 <label class="col-sm-2 control-label">请输入配置内容</label>
                 <div class="col-sm-6">
                 	<textarea class="form-control" name="value" id="" cols="30" rows="5">${n.value }</textarea>
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-2 control-label"></label>
                 <div class="col-sm-6">
                 	<input type="button" onclick="return doSubmit()" class="form-control btn btn-primary btn-outline " value="保存"/>
                 </div>
             </div>
		</form>
</div>

<%@include file="/common/foot.jsp" %>

<script>
	function doSubmit() {
		$('form').ajaxSubmit({
			success: function(data) {
				if (isSuccess(data)) {
				} else {
				}
			}
		});
	}
</script>
</body>
</html>
