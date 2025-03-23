<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
	User user = (User)session.getAttribute("user");
	if(user == null || "".equals(user)){
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
  	
     <form action="<%=path %>/admin/getAllGoodsForAdmin.do" method="post">
    <ul class="seachform">
    <li><label>标题</label>
    	<input name="title" class="dfinput" style="width: 200px;" ><input name="shenhe"type="hidden" value="1"   >
    </li>	
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
    <li style="float: right;"><label>&nbsp;</label><input  type="button" class="scbtn" style="width: 150px;" value="添加酒店" onclick="javascript:window.location.href='<%=path%>/admin/goods_add.jsp'"/></li>
    </ul>
    </form>
    <div id="imgcenter" style="position: absolute;top: 50%;left: 50%;display:none;margin-top: -100px;margin-left: -100px;"></div>
   
    <table class="imgtable">
    	<thead>
    	<tr>
        <th>价格<i class="sort"><img src="<%=path%>/portal/images/px.gif" /></i></th>
        <th>图片</th>
        <th>标题</th>
         <th>简介</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
	<%	
	List list=(List)request.getAttribute("list");
    int is = 0;
    for(Object ob : list){
    	is++;
    	Goods  gs = (Goods)ob;
	 %>
 		<tr>
 		<td><%=gs.getPrice()  %></td>
    	<td class="imgtd"><img src="<%=path+"/upload/"+gs.getUrl()%>"  onmouseover="big('<%=path+"/upload/"+gs.getUrl()%>')" onmouseout="smg()" style="width: 200px;height: 100px;" /></td>
        <td><%=gs.getTitle()  %></td>
        <td><%=gs.getContent().length()>20?gs.getContent().substring(0,20):gs.getContent() %></td>
        <td>
        <a href="<%=path %>/admin/getGoodsForIdForAdmin.do?id=<%=gs.getId()%>">修改</a> <a href="<%=path %>/admin/del.jsp?id=<%=gs.getId() %>&tablename=goods" onClick="return confirm('真的要删除？')">删除</a> 
        </td>
        </tr> 	
  	<%
  }
   %>
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
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
  </body>
</html>
