<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="order"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<form role="form" class="form-inline" id="query-form" method="post" action="${ctx }/admin/order/sendList" >
                    		<!-- 查询开始 -->
                            <div class="form-group">
                                <label for="query-customer" class="sr-only">用户</label>
                                	<input type="text" placeholder="用户" id="query-customer" name="customer.nickName" value="${query.customer.nickName }" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="query-orderNo" class="sr-only">订单号</label>
                                	<input type="text" placeholder="订单号" id="query-orderNo" name="orderNo" value="${query.orderNo }" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="query-status" class="sr-only">状态</label>
                                <select placeholder="状态" id="query-status" name="status" value="${query.status }" class="form-control">
                            		<option value="">状态</option>
                            		<c:forEach items="${statusList }" var="n" varStatus="idx">
                            			<option value="${n.value }" ${n.value eq query.status ? 'selected' : ''}>${n.remark }</option>
                            		</c:forEach>
                            	</select>
                            </div>
                            <div class="form-group">
                                <label for="query-distributeStatus" class="sr-only">配送状态</label>
                                <select placeholder="配送状态" id="query-distributeStatus" name="distributeStatus" value="${query.distributeStatus }" class="form-control">
                            		<option value="">配送状态</option>
                            		<c:forEach items="${distributeStatusList }" var="n" varStatus="idx">
                            			<option value="${n.value }" ${n.value eq query.distributeStatus ? 'selected' : ''}>${n.remark }</option>
                            		</c:forEach>
                            	</select>
                            </div>
                            <div class="form-group">
                            	<button class="btn btn-primary form-control" type="submit"><i class="fa fa-check"></i>&nbsp;查询</button>
                            </div>
                            <!-- 查询结束 -->
                        </form>
                    
						<div>
							<p>
								<sec:authorize ifAnyGranted="order">
								<!-- 
		                        <button type="button" class="btn btn-outline btn-primary" onclick="add()">新增</button>
		                         -->
		                        <button type="button" class="btn btn-outline btn-info" onclick="edit()">详情</button>
		                        <!-- 
		                        <button type="button" class="btn btn-outline btn-danger" onclick="del();">删除</button>
		                         -->
		                        </sec:authorize>
		                    </p>
						</div>
						<table id="table" data-toggle="table" data-height="400" data-click-to-select="true" data-mobile-responsive="true">
                                    <thead>
                                        <tr>
                                            <th data-field="state" data-checkbox="true"></th>
                                            <th data-field="id" >id</th>
                                            <th data-field="customer">用户</th>
                                            <th data-field="orderNo">订单号</th>
                                            <th data-field="totalAmount">订单总额</th>
                                            <th data-field="distributeStatus">配送状态</th>
                                            <th data-field="dishLeft">完成这单后菜剩余可购</th>
                                            <th data-field="waterLeft">完成这单后水剩余可购</th>
                                            <th data-field="status">状态</th>
                                            <th data-field="createTime">创建时间</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${list }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td class="bs-checkbox">
										<input data-index="0" name="btSelectItem" type="checkbox">
									</td>
									<td style="display:none;">${n.id }</td>
									<td style="">${n.customer.nickName}</td>
									<td style="">${n.orderNo }</td>
									<td style="">${n.totalAmount }</td>
									<td style="">${enum:list('DistributeStatus', n.distributeStatus) }</td>
									<td style="">${n.dishLeft }</td>
									<td style="">${n.waterLeft }</td>
									<td style="">${enum:list('OrderStatus', n.status) }</td>
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
		    content: "${ctx}/admin/order/detail",
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
	    content: "${ctx}/admin/order/detail?id=" + id,
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
			url: "${ctx}/admin/order/delete",
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

</script>
</body>
</html>