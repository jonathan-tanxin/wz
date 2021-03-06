<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="profit"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<form role="form" class="form-inline" id="query-form" method="post" action="${ctx }/admin/profit/list" >
                    		<!-- 查询开始 -->
                            <div class="form-group">
                                <label for="query-profitCustomer" class="sr-only">受益用户</label>
                                	<input type="text" placeholder="受益用户" id="query-profitCustomer" name="profitCustomer.nickName" value="${query.profitCustomer.nickName }" class="form-control">
                            </div>
                            <div class="form-group">
                            	<button class="btn btn-primary form-control" type="submit"><i class="fa fa-check"></i>&nbsp;查询</button>
                            </div>
                            <!-- 查询结束 -->
                        </form>
                    
						<div>
							<p>
								<sec:authorize ifAnyGranted="profit">
		                        <button type="button" class="btn btn-outline btn-primary" onclick="add()">新增</button>
		                        <button type="button" class="btn btn-outline btn-info" onclick="edit()">详情</button>
		                        <button type="button" class="btn btn-outline btn-danger" onclick="del();">删除</button>
		                        </sec:authorize>
								<button type="button" class="btn btn-outline btn-info" onclick="setEdit()">参数设置</button>
		                    </p>
						</div>
						<table id="table" data-toggle="table" data-height="400" data-click-to-select="true" data-mobile-responsive="true">
                                    <thead>
                                        <tr>
                                            <th data-field="state" data-checkbox="true"></th>
                                            <th data-field="id">id</th>
                                            <th data-field="profitCustomer">受益用户</th>
                                            <th data-field="inviteeCustomer">被邀用户</th>
                                            <th data-field="totalPhases">总期数</th>
                                            <th data-field="profitPerMonth">月返利金额</th>
                                            <th data-field="totalProfit">反利总额</th>
                                            <th data-field="notProfitPhases">未返期数</th>
                                            <th data-field="createTime">创建时间</th>
                                            <th data-field="lastUpdateTime">最后更新时间</th>
                                            <th data-field="operation">操作</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${list }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td class="bs-checkbox">
										<input data-index="0" name="btSelectItem" type="checkbox">
									</td>
									<td style="">${n.id }</td>
									<td style="">${n.profitCustomer.nickName}</td>
									<td style="">${n.inviteeCustomer.nickName}</td>
									<td style="">${n.totalPhases }</td>
									<td style="">${n.profitPerMonth }</td>
									<td style="">${n.totalProfit }</td>
									<td style="">${n.notProfitPhases }</td>
									<td style="">
										<fmt:formatDate value="${n.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td style="">
										<fmt:formatDate value="${n.lastUpdateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										<a href="javascript:void(0);" onclick="detail('${n.id}')">详情</a>
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
		    content: "${ctx}/admin/profit/detail",
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

function setEdit(){
    layer.open({
        type: 2,
        skin: 'layui-layer-rim', //加上边框
        area: [layer_default_width, layer_default_height], //宽高
        content: "${ctx}/admin/profit/detailSet",
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

function validateForm(detailForm){
    var profitRatio = detailForm.find("input[name=profitRatio]").val();
    var profitCount = detailForm.find("input[name=profitCount]").val();
    var auto = detailForm.find("select[name=auto]").val();
    var profitDesc = detailForm.find("select[name=profitDesc]").val();
	//console.log(11);
    if(profitCount == ""){
        alert2("请输入返利期数!");
        return false;
    }
    if(profitRatio == ""){
        alert2("请输入返利比例!");
        return false;
    }
    var patrn = /^\d+(\.\d+)?$/;
    if(!patrn.exec(profitCount)){
        alert2("请输入正确的数字！");
        return false;
    }
    if(!patrn.exec(profitRatio)){
        alert2("请输入正确的数字！");
        return false;
    }
    if(auto == ""){
        alert2("请选择是否自动返利!");
        return false;
    }
    if(profitDesc == ""){
        alert2("请输入邀新返利说明!");
        return false;
    }
    if(name.length > 500 ){
        alert2("邀新返利说明长度必须小于500!");
        return false;
    }
    return true;
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
	    content: "${ctx}/admin/profit/detail?id=" + id,
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

function detail(id) {
	layer.open({
	    type: 2,
	    skin: 'layui-layer-rim', //加上边框
	    area: [layer_default_width, layer_default_height], //宽高
	    content: "${ctx}/admin/profit/profitPhases?profitId=" + id,
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
			url: "${ctx}/admin/profit/delete",
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