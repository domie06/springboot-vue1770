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
	
</script>
</head>
<body>
<div id="main_container">
  <%@include file="/include/head.jsp" %>
  
  
  <div class="column4">
      <div class="title" style="float:left;">
        <div style="float:left;">个人中心</div>
      </div>
      <div class="offer_box_wide"> <a href="getMyOrders.do"><img src="<%=path%>/index/images/car2.jpg" width="100" height="100" class="img_left" alt="" title="865171" border="0"/></a>
        <div class="offer_info"> <span>我的订单</span>
          <p class="offer"> 查看订单信息</p>
          <div class="more"><a href="getMyOrders.do">进入</a></div>
        </div>
      </div>
      <div class="offer_box_wide"> <a href="details.htm"><img src="<%=path%>/index/images/info.jpg" width="130" height="98" class="img_left" alt="" title="865171" border="0"/></a>
        <div class="offer_info"> <span>修改密码</span>
          <p class="offer">修改您的个人密码 </p>
          <div class="more"><a href="<%=path %>/modify.jsp">进入</a></div>
        </div>
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

