<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>   
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${appName }-注册</title>
<link href="<%=path %>/portal/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/index/style.css" />
<script language="JavaScript" src="<%=path %>/portal/js/jquery.js"></script>
<script src="<%=path %>/portal/js/cloud.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/portal/js/popup.js"></script>
 <script type="text/javascript">
	    function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
            pop.setContent("contentUrl","<%=path%>/admin/upload.jsp?Result="+tt);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
	    }
	    function checks(){
			var password = document.getElementById("mima").value;
			var password1 = document.getElementById("mima1").value;
			var name = document.getElementById("name").value;
			var uid = document.getElementById("uid").value;
			var tel = document.getElementById("tel").value;
			if(password==""||password==null){
				alert("请输入密码！");
				return false;
			}
			if(password!=password1){
				alert("两次密码输入不一致！");
				return false;
			}	
			if(name==""||name==null){
				alert("请输入姓名！");
				return false;
			}
			if(uid==""||uid==null){
				alert("请输入账号！");
				return false;
			}
			if(tel==""||tel==null){
				alert("请输入电话号码！");
				return false;
			}
			return true;
		}
	  
	</script>
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  


</script> 

</head>

<body align="center">
<%@include file="include/head.jsp" %>

   <div id="main_content" >
    <div class="formbody"  >
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="addUser.do" method="post" onsubmit="return checks()" >
    <ul class="forminfo">
    <li><label>姓名</label><input name="name" type="text" class="dfinput" /><i>请输入姓名</i></li>
    <li><label>手机号</label><input name="tel" type="text" class="dfinput" /><i>请输入手机号</i></li>
    <li><label>登陆账号</label><input name="id"  type="text" class="dfinput" /><i>请输入账号</i></li>
    <li><label>登陆密码</label><input name="mima" id="mima"type="password" class="dfinput"  /><i>请输入密码</i></li>
    <li><label>再次输入密码</label><input style="margin:auto;" name="mima1" id="mima1" type="password" class="dfinput"  /><i>请再次输入</i></li>
    <li><label>&nbsp;</label><input  type="submit" class="btn" value="注册"  />&nbsp;&nbsp;
    	<input  type="reset" class="btn" value="重置"/>
    </li>
    </ul>
    </form>
    
    </div>
</div>
    
    <%@include file="include/foot.jsp" %>
</body>
</html>