<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="enum" uri="http://www.daxia.com/enum" %> 
<%@include file="wx_head.jsp" %>

<style>
	ul>li {
		margin: 20px;
		font-size: 20px;
	}
</style>
<body>
	菜单
	<ul>
		<li><a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx7fce7bda33e3c832&redirect_uri=http%3A%2F%2Fjklmnl.ngrok.cc%2Fwx%2FdishSelect&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect" target="_blank">会员点菜</a></li>
		<li><a href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx7fce7bda33e3c832&redirect_uri=http%3A%2F%2Fjklmnl.ngrok.cc%2Fwx%2FdishList&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect" target="_blank">菜品展示</a></li>
	</ul>
	会员健康
	<ul>
		<li><a href="${ctx }/wx/courseList" target="_blank">健康讲座</a></li>
		<li><a href="" target="_blank">会员健康</a></li>
	</ul>
	个人中心
	<ul>
		<li><a href="${ctx }/wx/memberCenter" target="_blank">会员中心</a></li>
		<li><a href="${ctx}/wx/distributionCenter" target="_blank">配送中心</a></li>
	</ul>
</body>
</html>