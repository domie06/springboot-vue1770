<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
		String path = request.getContextPath();
	%>
<%@page import="java.util.*"%> 
<%@page import="java.sql.*"%>  
<%@page import="model.*"%>
<%
request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8"); 
%>
<%	
       		
       %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${appName }</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/index/style.css" />
  	 <link rel="stylesheet" href="<%=path %>/portal/css/order.css" />
  	 <link rel="stylesheet" href="<%=path%>/portal/css/hospital.css" />
  	 <link rel="stylesheet" href="<%=path%>/portal/css/my-order-detail.css" />
    <style type="text/css">
        div[id="bdyx_float_rb"] {
            display: none !important;
        }
    </style>
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
		 
	</script>
    <script type="text/javascript">
    	function addzan(id){

		window.location.href="<%=path%>/stu/sug_zan_post.jsp?id="+id;


    	}


        	              	
    
    </script>
</head>

<body>	
	<%@include file="include/head.jsp" %>
		<br>
    <div class="wrap" style="width: 930px;">
        
        
        
        
        
        
        
        <!-- word start -->
        <div class="container" style="width: 930px;" align="center">
            <p class="doctor-title" style="font-weight: bold">留言板</p>
            <div class="order-info" >
    <div class="info-content">
      <%
      
      List list=(List)request.getAttribute("wordList");
      for(Object ob : list){
    	  Word w = (Word)ob;
      %> 
      <table class="doctor-info" style="width: 930px;">
      <tbody>
       <tr>
        <td class="col-content"style="width: 90%;" align="left"><div><%=w.getContent() %><span style="font-size: 12px;color: gray;">(<%=w.getName()+":"+w.getTimes() %>)</span></div><img src="<%=path+"/upload/"+w.getUrls() %>"  >  
        	回复（<%=w.getHuifu()==null?"无":w.getHuifu() %>）
        </td>
       </tr>
       	</tbody>
     </table>
       	<%
       }
       %>
     
    </div>
   </div>
  </div>
        
         <!-- word end -->
        <script type="text/javascript" src="<%=path %>/portal/editor/kindeditor.js"></script>
        <script type="text/javascript">
    KE.show({
        id : 'content',
        cssPath : './index.css'
    });
  </script>
  
        <div class="container" style="width: 930px;margin-top: -120px;">
        <form name="form1" id="form1" method="post" action="addWord.do" >
 		 <ul class="forminfo">
    	   <li><label style="color: red;"><b>在下方输入内容：</b></label><textarea id="content" name="content" style="width:100%;height:250px;visibility:hidden;"></textarea></li>
    	 	<li><label>图片</label><input name="urls" id="urls"type="text"   class="dfinput" /> 
  		  						&nbsp;<input type='button' value='上传' onClick="up('urls')"/></li>
  		  <li><input name="" type="submit" class="scbtn" value="提交"/></li>
  	     </ul>
 		</form>
 		</div>
        <br>
        
    </div>
    
    <%@include file="include/foot.jsp" %>
</body>

</html>



