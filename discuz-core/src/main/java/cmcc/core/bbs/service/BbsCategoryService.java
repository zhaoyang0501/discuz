package cmcc.core.bbs.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cmcc.common.service.SimpleCurdService;
import cmcc.core.bbs.entity.BbsCategory;
import cmcc.core.bbs.enums.CategoryTypeEnum;
import cmcc.core.bbs.repository.BbsCategoryRepository;

@Service
public class BbsCategoryService extends SimpleCurdService<BbsCategory, Long> {
	
	@Autowired
	private BbsCategoryRepository bbsCategoryRepository;
	
	public List<BbsCategory> findByCategoryType(CategoryTypeEnum categoryTypeEnum){
		return this.bbsCategoryRepository.findByCategoryTypeEnumOrderByPriority(categoryTypeEnum);
	}
}
