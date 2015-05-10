package cn.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.Iterator;

import net.sf.json.JSONObject;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

import cn.service.ImageService;
import cn.util.ExifUtil;
import cn.util.StringHandler;

@Service
public class ImageServiceImpl implements ImageService {

	@Override
	public String getImageMetadata(File file) {
		return ExifUtil.getMetadata(file).toString();
	}

	@Override
	public File getExcle(String exifJson) {
		JSONObject exif = JSONObject.fromObject(exifJson);

		/* 创建一个excel对象 */
		HSSFWorkbook excel = new HSSFWorkbook();
		/* 创建一个excel中的sheet对象 */
		HSSFSheet sheet = excel.createSheet("图片Exif元数据");
		/* 设置列的宽度 */
		sheet.setColumnWidth(0, 40 * 256);
		sheet.setColumnWidth(1, 60 * 256);
		/* 添加表头第0行 */
		HSSFRow row = sheet.createRow(0);
		
		/* 创建单元格并添加表头 */
		HSSFCellStyle style = excel.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		HSSFCell cell = row.createCell(0);
		cell.setCellValue("元数据项");
		cell.setCellStyle(style);

		cell = row.createCell(1);
		cell.setCellValue("元数据值");
		cell.setCellStyle(style);
		
		/* 将json数据放入Excel中 */
		@SuppressWarnings("unchecked")
		Iterator<Object> iterator=exif.keys();
		int i=1;
		while (iterator.hasNext()) {
			String key=(String)iterator.next();
			String value=exif.getString(key);
			
			row=sheet.createRow(i);
			row.createCell(0).setCellValue(key);
			row.createCell(1).setCellValue(value);
			i++;
		}
		
		String path=ServletActionContext.getServletContext().getRealPath("/excle/");
		File file=new File(path+StringHandler.getSerial(new Date()));
		
		try {
			FileOutputStream fos=new FileOutputStream(file);
			excel.write(fos);
			
			excel.close();
			fos.close();
			
			return file;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
