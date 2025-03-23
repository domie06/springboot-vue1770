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
	function checks(){
		var id = document.getElementById("id").value;
		var mima = document.getElementById("mima").value;
		if(id==null||""==id){
			alert("请输入账号！");
			return false;
		}	
		if(mima==null||""==mima){
			alert("请输入密码！");
			return false;
		}	
	}

	function regits(){
	window.location.href="<%=path%>/regit.html";
	}
</script>
<body>
<div id="main_container">
  <%@include file="include/head.jsp" %>
  <div id="main_content" >
    <!-- start of column four -->
    <div class="column4" >
      <div class="title" style="width: 930px;" align="center">购物车</div>
      <%
      List list=(List)request.getAttribute("selectCarList");
      int sum =0;
	  for(Object ob : list){
		  SelectCar sc = (SelectCar)ob;
		  sum += Integer.parseInt(sc.getNum())*Integer.parseInt(sc.getMgoods().getPrice());
      %>
       <div class="offer_box_wide_style1" style="width: 930px;"> <a href="getMyYueDetail.do?id=<%=sc.getId() %>"><img src="<%=path+"/upload/"+sc.getMgoods().getUrl() %>" width="130" height="98" class="img_left" alt="" title="865171" border="0"/></a>
        <div class="offer_info"> <span><%=sc.getMgoods().getTitle()+"     售价："+sc.getMgoods().getPrice() %></span>
          <p class="offer"> 数量<%=sc.getNum() %> </p>
          <div class="more"><a href="deleteSelectCar.do?scId=<%=sc.getId() %>">删除</a></div>
        </div>
      </div>
      <%
      }
      %>
      <br>
       <div class="right_button" style="float: right;" ><a href="order_address.jsp?price=<%=sum %>" >结算</a></div>
       <br><br>
    </div>
    <!-- end of column four -->
    <br><br>
    
    <%@include file="include/foot.jsp" %>
  </div>
  <!-- end of main_content -->
  
</div>
<!-- end of main_container -->
</body>
</html>

