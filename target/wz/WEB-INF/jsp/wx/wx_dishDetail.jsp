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

<main id="mian" class="pb100">
	<div class="fx mb20 bacWhite p10 fxFw-w">
	   <div class="photonews h80 w" style="background:url(${image}) no-repeat center; background-size:cover; "></div>
	   <div class="fx w bbt mb10 pt5 pb5 fxJc-sb  fxFd-c">
	   <section><span class="f20 lh52">${n.name }</span></section>
	   <section class="f14">￥<em class="tc-gules f32">${n.price }</em>/斤</section>
	   </div>
	   <div class="fx w bbt mb10 pt5 pb5 fxJc-sb fonGray ">
	   <section class="f18 lh52">运费：免运费</section>
	   <section class="f18 lh52">剩余：${n.stock }斤</section>
	   <section class="f18 lh52">销量：${n.totalSold }斤</section>
	   </div>
	   <ul class="f18 w">
	   	<li class="fx pt10 pb10">${n.dishDesc }</li>
	   </ul>
	</div>




</main>


<button id="xhlbet" class="pfix h80 f18 fx fxAi-c w fxJc-c f28 show-layer" onclick="location='${ctx}/wx/dishSelect'">会员点菜</button>
<!-- <button id="xhlbet" class="pfix h80 f18 fx fxAi-c w fxJc-c f28 show-layer"  data-show-layer="hw-layer" >会员点菜</button> -->

<div class="hw-overlay" id="hw-layer">
<div class="cpxqzf pfix w h300 bacWhite ">
<div class="hw-overlayMain">

	   <div class="f20 mb5 f24 p10 mb30">
	   	<li class="fx p5 bbt">
	   	<section><div class="photonews h80 " style="background:url(${ctx }/res/wx/imager/tx.jpg) no-repeat center; width:1.5rem; margin-top: -.8rem; background-size:cover; "></div></section>
	   	<section class="tl mb20 ml10">
	   	<p>南瓜藤</p>
	   	<p>￥<em class="tc-gules f32">254</em>/斤</p>
	   	</section>
	   	</li>
	   	<li class="fx fxJc-sb p10 bbt fxAi-c">
	   <section class="fx fxFd-c"><span>购买数量：</span><span></span></section>
	   	<section><i class="fa fa-plus-square-o mr10"></i><input class="w40 h40 tc f24 mr10" type="text" ><i class="fa fa-minus-square-o"></i></section>
	   	</li>
	   </div>
	  
	   <div class="fx pt30">
	   <span class="fxFl1 fx fxAi-c fxJc-r pr20 f24">合计：￥<em class="">254</em></span>
	   <button  class="f4053e w200 h80 bt-no f28">去付款</button>
	   </div>
</div>
</div>
</div>


<%@include file="wx_foot.jsp" %>

</body>
</html>