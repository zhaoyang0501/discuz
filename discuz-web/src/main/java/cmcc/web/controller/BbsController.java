package cmcc.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cmcc.core.bbs.entity.Article;
import cmcc.core.bbs.entity.Comment;
import cmcc.core.bbs.service.ArticleService;
import cmcc.core.bbs.service.BbsCategoryService;
import cmcc.core.bbs.service.CommentService;
import cmcc.core.sys.entity.User;
import cmcc.core.sys.service.UserService;
/***
 * 
 *开发售后  @author qq:263608237@qq.com
 *
 */
@Controller
public class BbsController {
	
	@Autowired
	private ArticleService bbsService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private BbsCategoryService bbsCategoryService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/bbsgood", method = RequestMethod.GET)
	public String bbsgood(Model model,HttpSession httpSession) {
		model.addAttribute("hotuser",this.bbsService.hotUser());
		model.addAttribute("categorys",this.bbsCategoryService.findAll());
		model.addAttribute("bbs",this.bbsService.findGood(1));
		return "bbsgood";
	}
	
	@RequestMapping(value = "/bbshot", method = RequestMethod.GET)
	public String bbshot(Model model,HttpSession httpSession) {
		model.addAttribute("categorys",this.bbsCategoryService.findAll());
		model.addAttribute("hotuser",this.bbsService.hotUser());
		model.addAttribute("bbs",this.bbsService.findHot(1));
		return "bbshot";
	}
	
	@RequestMapping(value = "/bbstobereply", method = RequestMethod.GET)
	public String bbstobereply(Model model,HttpSession httpSession) {
		model.addAttribute("categorys",this.bbsCategoryService.findAll());
		model.addAttribute("hotuser",this.bbsService.hotUser());
		model.addAttribute("bbs",this.bbsService.findToBeReply(1));
		return "bbstobereply";
	}
	
	@RequestMapping("/bbsdetail/{id}")
	public String newsdetail(@PathVariable Long id,Model model){
		Article bbs = bbsService.find(id);
		if(bbs==null){
			return "404";
		}
		model.addAttribute("bbs", bbs);
		return "bbsdetail";
	}
	
	@RequestMapping(value = "/bbsnew", method = RequestMethod.GET)
	public String bbsnew(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		
		model.addAttribute("hotuser",this.bbsService.hotUser());
		model.addAttribute("categorys",this.bbsCategoryService.findAll());
		return "bbsnew";
	}
	
	@RequestMapping(value = "/bbscategory", method = RequestMethod.GET)
	public String bbscategory(Model model,HttpSession httpSession,Long id) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		
		model.addAttribute("hotuser",this.bbsService.hotUser());
		model.addAttribute("categorys",this.bbsCategoryService.findAll());
		model.addAttribute("bbs",this.bbsService.findByCategory(id));
		model.addAttribute("category",this.bbsCategoryService.find(id));
		return "bbscategory";
	}
	
	
	@RequestMapping(value = "/bbssearch", method = RequestMethod.POST)
	public String bbssearch(Model model,HttpSession httpSession,String key) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		
		model.addAttribute("hotuser",this.bbsService.hotUser());
		model.addAttribute("categorys",this.bbsCategoryService.findAll());
		model.addAttribute("bbs",this.bbsService.findAll(1, 20, key, "title").getContent());
		model.addAttribute("key",key);
		return "bbssearch";
	}
	
	@RequestMapping(value = "/bbsnew", method = RequestMethod.POST)
	public String bbsnew(Model model,HttpSession httpSession,Article article, RedirectAttributes redirectAttributes) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		article.setUser(userService.find(user.getId()));
		article.setBody(article.getBody().replaceAll("共产党", "***").replaceAll("人权", "**").replaceAll("民主", "**"));
		this.bbsService.save(article);
		redirectAttributes.addFlashAttribute("tip", "帖子发布成功！");
		return "redirect:/bbsnew";
	}
	
	@RequestMapping(value = "/comment/{id}")
	public String comment(@PathVariable Long id,String body,Model model,HttpSession httpSession, RedirectAttributes redirectAttributes) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		Article article = bbsService.find(id);
		Comment comment = new Comment();
		comment.setArticle(article);
		comment.setBody(body);
		comment.setUser(user);
		commentService.save(comment);
		redirectAttributes.addFlashAttribute("tip", "评论成功！");
		return "redirect:/bbsdetail/"+id;
	}
}
