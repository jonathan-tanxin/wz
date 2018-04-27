<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="example"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/example/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-1 control-label">用户名开始时间</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 	<span class="help-block m-b-none">请输入您注册时所填的E-mail</span>
                 </div>
                 
                 <label class="col-sm-1 control-label">用户名</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
             </div>	
             <div class="form-group">
                 <label class="col-sm-1 control-label">用户名开始时间</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
                 
                 <label class="col-sm-1 control-label">用户名</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-1 control-label">用户名开始时间</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
                 
                 <label class="col-sm-1 control-label">用户名</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-1 control-label">用户名开始时间</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
                 
                 <label class="col-sm-1 control-label">用户名</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-1 control-label">用户名开始时间</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
                 
                 <label class="col-sm-1 control-label">用户名</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-1 control-label">用户名开始时间</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
                 
                 <label class="col-sm-1 control-label">用户名</label>
                 <div class="col-sm-5">
                 	<input type="text" class="form-control" name="username" value="${n.username }">
                 </div>
             </div>
		</form>
</div>

<%@include file="/common/foot.jsp" %>

<script>
	function test() {
		parent.layer.open({
		    type: 2,
		    skin: 'layui-layer-rim', //加上边框
		    area: [layer_big_width, layer_big_height], //宽高
		    offset: [10, 20],
		    content: "${ctx}/admin/menu/detail",
		    btn: ['确定', '取消'],
		    zIndex: layer.zIndex,
		    success: function(layero){
		        layer.setTop(layero); //重点2
		      },
		    yes: function(index, layero){ //或者使用btn1
		    	var detailForm = layer.getChildFrame('form', index);
		    	console.log(detailForm);
		    	detailForm.ajaxSubmit({
		    		success: function(data) {
		    			if (isSuccess(data)) {
		    				layer.close(index);
		    				reload();
		    			} else {
		    			}
		    		}
		    	});
		    }, cancel: function(index){ //或者使用btn2
		        //按钮【按钮二】的回调
		    }
		});
	}
</script>
</body>
</html>
