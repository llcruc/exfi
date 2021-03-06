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
	<link rel="stylesheet" type="text/css" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	
	<style type="text/css">
		body{
			text-align: center;
		}
		.lead2{
			font-size: 10px;
		}
		.img{
		    float: left;
		    position: absolute;
		    margin-left: -558px;
		    width: 20%;
		    height: 240px;
		    margin-top: 10px;
		}
	</style>

  </head>
  
  <body>
    <div class="container">
    	<img width="30%;" src="" class="img" />
    	<div class="starter-template">
        	<h1>Exif照片元数据抽取</h1>
        	<p class="lead"><br> 选择文件后抽取照片元数据</p>
        	<p class="lead2">@Author:liulichao  2012级档案班</p>
        </div>
    	<form name="imageform" id="imageform" action="image.action" method="post" enctype="multipart/form-data">
    		<div class="form-group">
    			<label for="image">选择照片</label>
    			<p><input type="file" name="image" id="image" style="display: none;" onchange="readfile(this)"/>
    			<p><button type="button" id="button" class="btn btn-success"><i class="glyphicon glyphicon-camera"></i> 选择照片</button>
    			   <a href="<%=basePath %>download.action" type="button" id="excel" class="btn btn-warning"><i class="fa fa-file-excel-o"></i> 导出Excel</a>
    		</div>
    	</form>
    	
    	<div class="container">
    	
    	<div class="panel panel-default">
    		<div class="panel-heading" style="text-align: left;">
                 <h4>IFD0</h4>
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
						<td id="Make" class="value"></td>
					</tr>
					<tr>
						<td>型号</td>
						<td>Model</td>
						<td id="Model" class="value"></td>
					</tr>
					<tr>
						<td>方向(部分相机支持)</td>
						<td>Orientation</td>
						<td id="Orientation" class="value"></td>
					</tr>
					<tr>
						<td>X方向分辨率</td>
						<td>X Resolution</td>
						<td id="X_Resolution" class="value"></td>
					</tr>
					<tr>
						<td>Y方向分辨率</td>
						<td>Y Resolution</td>
						<td id="Y_Resolution" class="value"></td>
					</tr>
					<tr>
						<td>分辨率单位</td>
						<td>Resolution Unit</td>
						<td id="Resolution_Unit" class="value"></td>
					</tr>
					<tr>
						<td>软件</td>
						<td>Software</td>
						<td id="Software" class="value"></td>
					</tr>
					<tr>
						<td>日期和时间</td>
						<td>Date/Time</td>
						<td id="Date_Time" class="value"></td>
					</tr>
					<tr>
						<td>色相定位</td>
						<td>YCbCr Positioning</td>
						<td id="YCbCr_Positioning" class="value"></td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
		</div>
		
		<div class="panel panel-default">
    		<div class="panel-heading" style="text-align: left;">
                 <h4>IFD1</h4>
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
						<td>压缩方式</td>
						<td>Compression Type</td>
						<td id="Compression_Type" class="value"></td>
					</tr>
					<tr>
						<td>压缩</td>
						<td>Thumbnail Compression</td>
						<td id="Thumbnail_Compression" class="value"></td>
					</tr>
					<tr>
						<td>缩略图偏移</td>
						<td>Thumbnail Offset</td>
						<td id="Thumbnail_Offset" class="value"></td>
					</tr>
					<tr>
						<td>缩略图长度</td>
						<td>Thumbnail Length</td>
						<td id="Thumbnail_Length" class="value"></td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
		</div>
		
		
		<div class="panel panel-default">
    		<div class="panel-heading" style="text-align: left;">
                 <h4>GPS</h4>
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
						<td>GPS Latitude Ref</td>
						<td>GPS Latitude Ref</td>
						<td id="GPS_Latitude_Ref" class="value"></td>
					</tr>
					<tr>
						<td>GPS Latitude</td>
						<td>GPS Latitude</td>
						<td id="GPS_Latitude" class="value"></td>
					</tr>
					<tr>
						<td>GPS Longitude Ref</td>
						<td>GPS Longitude Ref</td>
						<td id="GPS_Longitude_Ref" class="value"></td>
					</tr>
					<tr>
						<td>GPS Longitude</td>
						<td>GPS Longitude</td>
						<td id="GPS_Longitude" class="value"></td>
					</tr>
					<tr>
						<td>GPS Altitude Ref</td>
						<td>GPS Altitude Ref</td>
						<td id="GPS_Altitude_Ref" class="value"></td>
					</tr>
					<tr>
						<td>GPS Altitude</td>
						<td>GPS Altitude</td>
						<td id="GPS_Altitude" class="value"></td>
					</tr>
					<tr>
						<td>GPS时间戳</td>
						<td>GPS Time-Stamp</td>
						<td id="GPS_Time-Stamp" class="value"></td>
					</tr>
					<tr>
						<td>GPS速度Ref</td>
						<td>GPS Speed Ref</td>
						<td id="GPS_Speed_Ref" class="value"></td>
					</tr>
					<tr>
						<td>GPS速度</td>
						<td>GPS Speed</td>
						<td id="GPS_Speed" class="value"></td>
					</tr>
					<tr>
						<td>GPS Img Direction Ref</td>
						<td>GPS Img Direction Ref</td>
						<td id="GPS_Img_Direction_Ref" class="value"></td>
					</tr>
					<tr>
						<td>GPS Img Direction</td>
						<td>GPS Img Direction</td>
						<td id="GPS_Img_Direction" class="value"></td>
					</tr>
					<tr>
						<td>GPS Dest Bearing Ref</td>
						<td>GPS Dest Bearing Ref</td>
						<td id="GPS_Dest_Bearing_Ref" class="value"></td>
					</tr>
					<tr>
						<td>GPS Dest Bearing</td>
						<td>GPS Dest Bearing</td>
						<td id="GPS_Dest_Bearing" class="value"></td>
					</tr>
					<tr>
						<td>GPS Date Stamp</td>
						<td>GPS Date Stamp</td>
						<td id="GPS_Date_Stamp" class="value"></td>
					</tr>
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
						<td>镜头制造商</td>
						<td>Lens Make</td>
						<td id="Lens_Make" class="value"></td>
					</tr>
					<tr>
						<td>镜头型号</td>
						<td>Lens Model</td>
						<td id="Lens_Model" class="value"></td>
					</tr>
					<tr>
						<td>镜头规格</td>
						<td>Lens Specification</td>
						<td id="Lens_Specification" class="value"></td>
					</tr>
					<tr>
						<td>光圈系数</td>
						<td>Aperture Value</td>
						<td id="Aperture_Value" class="value"></td>
					</tr>
					<tr>
						<td>曝光程序</td>
						<td>Exposure Program</td>
						<td id="Exposure_Program" class="value"></td>
					</tr>
					<tr>
						<td>曝光补偿</td>
						<td>Exposure Bias Value</td>
						<td id="Exposure_Bias_Value" class="value"></td>
					</tr>
					<tr>
						<td>曝光时间(即快门速度)</td>
						<td>Exposure Time</td>
						<td id="Exposure_Time" class="value"></td>
					</tr>
					<tr>
						<td>感光度</td>
						<td>ISO Speed Ratings</td>
						<td id="ISO_Speed_Ratings" class="value"></td>
					</tr>
					<tr>
						<td>感光方式</td>
						<td>Sensing Method</td>
						<td id="Sensing_Method" class="value"></td>
					</tr>
					<tr>
						<td>场景类型</td>
						<td>Scene Type</td>
						<td id="Scene_Type" class="value"></td>
					</tr>
					<tr>
						<td>场景Capture类型</td>
						<td>Scene Capture Type</td>
						<td id="Scene_Capture_Type" class="value"></td>
					</tr>
					<tr>
						<td>测光方式</td>
						<td>Metering Mode</td>
						<td id="Metering_Mode" class="value"></td>
					</tr>
					<tr>
						<td>亮度值</td>
						<td>Brightness Value</td>
						<td id="Brightness_Value" class="value"></td>
					</tr><tr>
						<td>光源(白平衡设置)</td>
						<td>White Balance Mode</td>
						<td id="White_Balance_Mode" class="value"></td>
					</tr>
					<tr>
						<td>是否使用闪光灯</td>
						<td>Flash</td>
						<td id="Flash"></td>
					</tr>
					<tr>
						<td>焦距</td>
						<td>Focal Length</td>
						<td id="Focal_Length" class="value"></td>
					</tr>
					<tr>
						<td>35mm等效焦距</td>
						<td>Focal Length 35</td>
						<td id="Focal_Length_35" class="value"></td>
					</tr>
					<tr>
						<td>FlashPix版本(个别机型支持)</td>
						<td>FlashPix Version</td>
						<td id="FlashPix_Version" class="value"></td>
					</tr>
					<tr>
						<td>Exif版本</td>
						<td>Exif Version</td>
						<td id="Exif_Version" class="value"></td>
					</tr>
					<tr>
						<td>创建时间</td>
						<td>Date/Time Original</td>
						<td id="Date_Time_Original" class="value"></td>
					</tr>
					<tr>
						<td>数字化时间</td>
						<td>Date/Time Digitized</td>
						<td id="Date_Time_Digitized" class="value"></td>
					</tr>
					<tr>
						<td>图像构造(多指色彩组合方案)</td>
						<td>Components Configuration</td>
						<td id="Components_Configuration" class="value"></td>
					</tr>
					<tr>
						<td>色域、色彩空间</td>
						<td>Color Space</td>
						<td id="Color_Space" class="value"></td>
					</tr>
					<tr>
						<td>Subject Location</td>
						<td>Subject Location</td>
						<td id="Subject_Location" class="value"></td>
					</tr>
					<tr>
						<td>SubSecTime原始</td>
						<td>Sub-Sec Time Original</td>
						<td id="Sub-Sec_Time_Original" class="value"></td>
					</tr>
					<tr>
						<td>SubSecTime数码化</td>
						<td>Sub-Sec Time Digitized</td>
						<td id="Sub-Sec_Time_Digitized" class="value"></td>
					</tr>
					<tr>
						<td>图像宽度(指横向像素数)</td>
						<td>Exif Image Width</td>
						<td id="Exif_Image_Width" class="value"></td>
					</tr>
					<tr>
						<td>图像高度(指纵向像素数)</td>
						<td>Exif Image Height</td>
						<td id="Exif_Image_Height" class="value"></td>
					</tr>
					
				</tbody>
			</table>
			</div>
		</div>
		</div>
		
    	</div>
    </div>
    
    <script type="text/javascript">
    	function readfile(obj){
    		var file = obj.files[0];
            //判断类型是不是图片  
          if(!/image\/\w+/.test(file.type)){
                 alert("请确保文件为图像类型");   
                 return false;   
            }
            var reader = new FileReader();
            reader.readAsDataURL(file);   
            reader.onload = function(e){
              console.log(this.result);
              $(".img").attr("src",this.result);
            }
    	}
    
    	$(function(){
    		$("#button").click(function(){
    			$("#image").click();
    		});
    		
    		
    		
    		$("#image").change(function(){
    			$(".value").html("");
    			
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
