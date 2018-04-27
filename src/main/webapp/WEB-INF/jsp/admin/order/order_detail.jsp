<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@include file="/common/head.jsp" %>
  <link rel="stylesheet" href="${ctx }/res/chosen_v1/docsupport/style.css">
  <link rel="stylesheet" href="${ctx }/res/chosen_v1/docsupport/prism.css">
  <link rel="stylesheet" href="${ctx }/res/chosen_v1/chosen.css">
<c:set var="module" value="order"/>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
		<table id="table" data-toggle="table" data-height="400" data-click-to-select="true" data-mobile-responsive="true">
                                    <thead>
                                        <tr>
                                            <th data-field="customer">菜品名称</th>
                                            <th data-field="orderNo">数量</th>
                                        </tr>
                                    </thead>
							<tbody>
								<c:forEach items="${orderItem }" var="n" varStatus="idx">
								<tr data-index="${idx.index }">
									<td style="">${n.dish.name}</td>
									<td style="">${n.num}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
	</div>

<%@include file="/common/foot.jsp" %>
<script src="${ctx }/res/chosen_v1/chosen.jquery.js" type="text/javascript"></script>
<script src="${ctx }/res/chosen_v1/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
<script src="${ctx }/res/chosen_v1/docsupport/init.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
