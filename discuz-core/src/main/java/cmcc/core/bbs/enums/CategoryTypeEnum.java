package cmcc.core.bbs.enums;


public enum CategoryTypeEnum {
	
	
	COMPANY("动态") ,
	DISCUSS("讨论"); 
	private String lable;
	private CategoryTypeEnum(String lable){
		this.lable=lable;
	}
	public String getLable() {
		return lable;
	}
	
	
}
