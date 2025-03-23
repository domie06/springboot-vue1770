<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String appName="星级酒店管理系统";
session.setAttribute("appName",appName);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${appName }</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=path%>/portal/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path%>/portal/js/jquery.js"></script>
<script src="<%=path%>/portal/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 
  </head>
  
 <body style="background-color:#1c77ac; background-image:url(<%=path%>/portal/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎使用${appName }</span>    
   <!--  <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>  -->   
    </div>
    
    <div class="loginbody">
    <span class="systemlogo"></span> 
       <div  style="position: absolute;left:630px;"><span style="font-size: 20px;font-weight: bold;color: #fff;">${appName }后台管理</span></div>
    <div class="loginbox">
    <form action="adminLogin.do" method="post">
    <ul>
    <li><input name="id" style="width:343px;" type="text" class="loginuser" value="admin" onclick="JavaScript:this.value=''"/></li>
    <li><input name="mima" style="width:343px;" type="password" class="loginpwd" value="admin" onclick="JavaScript:this.value=''"/></li>
    <li><input   type="submit" class="loginbtn" value="登录"  />
    </li>
   </ul>
    </form>
    
    </div>
    
    </div>
    
    
    
    <div class="loginbm">${appName }</div>
</body>
</html>
