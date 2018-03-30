package lets.eat.cancho;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("HOME");
		
		return "home";
	}
	
	@RequestMapping(value="writePost", method=RequestMethod.GET)
	public String writePost(HttpSession session){
		logger.info("POST");
		
		//일단은 로그인을 했다고 가정(아이디 : aaa)
		session.setAttribute("loginId", "aaa");
		
		return "post";
	}
	
}
