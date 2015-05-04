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
	<script type="text/javascript" src="js/jquery.form.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	
	<style type="text/css">
		body{
			text-align: center;
		}
	</style>

  </head>
  
  <body>
    <div class="container">
    	<div class="starter-template">
        	<h1>Exif照片元数据抽取</h1>
        	<p class="lead"><br> 选择文件后抽取照片元数据</p>
        </div>
    	<form name="imageform" id="imageform" action="image.action" method="post" enctype="multipart/form-data">
    		<div class="form-group">
    			<label for="image">选择照片</label>
    			<p><input type="file" name="image" id="image" style="display: none;"/>
    			<p><button type="button" id="button" class="btn btn-success">选择照片</button>
    		</div>
    	</form>
    	
    	<div class="container">
    	
    	<div class="panel panel-default">
    		<div class="panel-heading" style="text-align: left;">
                 <h4>ExifIFD</h4>
            </div>
            <div class="panel-body">
            <div class="dataTable_wrapper">
    		<table class="table table-hover" style="text-align: center;">
				<thead>
					<th style="text-align: center;width: 30%;">元数据名称</th>
					<th style="text-align: center;">Exif Tag Name</th>
					<th style="text-align: center;width: 32%;">Exif Description</th>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			</div>
		</div>
		</div>
    	
    	
    	
    	<div class="panel panel-default">
    		<div class="panel-heading" style="text-align: left;">
                 <h4>ExifIFD</h4>
            </div>
            <div class="panel-body">
            <div class="dataTable_wrapper">
    		<table class="table table-hover" style="text-align: center;">
				<thead>
					<th style="text-align: center;width: 30%;">元数据名称</th>
					<th style="text-align: center;">Exif Tag Name</th>
					<th style="text-align: center;width: 32%;">Exif Description</th>
				</thead>
				<tbody>
					<tr>
						<td>产品生产者</td>
						<td>Make</td>
						<td id="Make"></td>
					</tr>
					<tr>
						<td>型号</td>
						<td>Model</td>
						<td id="Model"></td>
					</tr>
					<tr>
						<td>方向(部分相机支持)</td>
						<td>Orientation</td>
						<td id="Orientation"></td>
					</tr>
					<tr>
						<td>X方向分辨率</td>
						<td>X Resolution</td>
						<td id="X_Resolution"></td>
					</tr>
					<tr>
						<td>Y方向分辨率</td>
						<td>Y Resolution</td>
						<td id="Y_Resolution"></td>
					</tr>
					<tr>
						<td>分辨率单位</td>
						<td>Resolution Unit</td>
						<td id="Resolution_Unit"></td>
					</tr>
					<tr>
						<td>软件</td>
						<td>Software</td>
						<td id="Software"></td>
					</tr>
					<tr>
						<td>日期和时间</td>
						<td>Date/Time</td>
						<td id="Date_Time"></td>
					</tr>
					<tr>
						<td>色相定位</td>
						<td>YCbCr Positioning</td>
						<td id="YCbCr_Positioning"></td>
					</tr>
					<tr>
						<td>光圈系数</td>
						<td>Aperture Value</td>
						<td id="Aperture_Value"></td>
					</tr>
					<tr>
						<td>曝光程序</td>
						<td>Exposure Program</td>
						<td id="Exposure_Program"></td>
					</tr>
					<tr>
						<td>曝光补偿</td>
						<td>Exposure Bias Value</td>
						<td id="Exposure_Bias_Value"></td>
					</tr>
					<tr>
						<td>曝光时间(即快门速度)</td>
						<td>Exposure Time</td>
						<td id="Exposure_Time"></td>
					</tr>
					<tr>
						<td>感光度</td>
						<td>ISO Speed Ratings</td>
						<td id="ISO_Speed_Ratings"></td>
					</tr>
					<tr>
						<td>Exif版本</td>
						<td>Exif Version</td>
						<td id="Exif_Version"></td>
					</tr>
					<tr>
						<td>创建时间</td>
						<td>Date/Time Original</td>
						<td id="Date_Time_Original"></td>
					</tr>
					<tr>
						<td>数字化时间</td>
						<td>Date/Time Digitized</td>
						<td id="Date_Time_Digitized"></td>
					</tr>
					<tr>
						<td>图像构造(多指色彩组合方案)</td>
						<td>Components Configuration</td>
						<td id="Components_Configuration"></td>
					</tr>
					<tr>
						<td>测光方式</td>
						<td>Metering Mode</td>
						<td id="Metering_Mode"></td>
					</tr>
					<tr>
						<td>光源(白平衡设置)</td>
						<td>White Balance Mode</td>
						<td id="White_Balance_Mode"></td>
					</tr>
					<tr>
						<td>是否使用闪光灯</td>
						<td>Flash</td>
						<td id="Flash"></td>
					</tr>
					<tr>
						<td>焦距</td>
						<td>Focal Length</td>
						<td id="Focal_Length"></td>
					</tr>
					<tr>
						<td>FlashPix版本(个别机型支持)</td>
						<td>FlashPix Version</td>
						<td id="FlashPix_Version"></td>
					</tr>
					<tr>
						<td>色域、色彩空间</td>
						<td>Color Space</td>
						<td id="Color_Space"></td>
					</tr>
					<tr>
						<td>图像宽度(指横向像素数)</td>
						<td>Exif Image Width</td>
						<td id="Exif_Image_Width"></td>
					</tr>
					<tr>
						<td>图像高度(指纵向像素数)</td>
						<td>Exif Image Height</td>
						<td id="Exif_Image_Height"></td>
					</tr>
					<tr>
						<td>压缩方式</td>
						<td>Compression Type</td>
						<td id="Compression_Type"></td>
					</tr>
					<tr>
						<td>数据精度</td>
						<td>Data Precision</td>
						<td id="Data_Precision"></td>
					</tr>
					
				</tbody>
			</table>
			</div>
		</div>
		</div>
		
    	</div>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		$("#button").click(function(){
    			$("#image").click();
    		});
    		
    		$("#image").change(function(){
    			var url="<%=basePath%>image.action";
    			$("#imageform").ajaxSubmit({
    				url:url,
    				type:"POST",
    				success:function(data)
    				{
    					console.log(data);
    					$.each(data,function(name,value){
    						console.log(name);
    						$("#"+name).html(value);
    					});
    				}
    			});
    		});
    	});
    </script>
    
  </body>
</html>
