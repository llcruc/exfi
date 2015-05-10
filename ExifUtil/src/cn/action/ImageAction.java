package cn.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.service.ImageService;
import cn.util.StringHandler;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Component
public class ImageAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	@Autowired
	private ImageService imageService;

	private Map<String, Object> resMap;
	private JSONObject exif;
	private File image;
	private String exifString;
	private String fileName;
	
	private InputStream downloadFile;

	/**
	 * 抽取元数据
	 * 
	 * @return
	 */
	public String metadata() {
		exif = new JSONObject();
		exif = JSONObject.fromObject(imageService.getImageMetadata(image));
		ActionContext.getContext().getSession().put("json", exif);
		return SUCCESS;
	}

	/**
	 * 获取excel数据
	 * 
	 * @return
	 */
	public String getExcel() {
		
		resMap=new HashMap<String, Object>();
		if(ActionContext.getContext().getSession().get("json")==null){
			resMap.put("error", "尚未选取图片进行抽取");
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	
	public InputStream getDownloadFile() throws UnsupportedEncodingException {
		
		System.out.println(ActionContext.getContext().getSession().get("json"));
		
		String exifJson = ActionContext.getContext().getSession().get("json").toString();
		this.setFileName(new String(("照片元数据"+StringHandler.getSerial(new Date())+".xls").getBytes(),"iso-8859-1"));
		if (exifJson == null || "".equals(exifJson))
			resMap.put("error", "下载文件失败");
		File file = imageService.getExcle(exifJson);
		InputStream ins = null;
		try {
			ins = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return ins;
	}

	public ImageService getImageService() {
		return imageService;
	}

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public Map<String, Object> getResMap() {
		return resMap;
	}

	public void setResMap(Map<String, Object> resMap) {
		this.resMap = resMap;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public JSONObject getExif() {
		return exif;
	}

	public void setExif(JSONObject exif) {
		this.exif = exif;
	}

	public String getExifString() {
		return exifString;
	}

	public void setExifString(String exifString) {
		this.exifString = exifString;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

}
