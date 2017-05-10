package cmcc.core.bbs.repository;
import java.util.List;

import cmcc.common.repository.SimpleCurdRepository;
import cmcc.core.bbs.entity.BbsCategory;
import cmcc.core.bbs.enums.CategoryTypeEnum;
public interface BbsCategoryRepository   extends SimpleCurdRepository<BbsCategory ,Long>{
	public List<BbsCategory> findByCategoryTypeEnumOrderByPriority(CategoryTypeEnum categoryTypeEnum);
}
