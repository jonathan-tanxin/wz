<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="enum" uri="http://www.daxia.com/enum" %> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<title>会员健康</title>
	<!-- CSS -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/appbase.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>

<main id="mian" class="p15 pb100">
	<div class="fx mb20 bacWhite h100 p10">
		<i class="w90 mr10" style="background:url(imager/zp.jpg) no-repeat; background-size:cover;"></i>
		<ul class="fxFl1">
			<li class=""></li>
            <li class="f20 fx fxJc-sb"><span >2017-05-18</span><i class="fa fa-commenting"></i></li>
            <li class="f20 fx bt p10 bacG1"><span class="foncls mr10">装大夫：</span><span>保持这个状态</span></li>
		</ul>
	</div>
</main>


<div class="hw-overlay" id="hw-layer">
<div class="hw-layer-wrap">
<span class="fa fa-remove hwLayer-close"></span>
<div class="hw-overlayMain">
	   <div class="mb30">
	   <div class="f20 mb5 f24">提示</div>
	   <ul>
	    <li class="fx fxJc-sb f18">内容</li>

	   </ul>
	   </div>
	  
	   <div class="fx pt30 pb30">
	   <button id="tjddan" class="mar-au">确认</button>
	   <button id="tjddan" class="mar-au">取消</button>
	   </div>
</div>
</div>
</div>



<script src="js/jquery.min.js"></script>
<script src="js/hwLayer.js"></script>
</body>
</html>