<%@ page language="java" import="java.util.*,java.sql.*,model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<% 
	User u = (User)session.getAttribute("user");
%>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
	 <%
	 String mima=request.getParameter("newmima1");
	 String sql="update users set mima='"+mima+"'  where id= '"+u.getId()+"'";
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('密码修改成功!!');window.history.go(-1);</script>");
%>
