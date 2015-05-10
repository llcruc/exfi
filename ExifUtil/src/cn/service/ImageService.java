package cn.service;

import java.io.File;


public interface ImageService {
	
	/**
	 * 抽取图片元数据服务
	 * @param file
	 * @return
	 */
	public String getImageMetadata(File file);
	
	/**
	 * 获取元数据的EXCLE文件
	 * @param exifJson
	 * @return
	 */
	public File getExcle(String exifJson);

}
