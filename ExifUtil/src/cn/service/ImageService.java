package cn.service;

import java.io.File;


public interface ImageService {
	
	/**
	 * ��ȡͼƬԪ���ݷ���
	 * @param file
	 * @return
	 */
	public String getImageMetadata(File file);
	
	/**
	 * ��ȡԪ���ݵ�EXCLE�ļ�
	 * @param exifJson
	 * @return
	 */
	public File getExcle(String exifJson);

}
