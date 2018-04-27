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
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<form role="form" class="form-inline" id="query-form" method="post" action="${ctx }/admin/course/list" >
                    		<!-- 查询开始 -->
                            <div class="form-group">
                                <label for="query-title" class="sr-only">标题</label>
                                	<input type="text" placeholder="标题" id="query-title" name="title" value="${query.title }" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="query-status" class="sr-only">状态</label>
                            	<select placeholder="状态" id="query-status" name="status" value="${query.status }" class="form-control" style="width:150px;" class="form-control">
                            		<option value=''>状态</option>
                            		<option value='1'>有效</option>
                            		<option value='2'>无效</option>
                            	</select>
                            	
                            </div>
                            <div class="form-group">
                            	<button class="btn btn-primary form-control" type="submit"><i class="fa fa-check"></i>&nbsp;查询</button>
                            </div>
                            <!-- 查询结束 -->
                        </form>
                    
						<div>
							<p>
								<sec:authorize ifAnyGranted="course">
		                        <button type="button" class="btn btn-outline btn-primary" onclick="add()">新增</button>
		                        <button type="button" class="btn btn-outline btn-info" onclick="edit()">详情</button>
		                        <button type="button" class="btn btn-outline btn-danger" onclick="del();">删除</button>
		                        </sec:authorize>
		                    </p>
						</div>
						<table id="table" data-toggle="table" data-height="400" data-click-to-select="true" data-mobile-responsive="true">
                                    <thead>
                                        <tr>
                                            <th data-field="state" data-checkbox="true"></th>
                                            <th data-field="id" >id</th>
                                            <th data-field="title">标题</th>
                                            <th data-field="host">主讲人</th>
                                            <th data-field="date">日期</th>
                                            <th data-field="href">链接</th>
                                            <th data-field="status">状态</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${list }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td class="bs-checkbox">
										<input data-index="0" name="btSelectItem" type="checkbox">
									</td>
									<td style="display:none;">${n.id }</td>
									<td style="">${n.title }</td>
									<td style="">${n.host }</td>
									<td style="">
										<fmt:formatDate value="${n.date }" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td style="">${n.href }</td>
									<td style="">
										<c:if test="${n.status ==1}">有效</c:if>
										<c:if test="${n.status ==2}">无效</c:if>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
                   
						<div class="row">
							<div class="col-sm-6">
								<div class="dataTables_info" id="DataTables_Table_0_info"
									role="alert" aria-live="polite" aria-relevant="all">显示第 ${(page.page - 1) * page.pageSize  + 1}
									到第 ${(page.page) * page.pageSize} 项，共 ${page.totalRecords } 项</div>
							</div>
							<div class="col-sm-6">
								<div class="dataTables_paginate paging_simple_numbers"
									id="DataTables_Table_0_paginate">
									<ul class="pagination" id="pagination">
									</ul>
								</div>
							</div>
						</div>

					</div>
                </div>
            </div>
        </div>
    </div>

<%@include file="/common/foot.jsp" %>
<script>
function add() {
		layer.open({
		    type: 2,
		    skin: 'layui-layer-rim', //加上边框
		    area: [layer_default_width, layer_default_height], //宽高
		    content: "${ctx}/admin/course/detail",
		    btn: ['确定', '取消'],
		    yes: function(index, layero){ //或者使用btn1
		    	var detailForm = layer.getChildFrame('form', index);
		    	console.log(detailForm);
		    	if(!validateForm(detailForm)){
		    		return false;
		    	}
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

function edit() {
	var selections = $('#table').bootstrapTable('getAllSelections');
	if (selections.length == 0) {
		error('请选择一条记录');
		return;
	} else if (selections.length > 1) {
		error('只能选择一条记录');
		return;
	}
	var id = selections[0].id;
	
	layer.open({
	    type: 2,
	    skin: 'layui-layer-rim', //加上边框
	    area: [layer_default_width, layer_default_height], //宽高
	    content: "${ctx}/admin/course/detail?id=" + id,
	    btn: ['确定', '取消'],
	    yes: function(index, layero){ //或者使用btn1
	    	var detailForm = layer.getChildFrame('form', index);
	    	console.log(detailForm);
	    	if(!validateForm(detailForm)){
	    		return false;
	    	}
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
var page = "${page.page}";
function reload() {
	page_submit(page);
}
function del() {
	var selections = $('#table').bootstrapTable('getAllSelections');
	if (selections.length < 1) {
		error('请选择要删除的记录');
		return;
	}
	layer.confirm('确认要删除吗?', {icon: 3, title:'提示'}, function(index){
		var ids = new Array();
		for (var i = 0; i < selections.length; i++) {
			ids.push(selections[i].id);
		}
		$.ajax({
			url: "${ctx}/admin/course/delete",
			data: {
				ids: ids.join(',')
			},
			success: function(data) {
				if (isSuccess(data)) {
					layer.close(index);
					reload();
				}
			}
		});
	});
}
function validateForm(detailForm){
	var title = detailForm.find("input[name=title]").val();
	var host = detailForm.find("input[name=host]").val();
	var image = detailForm.find("input[name=image]").val();
	var imageFile = detailForm.find("input[name=imageFile]").val();
	var href = detailForm.find("input[name=href]").val();
	var patrn = /^\d+(\.\d+)?$/;
	var imageP = !/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/;
	if(title== ""){
		alert2("请输入菜品名");
		return false;
	}
	if(title.length > 100){
		alert2("菜品名内容长度小于等于100");
		return false;
	}
	if(host== ""){
		alert2("请输入主讲人");
		return false;
	}
	if(host.length > 100){
		alert2("主讲人内容长度小于等于100");
		return false;
	}
	if(image=="" && imageFile ==""){
		alert2("请上传图片");
		return false;
	} else if(imageFile !="" && !/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(imageFile)){
		alert2("请上传图片文件");
		return false;
	}
	if(href== ""){
		alert2("请输入链接");
		return false;
	}
//	if(href.length > 200){
//		alert2("链接内容长度小于等于200");
//		return false;
//	}
	return true;
}
paging('pagination', ${page.totalPages}, ${page.page});
$(document).ready(function(){
	var statusSelVal = $("select[name=status]").attr("value");
	$("select[name=status]").find("option[value='"+statusSelVal+"']").attr("selected","selected");
});
</script>
</body>
</html>