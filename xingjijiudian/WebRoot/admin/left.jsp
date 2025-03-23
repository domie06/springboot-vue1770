<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path%>/portal/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path%>/portal/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/portal/editor/kindeditor.js"></script>


<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>功能列表</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="<%=path%>/portal/images/leftico01.png" /></span>用户信息
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="getAllUserForAdmin.do" target="main">用户信息</a><i></i></li>
        </ul>    
    </dd>
    
    <dd>
    <div class="title">
    <span><img src="<%=path%>/portal/images/leftico01.png" /></span>酒店信息
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="getAllGoodsForAdmin.do" target="main">酒店信息</a><i></i></li>
        </ul>    
    </dd>  
    
    <dd>
    <div class="title">
    <span><img src="<%=path%>/portal/images/leftico01.png" /></span>订单信息
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="getAllOrdersForAdmin.do" target="main">订单信息</a><i></i></li>
        </ul>    
    </dd>
    
      <dd>
    <div class="title">
    <span><img src="<%=path%>/portal/images/leftico01.png" /></span>留言
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="<%=path %>/getAllWordForAdmin.do" target="main">留言</a><i></i></li>
        </ul>    
    </dd>
    
     <dd>
    <div class="title">
    <span><img src="<%=path%>/portal/images/leftico01.png" /></span>修改密码
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="<%=path%>/admin/pwd.jsp" target="main">修改密码</a><i></i></li>
        </ul>    
    </dd>  
    
    
    </dl>
</body>
</html>
