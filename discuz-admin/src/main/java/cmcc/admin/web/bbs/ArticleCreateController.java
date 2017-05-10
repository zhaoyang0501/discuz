package cmcc.admin.web.bbs;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cmcc.common.dto.json.SuccessResponse;
import cmcc.core.bbs.entity.Article;
import cmcc.core.bbs.service.ArticleService;
import cmcc.core.bbs.service.BbsCategoryService;
import cmcc.core.sys.entity.User;

@Controller
@RequestMapping("bbs/create")
public class ArticleCreateController  {
	
	@Autowired
	private BbsCategoryService bbsCategoryService;
	
	@Autowired
	private  ArticleService articleService;
	
	@RequestMapping("index")
	public String index(Model model) {
		model.addAttribute("categorys",bbsCategoryService.findAll());
		return "bbs/create/index";
	}
	
	@RequestMapping(value="create",method=RequestMethod.POST)
	public String create(Model model,Article article,final RedirectAttributes redirectAttributes) {
		article.setUser((User) SecurityUtils.getSubject().getSession().getAttribute("currentUser"));
		this.articleService.save(article);
		redirectAttributes.addFlashAttribute("response", new SuccessResponse("操作成功！"));
		 return "redirect:/bbs/create/index";  
	}
}
