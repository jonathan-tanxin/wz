<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:set var="module" value="menu"/>

    <div class="wrapper wrapper-content animated fadeInRight">
		<form action="${ctx }/admin/menu/save?id=${n.id }" id="detail-form" class="form-horizontal" method="post">
			<div class="form-group">
                 <label class="col-sm-2 control-label">名称</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="name" value="${n.name }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">链接</label>
                 <div class="col-sm-10">
                 	<input type="text" class="form-control" name="href" value="${n.href }">
                 </div>
             </div>	
			<div class="form-group">
                 <label class="col-sm-2 control-label">上级菜单</label>
                 <div class="col-sm-10">
                 	<select name="parent.id" class="form-control">
	                 	<option value=""></option>
	                 	<c:forEach items="${parents }" var="p">
	                 	<option value="${p.id }" ${p.id eq n.parent.id ? 'selected' : '' }>${p.name }</option>
	                 	</c:forEach>
                 	</select>
                 </div>
             </div>	
			
			<div class="form-group">
                 <label class="col-sm-2 control-label">顺序</label>
                 <div class="col-sm-10">
                 	<input type="number" class="form-control" name="seq" value="${n.seq }">
                 	<span class="help-block m-b-none">顺序越小排在越前面</span>
                 </div>
             </div>	
 			<div class="form-group">
                  <label class="col-sm-2 control-label">是否显示</label>
                  <div class="col-sm-10">
                  	<select name="show"  class="form-control" id="">
                  		<option value="1" ${n.show ? 'selected' : '' }>是</option>
                  		<option value="0" ${n.show ? '' : 'selected' }>否</option>
                  	</select>
                  </div> 
              </div>	 
             
             <div class="form-group">
                 <label class="col-sm-2 control-label">权限</label>
                 <div class="col-sm-10">
                 	<input type="hidden" id="authority-id" name="authority.id" value="${n.authority.id }" class="form-control">
                 	<input type="text"  placeholder="品牌" class="form-control" id="authority-name" name="authority.name" value="${n.authority.name }" 
                 		onclick="bring({
						                 	url:'${ctx}/admin/authority/list',
						                 	name: 'name',
						                 	idInput: 'authority-id',
						                 	nameInput: 'authority-name'
						                 	})" />
                 </div>
             </div>	
             
             <div class="form-group">
                 <label class="col-sm-2 control-label"></label>
                 <div class="col-sm-10" style="text-align: center;">
					<input type="text" class=" btn btn-primary" value="保存" onclick="save()"/>
                 </div>
             </div>	
        	
		</form>
</div>
<script>
	function save() {
		$('#detail-form').ajaxSubmit({
    		success: function(data) {
    			if (isSuccess(data)) {
    				// reload();
    			} else {
    			}
    		}
    	});
	}
</script>
