<%@ page language="java" import="java.util.*,model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>${appName }</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/index/style.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/index/admin.css" />
</head>
<script type="text/javascript">

	function searchs(){
		var title = document.getElementById("search").value;
		window.location.href="getAllCarList.do?title="+title;
	}
</script>
<body>
<div id="main_container">
  <%@include file="include/head.jsp" %>
  <div id="admin_header">
      <div class="admin_index_title">酒店信息</div>
      <div class="right_buttons">
      </div>
    </div>
    <div id="admin_header_border"></div>
  
  <div id="main_content" >
    <!-- start of column four -->
    <div class="column4" >
      <div class="title" style="width: 930px;" align="center"></div>
      <%
      List list=(List)request.getAttribute("getAllGoods");
      int is = 0;
	  for(Object ob : list){
		  is ++;
		  Goods gs = (Goods)ob;
      %>
      
       <div class="offer_box_wide_style1" style="width: 930px;"> <a href="getAllGoodsDetial.do?id=<%=gs.getId() %>"><img src="<%=path+"/upload/"+gs.getUrl() %>" width="130" height="98" class="img_left" alt="" title="865171" border="0"/></a>
        <div class="offer_info"> <span><%=gs.getTitle()+"     售价："+gs.getPrice() %></span>
          <p class="offer"><b><%=gs.getType() %></b> <%=gs.getContent().length()>100?gs.getContent().substring(0,100)+"...":gs.getContent() %> </p>
          <div class="more"><a href="getAllGoodsDetial.do?id=<%=gs.getId() %>">...more</a></div>
        </div>
      </div>
      
      
      
      
      <%
      }
      %>
    </div>
    <!-- end of column four -->
    
    
    <%@include file="include/foot.jsp" %>
  </div>
  <!-- end of main_content -->
  
</div>
<!-- end of main_container -->
</body>
</html>

