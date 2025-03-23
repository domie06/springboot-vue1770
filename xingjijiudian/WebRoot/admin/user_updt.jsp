<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<script type="text/javascript" src="<%=path%>/portal/js/popup.js"></script>
	<script type="text/javascript">
	 function up(tt)
	    {
	        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:300,height:50});
         pop.setContent("contentUrl","<%=path%>/admin/upload.jsp?Result="+tt);
         pop.setContent("title","文件上传");
         pop.build();
         pop.show();
	    }
	 function checks(){
			var password = document.getElementById("mima").value;
			var name = document.getElementById("name").value;
			var tel = document.getElementById("tel").value;
			if(password==""||password==null){
				alert("请输入密码！");
				return false;
			}
			if(name==""||name==null){
				alert("请输入姓名！");
				return false;
			}
			if(tel==""||tel==null){
				alert("请输入电话号码！");
				return false;
			}
			return true;
		}
	  
	  
	</script>
  </head>
  
  <body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:void(0)">信息列表</a></li>
    <li><a href="javascript:void(0)">修改信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    
    
    
  	<div id="tab2" class="tabson">
 <%
  	User u = (User)request.getAttribute("user");
   %>
 	<div class="formtitle"><span>基本信息</span></div>
 	
 		<form name="form1" id="form1" method="post" action="<%=path %>/admin/UserForUpdate.do" onsubmit="return checks();">
 		  <ul class="forminfo">
  		  <li><label>姓名</label><input name="name" value=<%=u.getName() %> type="text" class="dfinput" /><i>请输入姓名</i></li>
    <li><label>手机号</label><input name="tel" type="text" value=<%=u.getTel() %> class="dfinput" /><i>请输入姓名</i></li>
    <li><label>登陆账号</label><input name="id"  type="text"value=<%=u.getId() %> class="dfinput"  readonly="readonly"/><i>请输入账号</i></li>
    <li><label>登陆密码</label><input name="mima" id="mima"type="text" value=<%=u.getMima() %> class="dfinput"  /><i>请输入密码</i></li>
    <li><label>&nbsp;</label><input  type="submit" class="btn" value="确认修改"/></li>
  	     </ul>
 		</form>
    </div>  
       
	</div> 
    
    
    
    
    
    </div>


   
   
  </body>
</html>
