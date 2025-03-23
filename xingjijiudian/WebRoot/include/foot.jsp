<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path_foot = request.getContextPath();
%>

  <div id="footer" style="margin:auto;">
    <div id="copyright">
      <div style="float:left; padding:3px;"><a href="http://www.865171.cn"><img src="<%=path_foot %>/index/images/footer_logo.gif" width="42" height="35" alt="" title="865171" border="0" /></a></div>
      <div style="float:left; padding:14px 10px 10px 10px;"> Company name.&copy; All Rights Reserved 2016 - </div>
    </div>
    <ul class="footer_menu">
      <li><a href="welcome.jsp" class="nav_footer">首页</a></li>
      <li><a href="getAllGoodsList.do" class="nav_footer">酒店信息 </a></li>
      <li><a href="getAllWord.do" class="nav_footer"> 留言板 </a></li>
      <li><a href="<%=path_foot %>/center.jsp" class="nav_footer"> 个人中心</a></li>
      <li><a href="<%=path_foot %>/admin/login.jsp" target="_blank" class="nav_footer"> 管理登陆</a></li>
    </ul>
  </div>


