<%@ page language="java" import="java.util.*,model.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String appName="星级酒店管理系统";
session.setAttribute("appName",appName);

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>${appName }</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/index/style.css" />
</head>
<%
	String message = (String)request.getAttribute("message");
	if(message!=null&&!"".equals(message)){
		out.print("<script>alert('"+message+"');</script>"); 
	}
%>
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
	window.location.href="<%=path%>/reg.jsp";
	}
</script>
<body>
<div id="main_container" style="width: 100%">
  <%@include file="include/head.jsp" %>
  <div id="main_content">
    <div class="column1">
      <div class="left_box">
        <div class="top_left_box"> </div>
        <div class="center_left_box">
        
        <%
        User u = (User)session.getAttribute("user");
    	if(u == null || "".equals(u)){
        %>
          <div class="box_title"><span>登陆</span> 您的账号:</div>
          <div class="form">
          	<form action="login.do" id="loginform" onsubmit="return checks()">
            <div class="form_row">
              <label class="left">账号: </label>
              <input type="text" name="id"  id= "id" value="1001" class="form_input"/>
            </div>
            <div class="form_row">
              <label class="left">密码: </label>
              <input type="password" name="mima" value="000000" id="mima" class="form_input"/>
            </div>
           
            <div style="float:right; padding:10px 25px 0 0;">
               <input type="button"   style="padding:13px 25px 0 0; width:68px; height:27px;  border:0; background:url(<%=path %>/index/images/join.gif) no-repeat left top;"  onclick="regits()"/>
               <input type="image" style="" src="<%=path %>/index/images/login.gif"  />
            </div>
            </form>
          </div>
          <%
          	}else{
    	   %>
    	   <div style="height: 70px;vertical-align: middle;" align="center">${user.name }，您好！<br><a href="<%=path %>/center.jsp">进入个人中心</a>,<a href="logout.do">注销</a></div>
          <%
          	}
          %>
          
        </div>
        <div class="bottom_left_box"> </div>
      </div>
      
     
      
    </div>
    <!-- start of column four -->
    <div class="column4">
      <div class="title">酒店信息</div>
      <%
      List list=(List)request.getAttribute("getAllGoods");
      int is = 0;
      if(list==null||list.size()<1){
    	  response.sendRedirect("getAllGoods.do");
      }
	  for(Object ob : list){
		  is ++;
		  if(is<10){
		  Goods gs = (Goods)ob;
      %>
      <div class="offer_box_wide"> <a href="getAllGoodsDetial.do?id=<%=gs.getId() %>"><img src="<%=path+"/upload/"+gs.getUrl() %>" width="130" height="98" class="img_left" alt="" title="865171" border="0"/></a>
        <div class="offer_info"> <span><%=gs.getTitle() %>  <%=gs.getPrice() %> ￥</span>
          <p class="offer"><b><%=gs.getType() %></b> <%=gs.getContent().length()>50?gs.getContent().substring(0,50)+"...":gs.getContent() %> </p>
          <div class="more"><a href="getAllGoodsDetial.do?id=<%=gs.getId() %>">...more</a></div>
        </div>
      </div>
      <%
      }}
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

