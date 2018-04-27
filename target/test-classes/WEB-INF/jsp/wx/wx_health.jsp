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
	<c:forEach items="${charts }" var="c">
	<div class="fx mb20 bacWhite p10">
		<i class="w90 mr10 h100" style="background:url(${c.customer.headImage}) no-repeat; background-size:cover;"></i>
		<div class="fxFl1">
			<span>${c.customer.nickName }</span>
			<ul class="">
	            <li>
					<div id="chart${c.customer.id }" style="width: 100%; height:200px;">
						
					</div>
	            </li>
	            
	            <c:if test="${customer.isExpert }">
	            <i class="fa fa-commenting show-layer fr" data-show-layer="hw-layer" onclick="cid = ${c.customer.id}"></i>
	            </c:if>
	            <c:forEach items="${c.comments }" var="co">
	            <li class="f20 fx fxJc-sb"><span ><fmt:formatDate value="${co.createTime }" pattern="yyyy-MM-dd"/></span>
	            </li>
	            <li class="f20 fx bt p10 bacG1"><span class="foncls mr10">${co.expertCustomer.nickName }：</span><span>${co.content }</span></li>
	            </c:forEach>
			</ul>
		</div>
	</div>
	</c:forEach>
</main>


<div class="hw-overlay" id="hw-layer">
<div class="hw-layer-wrap">
<span class="fa fa-remove hwLayer-close"></span>
<div class="hw-overlayMain">
	   <div class="mb30">
	   <div class="f20 mb5 f24">请输入点评内容</div>
	   <ul>
	    <li class="fx fxJc-sb f18">
	    	<textarea name="" id="content" rows="5" style="width: 100%; border: 1px solid #ccc;"></textarea>
	    </li>

	   </ul>
	   </div>
	  
	   <div class="fx pt30 pb30">
	   <button id="tjddan" class="mar-au" onclick="save()">确认</button>
	   <button id="tjddan" class="mar-au hwLayer-cancel">取消</button>
	   </div>
</div>
</div>
</div>


<%@include file="wx_foot.jsp" %>
<script src="${ctx }/js/echarts.min.js"></script>

<script>
function save() {
	post("${ctx}/wx/saveHealthComment", {
			customerId: cid,
			comment: $('#content').val()
		}, function(data) {
		if (isSuccess(data)) {
			alert('点评成功')
			location="${ctx}/wx/health"
		}
	});
}
var cid;
<c:forEach items="${charts}" var="c">
var myChart${c.customer.id} = echarts.init(document.getElementById('chart${c.customer.id}'));
// 指定图表的配置项和数据
option${c.customer.id} = {
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
	            data : [${c.days}]
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
	            data:[${c.xhdbArr}]
	        },
	        {
	            name:'血常规',
	            type:'line',
	            stack: '总量',
	            areaStyle: {normal: {}},
	            data:[${c.xzgArr}]
	        },
	        {
	            name:'舒张压',
	            type:'line',
	            stack: '总量',
	            areaStyle: {normal: {}},
	            data:[${c.szyArr}]
	        },
	        {
	            name:'收缩压',
	            type:'line',
	            stack: '总量',
	            areaStyle: {normal: {}},
	            data:[${c.ssyArr}]
	        }
	    ]
	};

myChart${c.customer.id}.setOption(option${c.customer.id});
</c:forEach>

function fk() {
	alert('fk');
}
</script>
