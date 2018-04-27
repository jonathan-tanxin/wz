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
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<form role="form" class="form-inline" id="query-form" method="post" action="${ctx }/admin/card/list" >
                    		<!-- 查询开始 -->
                    		<div class="form-group">
                                <label for="query-type" class="sr-only">会员卡名称</label>
                                	<input type="text" placeholder="会员卡名称" id="query-type" name="name" value="${query.name }" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="query-type" class="control-label" style="width:50px;">类型:</label>
                               	<select id="type" name="type" style="width:150px;" class="form-control" value="${query.type }">
			                 		<option value="">请选择</option>
			                 		<option value="1">购菜</option>
			                 		<option value="2">购水</option>
			                 	</select>
				                 	<!-- 
                                	<input type="text" placeholder="类型" id="query-type" name="type" value="${query.type }" class="form-control"> -->
                            </div>
                            <div class="form-group">
                            	<button class="btn btn-primary form-control" type="submit"><i class="fa fa-check"></i>&nbsp;查询</button>
                            </div>
                            <!-- 查询结束 -->
                        </form>
                    
						<div>
							<p>
								<sec:authorize ifAnyGranted="card">
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
                                            <th data-field="name">会员卡名称</th>
                                            <th data-field="description">描述</th>
                                            <th data-field="type">类型</th>
                                            <th data-field="months">月数（6个月，1年）</th>
                                            <th data-field="money">购卡金额</th>
                                            <th data-field="amount">购买数量</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${list }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td class="bs-checkbox">
										<input data-index="0" name="btSelectItem" type="checkbox">
									</td>
									<td style="display:none;">${n.id }</td>
									<td style="">${n.name }</td>
									<td style="">${n.description }</td>
									<td style="">
										<c:if test="${n.type ==1}">购菜</c:if>
										<c:if test="${n.type ==2}">购水</c:if>
									</td>
									<td style="">${n.months }</td>
									<td style="">${n.money }</td>
									<td style="">${n.amount }</td>
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
		    content: "${ctx}/admin/card/detail",
		    btn: ['确定', '取消'],
		    yes: function(index, layero){ //或者使用btn1
		    	var detailForm = layer.getChildFrame('form', index);
		    	if(!validateForm(detailForm)){
		    		return false;
		    	}
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
	    content: "${ctx}/admin/card/detail?id=" + id,
	    btn: ['确定', '取消'],
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
			url: "${ctx}/admin/card/delete",
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
	var description = detailForm.find("input[name=description]").val();
	var type = detailForm.find("select[name=type]").val();
	var months = detailForm.find("select[name=months]").val();
	var money = detailForm.find("input[name=money]").val();
	var amount = detailForm.find("input[name=amount]").val();
	if(name == ""){
		alert2("请输入会员卡名称!");
		return false;
	}
	if(name.length > 20 ){
		alert2("会员卡名称长度必须小于20!");
		return false;
	}
	if(description != "" && description.length > 100){
		alert2("请输入描述!");
		return false;
	}
	if(type == ""){
		alert2("请选择类型!");
		return false;
	}
	if(months == ""){
		alert2("请选择月数!");
		return false;
	}
	if(money == ""){
		alert2("请输入购卡金额!");
		return false;
	}
	var patrn = /^\d+(\.\d+)?$/;
	if(!patrn.exec(money)){
		alert2("请输入正确的数字！");
		return false;
	}
	if(amount == ""){
		alert2("请输入购菜斤数!");
		return false;
	}
	if(!patrn.exec(money)){
		alert2("请输入正确的数字！");
		return false;
	}
	return true;
}
paging('pagination', ${page.totalPages}, ${page.page});

</script>
</body>
</html>