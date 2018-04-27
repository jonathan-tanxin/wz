<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="dish"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    <input type="hidden" placeholder="菜品类别" id="categoryIdHidden" value="${query.category.id }" class="form-control">
                    	<form role="form" class="form-inline" id="query-form" method="post" action="${ctx }/admin/dish/list" >
                    		<!-- 查询开始 -->
                            <div class="form-group">
                                <label for="query-category" class="sr-only">菜品类别</label>
                            	<select name="category.id" value="${query.category.id }" style="width:150px;" id="query-category" placeholder="菜品类别" class="form-control">
                            		
                            	</select>
                            </div>
                            <div class="form-group">
                                <label for="query-name" class="sr-only">菜品名</label>
                                	<input type="text" placeholder="菜品名" id="query-name" name="name" value="${query.name }" class="form-control">
                            </div>
                            <div class="form-group">
                            	<button class="btn btn-primary form-control" type="submit"><i class="fa fa-check"></i>&nbsp;查询</button>
                            </div>
                            <!-- 查询结束 -->
                        </form>
                    
						<div>
							<p>
								<sec:authorize ifAnyGranted="dish">
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
                                            <th data-field="name">菜品名</th>
                                            <th data-field="category">菜品类别</th>
                                            <th data-field="unit">单位</th>
                                            <th data-field="stock">库存</th>
                                            <th data-field="stars">星级</th>
                                            <th data-field="totalSold">总销量</th>
                                            <th data-field="monthSold">月销量</th>
                                            <th data-field="price">价格</th>
                                            <th data-field="isCustomerOwner">是否属于会员</th>
                                            <th data-field="createTime">创建时间</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${list }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td class="bs-checkbox">
										<input data-index="0" name="btSelectItem" type="checkbox" value="${n.id }">
									</td>
									<td style="display:none;">${n.id }</td>
									<td style="">${n.name }</td>
									<td style="">${n.category.name}</td>
									<td style="">${n.unit }</td>
									<td style="">${n.stock }</td>
									<td style="">${n.stars }</td>
									<td style="">${n.totalSold }</td>
									<td style="">${n.monthSold }</td>
									<td style="">${n.price }</td>
									<td style="">
									<c:if test="${n.isCustomerOwner ==true}">是</c:if>
									<c:if test="${n.isCustomerOwner ==false}">否</c:if>
									</td>
									<td style="">
										<fmt:formatDate value="${n.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
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
		    content: "${ctx}/admin/dish/detail",
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
	    content: "${ctx}/admin/dish/detail?id=" + id,
	    btn: ['确定', '取消'],
	    yes: function(index, layero){ //或者使用btn1
	    	var detailForm = layer.getChildFrame('form', index);
	    	console.log(detailForm);
	    	if(!validateForm(detailForm)){
	    		return false;
	    	}
	    	detailForm.ajaxSubmit({
	    		success: function(data) {
	    			console.log(data);
	    			console.log(isSuccess(data));
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
			url: "${ctx}/admin/dish/delete",
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
	var name = detailForm.find("input[name=name]").val();
	var stock = detailForm.find("input[name=stock]").val();
	var listImage = detailForm.find("input[name=listImage]").val();
	var listImageFile = detailForm.find("input[name=listImageFile]").val();
	var images = detailForm.find("input[name=images]").val();
	var imagesFile = detailForm.find("input[name=imagesFile]").val();
	var categoryId = detailForm.find("categoryId").val();
	var totalSold = detailForm.find("input[name=totalSold]").val();
	var monthSold = detailForm.find("input[name=monthSold]").val();
	var patrn = /^\d+(\.\d+)?$/;
	var imageP = !/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/;
	if(name== ""){
		alert2("请输入菜品名");
		return false;
	}
	if(name.length > 20){
		alert2("菜品名内容长度小于等于20");
		return false;
	}
	if(stock== ""){
		alert2("请输入库存");
		return false;
	}
	if(!patrn.exec(stock)){
		alert2("请输入正确的数字！");
		return false;
	}
	if(listImage=="" && listImageFile ==""){
		alert2("请上传列表页的图片");
		return false;
	} else if(listImageFile !="" && !/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(listImageFile)){
		alert2("请上传图片文件");
		return false;
	}
	if(images=="" && imagesFile ==""){
		alert2("请上传图片");
		return false;
	} else if(imagesFile !="" && !/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(imagesFile)){
		alert2("请上传图片");
		return false;
	}
	if(!patrn.exec(totalSold)){
		alert2("请输入正确的数字！");
		return false;
	}
	if(!patrn.exec(monthSold)){
		alert2("请输入正确的数字！");
		return false;
	}
	
	return true;
}

$(document).ready(function(){
	$.ajax({
		url: "${ctx}/admin/category/queryList",
		data: {
			
		},
		success: function(data) {
			var obj = eval("("+data+")");
			var categoryId = $("#categoryIdHidden").val();
			$("#query-category").html("<option value=''>菜品类别</option>");
			$.each(obj.list, function(i, item){
				if(item.id == categoryId){
					$("#query-category").append("<option value='"+item.id+"' selected>" + item.name + "</option>");
				} else {
					$("#query-category").append("<option value='"+item.id+"'>" + item.name + "</option>");
				}
			});
			
		}
	});
});

paging('pagination', ${page.totalPages}, ${page.page});
</script>
</body>
</html>