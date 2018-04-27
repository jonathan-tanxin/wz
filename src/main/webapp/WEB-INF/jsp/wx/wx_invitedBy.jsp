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

<%@include file="wx_foot.jsp" %>
<div style="text-align: center; font-size: 15px; margin-top: 20px;">
	<div>搜索微信号 <em>weizhongshengwu</em> 或识别下图二维码，关注玮中生物公众号</div>
	<img src="${ctx }/img/wz_qrcode.jpg" alt="" width="300"/>
</div>
</body>
</html>