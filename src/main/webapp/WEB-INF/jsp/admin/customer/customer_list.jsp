<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="customer"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<form role="form" class="form-inline" id="query-form" method="post" action="${ctx }/admin/customer/list" >
                    		<!-- 查询开始 -->
                            <div class="form-group">
                                <label for="query-nickName" class="sr-only">昵称</label>
                                	<input type="text" placeholder="昵称" id="query-nickName" name="nickName" value="${query.nickName }" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="query-openid" class="sr-only">openid</label>
                                	<input type="text" placeholder="openid" id="query-openid" name="openid" value="${query.openid }" class="form-control">
                            </div>
                            <div class="form-group">
                            	<button class="btn btn-primary form-control" type="submit"><i class="fa fa-check"></i>&nbsp;查询</button>
                            </div>
                            <!-- 查询结束 -->
                        </form>
                    
						<div>
							<p>
								<sec:authorize ifAnyGranted="customer">
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
                                            <th data-field="id">id</th>
                                            <th data-field="nickName">昵称</th>
                                            <th data-field="openid">openid</th>
                                            <th data-field="isDishMember">菜品会员</th>
                                            <th data-field="isWaterMember">桶装水会员</th>
                                            <th data-field="dishLeft">菜品剩余可购</th>
                                            <th data-field="waterLeft">桶装水剩余可购</th>
                                            <th data-field="inviteCode">邀请码</th>
                                            <th data-field="isExpert">专家</th>
                                            <th data-field="createTime">创建时间</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${list }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td class="bs-checkbox">
										<input data-index="0" name="btSelectItem" type="checkbox">
									</td>
									<td style="">${n.id }</td>
									<td style="">${n.nickName }</td>
									<td style="">${n.openid }</td>
									<td style="">
									<c:if test="${n.isDishMember ==true}">是</c:if>
									<c:if test="${n.isDishMember ==false}">否</c:if>
									</td>
									<td style="">
									<c:if test="${n.isWaterMember ==true}">是</c:if>
									<c:if test="${n.isWaterMember ==false}">否</c:if>
									</td>
									<td style="">${n.dishLeft }</td>
									<td style="">${n.waterLeft }</td>
									<td style="">${n.inviteCode }</td>
									<td style="">
									<c:if test="${n.isExpert ==true}">是</c:if>
									<c:if test="${n.isExpert ==false}">否</c:if>
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
		    content: "${ctx}/admin/customer/detail",
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
	    content: "${ctx}/admin/customer/detail?id=" + id,
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
			url: "${ctx}/admin/customer/delete",
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
paging('pagination', ${page.totalPages}, ${page.page});
function validateForm(detailForm){
	var nickName = detailForm.find("input[name=nickName]").val();
	var openid = detailForm.find("input[name=openid]").val();
	var headImage = detailForm.find("input[name=headImage]").val();
	var imageFile = detailForm.find("input[name=imageFile]").val();
	var dishLeft = detailForm.find("input[name=dishLeft]").val();
	var waterLeft = detailForm.find("input[name=waterLeft]").val();
	var inviteCode = detailForm.find("input[name=inviteCode]").val();
	var patrn = /^\d+(\.\d+)?$/;
	if(nickName== ""){
		alert2("请输入昵称");
		return false;
	}
	if(nickName.length > 20){
		alert2("昵称内容长度小于等于20");
		return false;
	}
	if(openid== ""){
		alert2("请输入openid");
		return false;
	}
	if(openid.length > 100){
		alert2("openid内容长度小于等于100");
		return false;
	}
	if(headImage=="" && imageFile ==""){
		alert2("请上传头像");
		return false;
	} else if(imageFile !="" && !/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(imageFile)){
		alert2("请上传图片文件");
		return false;
	}
	if(dishLeft== ""){
		alert2("请输入菜品剩余可购");
		return false;
	}
	if(!patrn.exec(dishLeft)){
		alert2("菜品剩余可购为数字类型！");
		return false;
	}
	if(waterLeft== ""){
		alert2("请输入桶装水剩余可购");
		return false;
	}
	if(!patrn.exec(waterLeft)){
		alert2("桶装水剩余可购为数字类型！");
		return false;
	}
	if(inviteCode== ""){
		alert2("请输入邀请码");
		return false;
	}
	if(inviteCode.length > 30){
		alert2("邀请码内容长度小于等于30");
		return false;
	}
	return true;
}
</script>
</body>
</html>