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
 <link href="<%=path%>/portal/css/style.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
.formtext{height:45px; padding-left:25px; line-height:20px; color:#848383;}
.formtext b{color:#d70101;}
/*form*/
.formbody{padding:10px 18px;}
.formtitle{border-bottom:solid 1px #d0dee5; line-height:35px; position:relative; height:35px; margin-bottom:28px;}
.formtitle span{font-weight:bold;font-size:14px; border-bottom:solid 3px #66c9f3;float:left; position:absolute; z-index:100; bottom:-1px; padding:0 3px; height:30px; line-height:30px;}
.forminfo{padding-left:23px;}
.forminfo li{margin-bottom:13px; clear:both;}
.forminfo li label{width:86px;line-height:34px; display:block; float:left;}
.forminfo li i{color:#7f7f7f; padding-left:20px; font-style:normal;}
.forminfo li cite{display:block; padding-top:10px;}
.dfinput{width:345px; height:32px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df; background:url(../images/inputbg.gif) repeat-x; text-indent:10px;}
.textinput{border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df; background:url(../images/inputbg.gif) repeat-x; padding:10px; width:504px; height:135px; line-height:20px; overflow:hidden;}
.btn{width:137px;height:35px; background:url(<%=path%>/portal/images/btnbg.png) no-repeat; font-size:14px;font-weight:bold;color:#fff; cursor:pointer;}
 
  </style>
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
      <div class="title" style="width: 930px;" align="center">我的订单</div>
      <br><br>
      <table class="tablelist" style="width: 1000px;">
    	<thead>
    	<tr>
    	<th>订单编号<i class="sort"><img src="<%=path %>/portal/images/px.gif" /></i></th>
    	<th>用户名</th>
        <th>价格</th>
        <th>电话号码</th>
        <th>保存时间</th>
        <th>订单状态</th>
        </tr>
        </thead>
        <tbody>
      <%
      List list=(List)request.getAttribute("ordersList");
	  for(Object ob : list){
		  Orders ors = (Orders)ob;
      %>
       <tr>
       		<td><%=ors.getId() %></td>
       		<td><%=ors.getMuser().getName() %></td>
       		<td><%=ors.getPrice() %></td>
       		<td><%=ors.getAddress() %></td>
       		<td><%=ors.getSavetime() %></td>
       		<td><%=ors.getState() %></td>
       		
       </tr>
      <%
      }
      %>
      </tbody>
     </table>
      
      <br>
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

