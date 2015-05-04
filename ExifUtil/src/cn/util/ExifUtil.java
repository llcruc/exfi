package cn.util;

import java.io.File;
import java.io.IOException;

import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.imaging.jpeg.JpegProcessingException;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;

public class ExifUtil {
	
	private static  String FILE="C:\\Users\\Flyaway\\Desktop\\IMG_0036.JPG";
	
	public static void main(String[] args) {
		
		File jpegFile=new File(FILE);
		
		try 
		{
			Metadata metadata = JpegMetadataReader.readMetadata(jpegFile);
			for(Directory directory:metadata.getDirectories())
			{
				for(Tag tag:directory.getTags())
				{
					System.out.println(tag);
				}
			}
		} catch (JpegProcessingException e) 
		{
			e.printStackTrace();
		} catch (IOException e) 
		{
			e.printStackTrace();
		}
	}

}
