<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="category"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/category/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
                 <label class="col-sm-2 control-label">类别名称</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="name" value="${n.name }">
                 </div>
             </div>	
            
            <input type="input" name="image"  value="${n.image }" class="form-control" style="display:none;"/>
			<div class="form-group">
				<label class="col-sm-2 control-label">图片：</label>
				<div class="col-sm-10">
				    <input type="file" name="file"  value="" class="form-control"/>
				</div>
             </div>
			<div class="form-group">
				<label class="col-sm-2 control-label">类型</label>
				<div class="col-sm-10">
					<select id="water" name="water" class="form-control" value="${n.water }">
						<option value="">请选择</option>
						<option value="true">沐和山泉水</option>
						<option value="false">菜品</option>
					</select>
				</div>
			</div>
		</form>
</div>

<%@include file="/common/foot.jsp" %>

</body>
</html>
<script type="text/javascript">
    $(document).ready(function(){
        var waterVal = $("#water").attr("value");
        if(waterVal) {
            $("#water").find("option[value=" + waterVal + "]").attr("selected", true);
        }
    });
</script>