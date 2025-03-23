<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'create.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=path %>/portal/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path %>/portal/js/jquery.js"></script>
<script type="text/javascript">
	function check(){
		var mima = document.getElementById("mima").value;
		var oldmima = document.getElementById("oldmima").value;
		var newmima1 = document.getElementById("newmima1").value;
		var newmima2 = document.getElementById("newmima2").value;
		if(newmima1==newmima2){
			if(oldmima == mima){
				return true;
			}else{
				alert("旧密码不对！");
				return false;
			}
		}else{
			alert("两次密码输入不一致");
			return false;
		}
	}

</script>
  </head>
  
  <body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">信息修改</a></li>
    <li><a href="#">修改密码</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    
    
    
  	<div id="tab2" class="tabson">
 	<div class="formtitle"><span>修改信息</span></div>
 	
 		<form name="form1" id="form1" method="post" action="<%=path %>/admin/pwd_post.jsp">
 		 <ul class="forminfo">
  		  <li><label>旧密码</label><input name="oldmima" type="password"  id="oldmima" class="dfinput" /><input type="hidden" id="mima" value="${user.mima}" ><i>输入旧密码</i></li>
 		  <li><label>新密码</label><input name="newmima1" type="password"   id="newmima1"  class="dfinput" /><i>输入新密码</i></li>
 		  <li><label>再次输入新密码</label><input  name="newmima2" type="password" id="newmima2"   class="dfinput"  /><i>再次输入新密码</i></li>
  		  <li><label>&nbsp;</label><input  type="submit" class="btn" value="确认修改" onclick="return check();"/></li>
  	     </ul>
 		</form>
   
  
    
    </div>  
       
	</div> 
    
    
    
    
    
    </div>


   
   
  </body>
</html>
