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
  <%
  	Object ob = (Object)request.getAttribute("gs");
  	Goods gs = (Goods)ob;
  
  %>
  <div id="main_content">
    <div id="admin_header">
      <div class="admin_details_title">详细信息</div>
    </div>
    <div id="admin_header_border"></div>
    <div class="add_tab">
      <div class="form_contact" style="width: 300px;">
        <div class="adminform_row_contact">
          <label class="adminleft">标题： </label>
          <label class="adminright"><%=gs.getTitle() %></label>
        </div>
        <div class="adminform_row_contact">
          <label class="adminleft">价格: </label>
          <label class="adminright"><%=gs.getPrice() %> 元</label>
        </div>
         <div class="adminform_row_contact">
          <label class="adminleft">壶型: </label>
          <label class="adminright"><%=gs.getHuxing() %></label>
        </div>
         <div class="adminform_row_contact">
          <label class="adminleft">泥料: </label>
          <label class="adminright"><%=gs.getType() %></label>
        </div>
          <div class="adminform_row_contact">
          <label class="adminleft">容量: </label>
          <label class="adminright"><%=gs.getSize() %></label>
        </div>
         <div class="adminform_row_contact">
          <label class="adminleft">上架时间: </label>
          <label class="adminright"><%=gs.getSavetime() %> </label>
        </div>
        <div class="adminform_row_contact">
        <label class="adminleft">详细描述: </label>
        <label class="adminright">
        <%=gs.getContent() %>
        </div>
        <div class="adminform_row_contact">
          <label class="adminleft">数量: </label>
          <label class="adminright"> <input type="text" style="float: left;width: 70px;"  name="num" id="num" value="1"   /></label>
        </div>
        <div style="float:right; padding:10px 25px 0 0;">
        		
          <div class="right_button"><a href="javascript:void(0)" onclick="addSelectCar('<%=gs.getId() %>')">加入购物车</a></div>
       		<script type="text/javascript">
       		function addSelectCar(goodsId){
           	var num = document.getElementById("num").value;	
			window.location.href="addSelectCar.do?goodsId="+goodsId+"&num="+num;


       		}
       		
       		</script>
        </div>
      </div>
      <div class="details_tab" style="width: 200px;"> <strong>图片:</strong><br />
        <br />
        <img src="<%=path+"/upload/"+gs.getUrl() %>" width="520" height="400" /><br />
    </div>
    <div class="admin_footer_help">请警惕诈骗电话，防止上当受骗。 </div>
  </div>

    
    
    <%@include file="include/foot.jsp" %>
  </div>
  <!-- end of main_content -->
  
</div>
<!-- end of main_container -->
</body>
</html>

