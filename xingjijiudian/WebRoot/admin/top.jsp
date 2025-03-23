<%@ page language="java" import="java.util.*,model.*,java.sql.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<% 
	Object obj = session.getAttribute("user");
	if(obj == null || "".equals(obj)){
		out.print("<script>alert('请登录!');window.open('"+path+"/admin/login.jsp','_parent');</script>"); 
	}
%>
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=path%>/portal/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path%>/portal/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
	});	
});	
</script>


</head>

<body style="background:url(<%=path%>/portal/images/topbg.gif) repeat-x;">

     <div class="topleft">
    <a href="#" target="_parent"><div  style="position: absolute;left:60px;top: 30px;"><span style="font-size: 20px;font-weight: bold;color: #fff;">${appName }后台管理</span></div></a>
    </div>
        
     
    <div class="topright">    
    <ul>
    <li>&nbsp;</li>
    <li><a href="#">关于</a></li>
    <li><a href="<%=path%>/admin/login.jsp" target="_parent">退出</a></li>
    <li>&nbsp;</li>
    </ul>
    <div class="user">
    <span>尊敬的管理员，您好！</span>
    </div>    
    
    </div>
</body>
</html>
