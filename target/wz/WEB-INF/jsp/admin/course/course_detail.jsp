<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="course"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/course/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
                 <label class="col-sm-2 control-label">标题</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="title" value="${n.title }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">图片</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="image" value="${n.image }" style="display:none;">
                 	<input type="file" name="imageFile"  value="" class="form-control"/>
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">主讲人</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="host" value="${n.host }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">日期</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" id="date" name="date" value="<fmt:formatDate value='${n.date }' pattern='yyyy-MM-dd HH:mm:ss'/>" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss'})">
                 </div>
             </div>
			<div class="form-group">
                 <label class="col-sm-2 control-label">链接</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="href" value="${n.href }">
                 </div>
             </div>	
        	 <div class="form-group">
                 <label class="col-sm-2 control-label">状态</label>
                 <div class="col-sm-10">
                 	<select id="status" name="status" class="form-control" value="${n.status }">
                 		<option value="1">有效</option>
                 		<option value="2">无效</option>
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
	if($("#date").val() == ""){
		var time2 = new Date().Format("yyyy-MM-dd hh:mm:ss");
		$("#date").val(time2);
	}
})
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
</script>
