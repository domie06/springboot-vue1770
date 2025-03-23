<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();

	session.removeAttribute("user");
	response.sendRedirect(path+"/index.jsp");
%>
