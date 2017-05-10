package cmcc.admin.web.bbs;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cmcc.common.web.AbstractBaseCURDController;
import cmcc.core.bbs.entity.BbsCategory;

@Controller
@RequestMapping("bbs/category")
public class ArticleCategoryController extends AbstractBaseCURDController<BbsCategory,Long>  {
	
	@Override
	public String getBasePath() {
		return "bbs/category";
	}
	
	@Override
	@RequestMapping("index")
	public String index(Model model) {
		return this.getBasePath()+"/index";
	}
	
}
