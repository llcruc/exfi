package cn.service.impl;

import java.io.File;

import org.springframework.stereotype.Service;

import cn.service.ImageService;
import cn.util.ExifUtil;
@Service
public class ImageServiceImpl implements ImageService{

	@Override
	public String getImageMetadata(File file) {
		return ExifUtil.getMetadata(file).toString();
	}

}
