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

<main id="mian" class="p15 pb100">
	<div class="fx mb20 bacWhite p10">
		<i class="w90 mr10 h100" style="background:url(${customer.headImage}) no-repeat; background-size:cover;"></i>
		<div class="fxFl1">
			<span>${customer.nickName }</span>
			<ul class="">
	            <li>
					<div id="chart" style="width: 100%; height:200px;">
						
					</div>
	            </li>
	            <c:forEach items="${chartDTO.comments }" var="co">
	            <li class="f20 fx fxJc-sb"><span ><fmt:formatDate value="${co.createTime }" pattern="yyyy-MM-dd"/></span>
	            </li>
	            <li class="f20 fx bt p10 bacG1"><span class="foncls mr10">${co.expertCustomer.nickName }：</span><span>${co.content }</span></li>
	            </c:forEach>
			</ul>
		</div>
		
	</div>
		<div class="fx fxAi-c fxJc-c mb20">
			<button class="p30 f32 w800 bt-no bacls" onclick="location='${ctx}/wx/newHealth'">发布新指标</button>
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


<%@include file="wx_foot.jsp" %>
<script src="${ctx }/js/echarts.min.js"></script>

<script>
var myChart = echarts.init(document.getElementById('chart'));
// 指定图表的配置项和数据
option = {
	    title: {
	        text: ''
	    },
	    tooltip : {
	        trigger: 'axis',
	        axisPointer: {
	            type: 'cross',
	            label: {
	                backgroundColor: '#6a7985'
	            }
	        }
	    },
	    legend: {
	    	data:['糖化血红蛋白','血常规', '舒张压', '收缩压'],
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : false,
	            data : [${chartDTO.days}],
	            axisLabel: {  
	            	   interval:0,  
	            	   rotate:20  
	            	} ,
	            	grid: {  
	            		left: '10%',  
	            		bottom:'55%'  
	            		}	
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : [
	        {
	            name:'糖化血红蛋白',
	            type:'line',
	            stack: '总量',
	            areaStyle: {normal: {}},
	            data:[${chartDTO.xhdbArr}]
	        },
	        {
	            name:'血常规',
	            type:'line',
	            stack: '总量',
	            areaStyle: {normal: {}},
	            data:[${chartDTO.xzgArr}]
	        },
	        {
	            name:'舒张压',
	            type:'line',
	            stack: '总量',
	            areaStyle: {normal: {}},
	            data:[${chartDTO.szyArr}]
	        },
	        {
	            name:'收缩压',
	            type:'line',
	            stack: '总量',
	            areaStyle: {normal: {}},
	            data:[${chartDTO.ssyArr}]
	        }
	    ]
	};

myChart.setOption(option);

</script>
