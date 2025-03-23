<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.*"%>   
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${appName }-注册</title>
<link href="<%=path %>/portal/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/index/style.css" />
<script language="JavaScript" src="<%=path %>/portal/js/jquery.js"></script>
<script src="<%=path %>/portal/js/cloud.js" type="text/javascript"></script>
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
			var address = document.getElementById("address").value;
			if(address==""||address==null){
				alert("请输入地址！");
				return false;
			}
			return true;
		}
	  
	</script>
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  


</script> 

</head>

<body align="center">
<%@include file="include/head.jsp" %>

   <div id="main_content" >
    <div class="formbody"  >
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="addOrders.do" method="post" onsubmit="return checks()" >
    <ul class="forminfo">
    <li><label>电话号码</label><input name="address" type="text" class="dfinput" />
    <input name="price" type="hidden" value="<%=request.getParameter("price") %>" class="dfinput" />
    <i>请输入电话号码(总金额：<%=request.getParameter("price") %>)</i></li>
    <li><label>&nbsp;</label><input  type="submit" class="btn" value="下一步"  />&nbsp;&nbsp;
    </li>
    </ul>
    </form>
    
    </div>
</div>
    
    <%@include file="include/foot.jsp" %>
</body>
</html>