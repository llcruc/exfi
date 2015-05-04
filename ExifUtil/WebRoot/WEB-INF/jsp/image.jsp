<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图片Exif元数据抽取</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

  </head>
  
  <body>
    <div class="containt">
    	<form name="imageform" action="image.action" method="post" enctype="multipart/form-data">
    		<div class="form-group">
    			<label for="file">Email address</label>
    			<input type="text" class="form-control" id="file">
    			<input type="file" style="display: none" name="image"/>
    			<button type="button" id="button" class="btn btn-success">抽取元数据</button>
    		</div>
    	</form>
    </div>
  </body>
</html>
