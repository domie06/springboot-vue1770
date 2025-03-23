<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	User doc = (User)session.getAttribute("user");
	if(doc == null || "".equals(doc)){
		out.print("<script>alert('请登录!');window.open("+path+"/admin/login.jsp','_parent');</script>"); 
	}
%>
<%@page import="java.util.*"%> 
<%@page import="java.text.SimpleDateFormat"%>  
<%@page import="model.*"%>
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'create.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=path%>/portal/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path%>/portal/js/jquery.js"></script>
 <style>


.gallery {
  width: 100px;
  height: 80px;
 /* background: #333; */
}

.gallery > div {
  position: relative;
  float: left;
}

.gallery > div > img {
  width: 100px;
  transition: .1s transform;
  transform: translateZ(0);
  /* hack */
}

.gallery > div:hover {
  z-index: 1;
}

.gallery > div:hover > img {
  transform: scale(3, 3);
  transition: .3s transform;
}

.cf:before, .cf:after {
  display: table;
  content: "";
  line-height: 0;
}

.cf:after {
  clear: both;
}

h1 {
  margin: 40px 0;
  font-size: 24px;
  text-align: center;
  text-transform: uppercase;
}

footer {
  margin: 80px 0;
  text-align: center;
}

</style>
<script type="text/javascript">


function big(ob){
	var imgcenter = document.getElementById("imgcenter");
	imgcenter.style.display="block";
	imgcenter.innerHTML="<img src='"+ob+"' style=\"width: 450px;height: 300px;\">";
}
	function smg(ob){
		var imgcenter = document.getElementById("imgcenter");
		imgcenter.style.display="none";
	}	

</script> 
  </head>
  <body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">信息管理</a></li>
    <li><a href="#">信息列表</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    
    
    
  	<div id="tab2" class="tabson">
  	
   
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>编号</th>
        <th>收货人</th>
         <th>地址</th>
          <th>总价</th>
          <th>下单时间</th>
          <th>状态</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
	<%	
	List list=(List)request.getAttribute("ordersList");
    int is = 0;
    for(Object ob : list){
    	is++;
    	Orders  ors = (Orders)ob;
	 %>
 		<tr>
        <td><%=ors.getId()  %></td>
        <td><%=ors.getMuser().getName() %></td>
        <td><%=ors.getAddress()  %></td>
        <td><%=ors.getPrice() %></td>
        <td><%=ors.getSavetime() %></td>
        <td><%=ors.getState() %></td>
        
        <td>
        	<%if(("待预定").equals(ors.getState())){ %>
       		<a href="<%=path %>/admin/order_post.jsp?id=<%=ors.getId() %>" onClick="return confirm('确认预定？')">预定</a> 
       <%}} %>
       </td>
        </tr> 	
        </tbody>
    </table>
    <div id="tab22">
   
    	
    </div>
   
    <div class="pagin">
    	<div class="message" id="messages">以上数据共<%=list.size() %>条,<a style="cursor:hand" onClick="javascript:window.print();">打印本页</a></div>
    </div>
  
    
    </div>  
       
	</div> 
    
    
    
    
    
    </div>


   
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
  </body>
</html>
