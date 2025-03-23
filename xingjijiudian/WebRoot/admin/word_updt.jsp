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
			var title = document.getElementById("title").value;
			var price = document.getElementById("price").value;
			var content = document.getElementById("content").value;
			if(title==""||title==null){
				alert("请输入标题！");
				return false;
			}
			if(price==""||price==null){
				alert("请输入价格！");
				return false;
			}
			if(content==""||content==null){
				alert("请输入描述！");
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
 	<div class="formtitle"><span>基本信息</span></div>
 	
 		<form name="form1" id="form1" method="post" action="<%=path %>/admin/word_updt_post.jsp?id=<%=request.getParameter("id") %>"  >
 		 <ul class="forminfo">
  		  <li><label>回复</label><textarea  style="margin-left: 0px;margin-bottom: 10px;width: 350px;height: 150px;" name='huifu' cols='100' rows='10' id='content'></textarea><i>回复</i></li>
    	  <li><label>&nbsp;</label><input  type="submit" class="btn" value="修改"/></li>
  	     </ul>
 		</form>
    </div>  
       
	</div> 
    
    
    
    
    
    </div>


   
   
  </body>
</html>
