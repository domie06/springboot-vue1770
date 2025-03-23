<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path_head = request.getContextPath();
%>
<div id="header">
    <div id="logo"> <a href="#"><span style="font-size: 12px;font-weight: bold;color: #fff;">${appName }</span></a> </div>
    <div class="banner_adds"></div>
    <div class="menu">
      <ul>
        <li><a href="welcome.jsp" style="width: 100px;">首页</a></li>
        <li><a href="getAllGoodsList.do" style="width: 100px;">酒店信息</a></li>
        <li><a href="getAllWord.do" style="width: 100px;">留言板</a></li>
        <li><a href="getMySelectCar.do" style="width: 100px;">购物车</a></li>
        <li><a href="<%=path_head %>/center.jsp">个人中心</a></li>
      </ul>
    </div>
  </div>

