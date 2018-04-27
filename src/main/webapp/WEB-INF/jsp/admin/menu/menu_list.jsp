<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>

<c:set var="module" value="menu"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                    	<form role="form" class="form-inline" id="query-form" method="post" action="${ctx }/admin/menu/list" >
                    		<!-- 查询开始 -->
                            <div class="form-group">
                                <label for="query-name" class="sr-only">名称</label>
                                	<input type="text" placeholder="名称" id="query-name" name="name" value="${query.name }" class="form-control">
                            </div>
                            <div class="form-group">
                            	<button class="btn btn-primary form-control" type="submit"><i class="fa fa-check"></i>&nbsp;查询</button>
                            </div>
                            <!-- 查询结束 -->
                        </form>
                    
						<div id="operation">
							<p>
								
		                        <button type="button" class="btn btn-outline btn-primary" onclick="add()">新增</button>
		                        
		                        
		                        <!-- 
		                        
		                        <button type="button" class="btn btn-outline btn-danger" onclick="del();">删除</button>
		                        
		                         -->
		                    </p>
						</div>
					</div>
                </div>
            </div>

			<div class="col-sm-4">
	                <div class="ibox float-e-margins">
						<div class="ibox-content">
							<div id="jstree1">
	                            <ul>
	                            	<c:forEach items="${list }" var="m">
				    					<c:if test="${m.level eq 1 }">
				    						<li class="jstree-close" id="${m.id }">${m.name }
				    							<ul>
				    								<c:forEach items="${m.children }" var="subMenu">
				    								<li id="${subMenu.id }">${subMenu.name }</li>
				    								</c:forEach>
				    							</ul>
				    						</li>
				    					</c:if>
				    				</c:forEach>	
	                            </ul>
							</div>
						</div>     
					</div>
			</div>
			<div class="col-sm-8">
	                <div class="ibox float-e-margins">
						<div class="ibox-content">
	                        <div class="" id="content">
	                        </div>			
						</div>     
					</div>
			</div>
            
        </div>
    </div>

<%@include file="/common/foot.jsp" %>
<style>
.jstree-open>.jstree-anchor>.fa-folder:before {
	content: "\f07c"
}

.jstree-default .jstree-icon.none {
	width: 0
}
</style>
	<script>
	$(document).ready(function() {
	    $("#jstree1").jstree({
	        "core": {
	            "check_callback": true
	        }
	    }).bind('select_node.jstree', function(e, data) {
	    	var id = data.node.id;
	    	$('#content').load('${ctx}/admin/menu/detail?id=' + id);
	    });
	});
    </script>

	<script>
function add() {
	$('#content').load('${ctx}/admin/menu/detail');
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
	    content: "${ctx}/admin/menu/detail?id=" + id,
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
			url: "${ctx}/admin/menu/delete",
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