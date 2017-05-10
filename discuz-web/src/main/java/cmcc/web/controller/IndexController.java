package cmcc.web.controller;

import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import cmcc.common.dto.json.FailedResponse;
import cmcc.common.dto.json.SuccessResponse;
import cmcc.core.bbs.service.ArticleService;
import cmcc.core.bbs.service.BbsCategoryService;
import cmcc.core.sys.entity.User;
import cmcc.core.sys.service.FavoriteService;
import cmcc.core.sys.service.UserService;
/***
 * 
 *开发售后  @author qq:263608237@qq.com
 *
 */
@Controller
@SessionAttributes("user")  
public class IndexController {
	
	
	@Autowired
	private BbsCategoryService bbsCategoryService;
	
	@Autowired
	private ArticleService articleService;
	

	@Autowired
	private  UserService userService;
	
	@Autowired
	private FavoriteService favoriteService;
	
	
	@Autowired
	private RedisTemplate<Object, Object> redisTemplate;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model) {
		return "register";
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String download(Model model) {
		return "download";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Model model) {
		return "about";
	}
	
	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public String password(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		return "password";
	}
	
	@RequestMapping(value="/password",method=RequestMethod.POST)
	public String password(Model model,String pw1,String pw2,String pw,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		if(pw1!=null&&!pw1.equals(pw2)){
			model.addAttribute("response",new FailedResponse("两次密码不正确！"));
		}
		else if(!DigestUtils.md5Hex(pw).equals(user.getPassword()))
			model.addAttribute("response",new FailedResponse("原始密码不正确！"));
		else if (this.isSimplePassword(pw1))
			model.addAttribute("response",new FailedResponse("密码过于简单，必须包含数字字母且长度必须大于8位！"));
		else{
			user.setPassword(DigestUtils.md5Hex(pw1));
			userService.save(user);
			model.addAttribute("response",new SuccessResponse("密码修改成功！"));
		}
			
		return "password";
	}
	
	@RequestMapping(value = "/center", method = RequestMethod.GET)
	public String center(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user==null)
			return "redirect:/login"; 
		model.addAttribute("articles", this.articleService.findByUser(user));
		model.addAttribute("favoritebbs",favoriteService.findBbsFavorites(user));
		model.addAttribute("comments",articleService.findComment(user));
		return "center";
	}
	
	@RequestMapping(value = "/loginout", method = RequestMethod.GET)
	public String loginout(Model model, SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/bbs";  
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model,String username,String password) {
		
	
		Integer trytimes = (Integer)redisTemplate.opsForValue().get(username);
		System.out.println("fuckou->"+trytimes);
		if(trytimes!=null&&trytimes>=5){
			model.addAttribute("tip","密码错误超过5次，请20分钟后在试试！");
			return "login";
		}else{
			//开始登陆逻辑
			User user = userService.login(username, password);
			if(user ==null){
				redisTemplate.opsForValue().increment(username, 1);
	            redisTemplate.expire(username, 20, TimeUnit.MINUTES);
				model.addAttribute("tip","用户名密码不正确,错误次数超过5次将被锁定！");
				return "login";
			}else{
				model.addAttribute("user",user);
				redisTemplate.delete(username);
				return "redirect:/bbs";  
			}
		}
	}
	
	@RequestMapping(value = "/doregister", method = RequestMethod.POST)
	public String doregister(Model model,User user) {
		user.setPassword( DigestUtils.md5Hex(User.DEFAULT_PASSWORD));
		model.addAttribute("tip","注册成功，请登录！");
		this.userService.save(user);
		return "login";
	}
	@RequestMapping(value = "/bbs", method = RequestMethod.GET)
	public String bbs(Model model) {
		model.addAttribute("categorys",this.bbsCategoryService.findAll());
		model.addAttribute("hotuser",this.articleService.hotUser());
		model.addAttribute("newBbss",this.articleService.findNew(1));
		return "bbs";
	}
	
	
	
	
	
	@RequestMapping(value = {"/index"}, method = RequestMethod.GET)
	public String index1(Model model) {
		model.addAttribute("categorys",this.bbsCategoryService.findAll());
		model.addAttribute("hotuser",this.articleService.hotUser());
		model.addAttribute("newBbss",this.articleService.findNew(1));
		return "bbs";
	}
	
	@RequestMapping(value = {"/"}, method = RequestMethod.GET)
	public String index2(Model model) {
		return "redirect:/bbs";  
	}
	
	
	/***
     * 判断密码强度是否过于简单 
     * 1 长度不能小于6 
     * 2 不能由纯数字构成 
     * 3 不能由纯字母构成
     * 
     * @param password
     * @return 如果是简单密码 返回true
     */
    private  boolean isSimplePassword(String password) {
        String pattern1 = "^\\d+$";
        String pattern2 = "^[a-zA-Z]+$";
        if (null == password || password.length() <= 6 || password.matches(pattern1) || password.matches(pattern2))
            return true;
        else
            return false;
    }
}
