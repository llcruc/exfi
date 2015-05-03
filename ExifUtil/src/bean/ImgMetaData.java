package bean;

public class ImgMetaData {
    
	//照片名称 
	private String imgName;
	
	//照片大小 
	private Long imgSize; 
	
	//图片高度 
	private String imgHeight ; 
    
	//图片宽度  
	private String imgWidth ;
    
	//拍摄时间  
	private String dateTime ;
    
	//海拔 
	private String altitude ; 
    
	//纬度 
	private String latitude; 
    
	//经度 
	private String longitude;
	
	//图像的描述、来源
	private String imgdescription;
	
	//照片的作者
	private String artist;
	
	//相机生产者
	private String make;
	
	//相机的型号
	private String model;
	
	//X方向分辨率
	private Integer x_resolution;
	
	//Y方向分辨率
	private Integer y_resolution;
	
	//分辨率单位
	private String resolutionunit;
	
	//拍摄软件信息
	private String software;
	
	//色相定位
	private String yCbCrPositioning;
        

	public String getImgHeight() {
		return imgHeight;
	}

	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}

	public String getImgWidth() {
		return imgWidth;
	}

	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getAltitude() {
		return altitude;
	}

	public void setAltitude(String altitude) {
		this.altitude = altitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public Long getImgSize() {
		return imgSize;
	}

	public void setImgSize(Long imgSize) {
		this.imgSize = imgSize;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgdescription() {
		return imgdescription;
	}

	public void setImgdescription(String imgdescription) {
		this.imgdescription = imgdescription;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public Integer getX_resolution() {
		return x_resolution;
	}

	public void setX_resolution(Integer x_resolution) {
		this.x_resolution = x_resolution;
	}

	public Integer getY_resolution() {
		return y_resolution;
	}

	public void setY_resolution(Integer y_resolution) {
		this.y_resolution = y_resolution;
	}

	public String getResolutionunit() {
		return resolutionunit;
	}

	public void setResolutionunit(String resolutionunit) {
		this.resolutionunit = resolutionunit;
	}

	public String getSoftware() {
		return software;
	}

	public void setSoftware(String software) {
		this.software = software;
	}

	public String getyCbCrPositioning() {
		return yCbCrPositioning;
	}

	public void setyCbCrPositioning(String yCbCrPositioning) {
		this.yCbCrPositioning = yCbCrPositioning;
	}   

}
