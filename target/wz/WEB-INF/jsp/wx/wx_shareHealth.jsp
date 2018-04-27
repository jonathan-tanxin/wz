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
	<title>会员中心-分享健康指标</title>
	<!-- CSS -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/appbase.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>

<main id="mian" class=" pb100">

<div class="fx mb30 bacWhite  fxFd-c f24 ">
<section class="p30 fx bbt fxAi-c">
<span class="w200 mr50">指标采集时间</span><form class="fonGray"><input placeholder="请输入" type="text" class="f28 p10 lh32 bbt"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w200 mr50">血常规</span><form class="fonGray"><input placeholder="请输入" type="text" class="f28 p10 lh32 bbt"></form>
</section>
<section class="p30 fx bbt fxAi-c">
<span class="w200 mr50">血常规</span><form class="fonGray"><input placeholder="请输入" type="text" class=" f28 p10 lh32 bbt"></form>
</section>
</div>
<div class="fx fxAi-c fxJc-c">
<button class="p30 f32 w800 bt-no bacls">专家指导</button>
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