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
						<div>
							<p>
		                    </p>
						</div>
						<table id="table" data-toggle="table" data-height="400" data-click-to-select="true" data-mobile-responsive="true">
                                    <thead>
                                        <tr>
                                            <th data-field="state" data-checkbox="true"></th>
                                            <th data-field="id">id</th>
                                            <th data-field="phase">期数</th>
                                            <th data-field="status">状态</th>
                                            <th data-field="amount">金额</th>
                                            <th data-field="operation">操作</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${phases }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td class="bs-checkbox">
										<input data-index="0" name="btSelectItem" type="checkbox">
									</td>
									<td style="">${n.id }</td>
									<td style="">${n.phase}</td>
									<td>${enum:list('ProfitPhaseStatus', n.status) }</td>
									<td style="">
									<fmt:formatNumber value="${n.profit.profitPerMonth}" type="currency" pattern="0.00"/>
									</td>
									<td>
										<c:if test="${n.status != 1 }">
										<a href="javascript:void(0);" onclick="pay('${n.id}')">手动返利</a>
										</c:if>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
                </div>
            </div>
        </div>
    </div>

<%@include file="/common/foot.jsp" %>
<script>
function pay(id) {
	layer.confirm('确认要手动返利吗?', {icon: 3, title:'提示'}, function(index){
		$.ajax({
			url: "${ctx}/admin/profit/pay?profitPhaseId=" + id,
			success: function(data) {
				if (isSuccess(data)) {
					location = '${ctx}/admin/profit/profitPhases?profitId=${profitId}';
				} else {
					location = '${ctx}/admin/profit/profitPhases?profitId=${profitId}';
				}
			}
		});
	});
	
}
</script>
</body>
</html>