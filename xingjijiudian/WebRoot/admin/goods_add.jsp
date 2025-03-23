<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<%@page import="java.util.*"%> 
<%@page import="java.text.SimpleDateFormat"%>  
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
    <li><a href="javascript:void(0)">新增记录</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    
    
    
  	<div id="tab2" class="tabson">
 	<div class="formtitle"><span>基本信息</span></div>
 		<form name="form1" id="form1" method="post" action="addGoodsForAdmin.do"onsubmit="return checks()" >
 		 <ul class="forminfo">
  		  <li><label>标题</label><input name="title" id="title" type="text"   class="dfinput" /><i>输入标题</i></li>
  		  <li><label>价格</label><input name="price" id="price" type="text"   class="dfinput" /><i>输入价格</i></li>
  		  <li><label>选择图片</label><input name='url' type='text' class="dfinput" id='url' size='50' value='' />&nbsp;<input type='button' value='上传' onClick="up('url')"/><i>选择图片文件</i></li>
  		  <li><label>星级<b>*</b></label><select name='huxing' id='huxing' class="dfinput" >
  		  									<option>一星级</option>
  		  									<option>二星级</option>
  		  									<option>三星级</option>
  		  									<option>四星级</option>
  		  									<option>五星级</option>
  		  									<option>其他</option></select><i>输入类型</i>
  		  </li>
  		  <li><label>类型<b>*</b></label><select name='type' id='type' class="dfinput" >
  		  									<option>单人房</option>
  		  									<option>豪华单人房</option>
  		  									<option>双人房</option>
  		  									<option>豪华双人房</option>
  		  									<option>总统套房</option>
  		  									<option>其他</option></select><i>输入类型</i>
  		  </li>
  		   <li><label>入住人数<b>*</b></label><select name='size' id='type' class="dfinput" >
  		  									<option>1</option>
  		  									<option>2</option>
  		  									<option>3</option>
  		  									<option>其他</option></select><i>输入类型</i>
  		  </li>
  		  <li><label>描述</label><textarea  style="margin-left: 0px;margin-bottom: 10px;width: 350px;height: 150px;" name='content' cols='100' rows='10' id='content'></textarea><i>描述</i></li>
    	  <li><label>&nbsp;</label><input  type="submit" class="btn" value="发布添加"/></li>
  	     </ul>
 		</form>
   
  
    
    </div>  
       
	</div> 
    
    
    
    
    
    </div>


   
   
  </body>
</html>
