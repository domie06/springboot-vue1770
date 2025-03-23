<%@ page language="java" import="java.util.*,java.sql.*,model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	User u = (User)session.getAttribute("user");
	if(u == null || "".equals(u)){
		out.print("<script>alert('请登录!');window.open("+path+"/index.jsp');</script>"); 
	}
%>
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>${appName }</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/index/style.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/index/admin.css" />
<script language="JavaScript" src="<%=path%>/portal/js/jquery.js"></script>
<script type="text/javascript">
	function checks(){
		var old = document.getElementById("old").value;
		var oldmima = document.getElementById("oldmima").value;
		var mima1 = document.getElementById("mima1").value;
		var mima2 = document.getElementById("mima2").value;
		if(old!=oldmima){
			alert("旧密码不对！");
			return false;
		}
		if(mima1!=mima2){
			alert("两次密码输入不一样！");
			return false;
		}
	}
</script>
</head>
<body>
<div id="main_container">
  <%@include file="/include/head.jsp" %>
  
  
  <div class="column4">
     <div id="main_content">
    <div id="admin_header">
      <div class="admin_editoffer_title">修改密码</div>
    </div>
    <div id="admin_header_border"></div>
    <div class="add_tab">
    <form action="<%=path %>/modify_post.jsp" method="post" onsubmit="return checks()">
      <div class="form_contact">
        <div class="adminform_row_contact">
          <label class="adminleft">旧密码: </label>
          <input type="hidden"  id ="old" name="old" class="form_input_contact" value="${user.mima }"/>
          <input type="password"  id ="oldmima" name="oldmima"class="form_input_contact"  />
        </div>
        <div class="adminform_row_contact">
          <label class="adminleft">新密码: </label>
          <input type="password" id ="mima1" name="mima1" class="form_input_contact"  />
        </div>
        <div class="adminform_row_contact">
          <label class="adminleft">再次输入: </label>
          <input type="password"  id ="mima2" name="mima2"class="form_input_contact" value=""/>
        </div>
        <div style="float:right; padding:10px 25px 0 0;">
        	<input type="submit" class="right_button" value="修改">
        </div>
      </div>
      </form>
    </div>
    <div class="admin_footer_help"> 请牢记您的密码，不要泄露或者共享给他人！ </div>
  </div>


    </div>
  	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <!-- end of main_content -->
  <%@include file="/include/foot.jsp" %>
</div>
<!-- end of main_container -->
</body>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('even');
	</script>
</html>

