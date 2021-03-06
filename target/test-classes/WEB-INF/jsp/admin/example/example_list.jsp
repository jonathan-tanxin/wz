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
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<form role="form" class="form-inline" id="query-form" method="post" action="${ctx }/admin/example/list" >
                    		<!-- 查询开始 -->
                            <div class="form-group">
                                <label for="query-username" class="sr-only">用户名</label>
                                	<input type="text" placeholder="用户名" id="query-username" name="username" value="${query.username }" class="form-control input-sm">
                            </div>
                            <div class="form-group">
                                <label for="query-createDate" class="sr-only">创建日期</label>
                                	<input type="text" placeholder="创建日期" id="query-createDate" name="createDate" value='<fmt:formatDate value="${query.createDate }" pattern="yyyy-MM-dd"/>' class="form-control input-sm" onclick="laydate({format: 'YYYY-MM-DD'})">
                            </div>
                            <div class="form-group">
                                <label for="query-myname" class="sr-only">姓名</label>
                                	<input type="text" placeholder="姓名" id="query-myname" name="myname" value="${query.myname }" class="form-control input-sm">
                            </div>
                            <div class="form-group">
                            	<button class="btn btn-primary btn-sm " type="submit"><i class="fa fa-check"></i>&nbsp;查询</button>
                            </div>
                            <!-- 查询结束 -->
                        </form>
                    
						<div id="operation">
							<p>
								
		                        <button type="button" class="btn btn-outline btn-primary btn-sm" onclick="add()">新增</button>
		                        
		                        
		                        
		                        <button type="button" class="btn btn-outline btn-info btn-sm" onclick="edit()">详情</button>
		                        
		                        
		                        
		                        <button type="button" class="btn btn-outline btn-danger btn-sm" onclick="del();">删除</button>
		                        <button type="button" class="btn btn-outline btn-primary btn-sm" onclick="exp()">导出</button>
		                        
		                    </p>
						</div>
						<table id="table" data-toggle="table" data-height2="500" data-click-to-select="true" data-mobile-responsive="true">
                                    <thead>
                                        <tr>
                                            <th data-field="state" data-checkbox="true"></th>
                                            <th data-field="id">id</th>
                                            <th data-field="username">用户名</th>
                                            <th data-field="createDate">创建日期</th>
                                            <th data-field="myname">姓名</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${list }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td class="bs-checkbox">
										<input data-index="0" name="btSelectItem" type="checkbox">
									</td>
									<td style="">${n.id }</td>
									<td style="">${n.username }</td>
									<td style="">
										<fmt:formatDate value="${n.createDate }" pattern="yyyy-MM-dd"/>
									</td>
									<td style="">${n.myname }</td>
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
		parent.layer.open({
		    type: 2,
		    skin: 'layui-layer-rim', //加上边框
		    area: [layer_big_width, layer_big_height], //宽高
		    content: "${ctx}/admin/example/detail",
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
	    content: "${ctx}/admin/example/detail?id=" + id,
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
	var ids = new Array();
	for (var i = 0; i < selections.length; i++) {
		ids.push(selections[i].id);
	}
	$.ajax({
		url: "${ctx}/admin/example/delete",
		data: {
			ids: ids.join(',')
		},
		success: function(data) {
			if (isSuccess(data)) {
				reload();
			}
		}
	});
}

function exp() {
	alert("1");
	var url = "${ctx }/admin/example/expExcel";
	$.ajax({
		url: url
	});
}

paging('pagination', ${page.totalPages}, ${page.page});

</script>
</body>
</html>