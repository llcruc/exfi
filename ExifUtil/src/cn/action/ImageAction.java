package cn.action;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

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
	private File image;
	
	/**
	 * ��ȡԪ����
	 * @return
	 */
	public String metadata(){
		resMap=new HashMap<String, Object>();
		resMap.put("data", imageService.getImageMetadata(image));
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
	
	

}
