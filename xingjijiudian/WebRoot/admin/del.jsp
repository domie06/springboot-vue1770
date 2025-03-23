<%@ page language="java"  pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
    

  </head>
  
  <body>
  <%

String id=request.getParameter("id");
String tablename=request.getParameter("tablename");
if(!"jl".equals(tablename)){
	String sql="delete from "+tablename+" where id='"+id+"'";
	  	
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('删除成功!!');location.href='"+request.getHeader("Referer")+"';</script>");
}else{
	String sql="update  jl set statu='1' where id='"+id+"'";
  	
	connDbBean.executeUpdate(sql);
	out.print("<script>alert('更新成功!!');location.href='"+request.getHeader("Referer")+"';</script>");
}

  	  


 %>
  </body>
</html>

