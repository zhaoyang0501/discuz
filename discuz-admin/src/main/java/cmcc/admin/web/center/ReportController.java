package cmcc.admin.web.center;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/***
 * 
 *开发售后  @author qq:263608237@qq.com
 *
 */
@Controller
@RequestMapping("center")
public class ReportController {
	
	@RequestMapping("report")
	public String report(Model model) {
		return "center/report";
	}
	
}
