<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="enum" uri="http://www.daxia.com/enum" %> 
<%@include file="wx_head.jsp"%>

<main id="mian" class="pb100 p15">
	<c:forEach items="${courseList }" var="c">
	<div class="fx mb20 bacWhite fxFw-w" onclick="location='${c.href}'">
	   <div class="photonews h80 w" style="background:url(${c.image}) no-repeat center; background-size:cover; ">
	   	<section>
	   	<p class="lh46 f28">${c.title }</p>
	   	<p class="lh30 f18 fx fxJc-sb pr5"><span>主持人：${c.host }</span><span><fmt:formatDate value="${c.date }" pattern="yyyy-MM-dd"/>  </span></p>
	   	</section>
	   </div>
	</div>
	</c:forEach>





</main>

</div>
</div>


<%@include file="wx_foot.jsp"%>

</body>
</html>