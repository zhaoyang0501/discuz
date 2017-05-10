package cmcc.core.bbs.entity;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import cmcc.common.entity.BaseEntity;
import cmcc.core.bbs.enums.CategoryTypeEnum;
import io.swagger.annotations.ApiModelProperty;

@Entity
@Table(name = "t_bbs_category")
@JsonIgnoreProperties(value={"createDate","updateDate"})
public class BbsCategory extends BaseEntity<Long>{
	
	@ApiModelProperty(value="板块名称")
	private String  name;
	
	@ApiModelProperty(value="板块备注")
	private String remark;
	
	@ApiModelProperty(value="图片地址")
	private String logo;
	
	@ApiModelProperty(value="排序")
	private Long priority ;
	
	@Enumerated(value = EnumType.STRING)
	@ApiModelProperty(value="所属大板块，公司动态或交流讨论")
	private CategoryTypeEnum categoryTypeEnum;
	
	
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Long getPriority() {
		return priority;
	}
	public void setPriority(Long priority) {
		this.priority = priority;
	}
	public CategoryTypeEnum getCategoryTypeEnum() {
		return categoryTypeEnum;
	}
	public void setCategoryTypeEnum(CategoryTypeEnum categoryTypeEnum) {
		this.categoryTypeEnum = categoryTypeEnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
