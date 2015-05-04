package cn.action;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.service.ImageService;

import com.opensymphony.xwork2.ActionSupport;

@Component
public class ImageAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private ImageService imageService;
	
	private Map<String, Object> resMap;
	private JSONObject exif;
	private File image;
	
	/**
	 * 抽取元数据
	 * @return
	 */
	public String metadata(){
		exif=new JSONObject();
		exif=JSONObject.fromObject(imageService.getImageMetadata(image));
		return SUCCESS;
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
	
	

}
