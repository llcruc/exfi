package cn.util;

import java.io.File;

import net.sf.json.JSONObject;

import com.drew.imaging.ImageMetadataReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;

public class ExifUtil {
	
	private static  String FILE="C:\\Users\\LIUlichao\\Desktop\\IMG_0041.JPG";
	
	/**
	 * @desp 照片Exif元数据抽取
	 * @param file 照片文件
	 * @return 封装的json格式元数据
	 */
	public static JSONObject getMetadata(File file){
		JSONObject data=new JSONObject();
		try 
		{
			Metadata metadata=ImageMetadataReader.readMetadata(file);
			for(Directory directory:metadata.getDirectories())
			{
				for(Tag tag:directory.getTags())
				{
					System.out.println(tag);
					data.put(tag.getTagName().replaceAll(" ", "_").replaceAll("/", "_"), tag.getDescription());
				}
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return data;
	}
	
	public static void main(String[] args) {
		
		File jpegFile=new File(FILE);
		
		System.out.println(getMetadata(jpegFile));
		
		
//		try 
//		{
//			Metadata metadata = JpegMetadataReader.readMetadata(jpegFile);
//			for(Directory directory:metadata.getDirectories())
//			{
//				for(Tag tag:directory.getTags())
//				{
//					System.out.println(tag);
//				}
//			}
//		} catch (JpegProcessingException e) 
//		{
//			e.printStackTrace();
//		} catch (IOException e) 
//		{
//			e.printStackTrace();
//		}
	}

}
