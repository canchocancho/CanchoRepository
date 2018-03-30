package lets.eat.cancho.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import lets.eat.cancho.user.vo.Blog_User;

@Controller
@RequestMapping(value="user")
@SessionAttributes("user")
public class UserJoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserJoinController.class);
	
	@RequestMapping(value="joinForm", method= RequestMethod.GET)
	public String joinForm(Model model){
		logger.info("회원 가입 폼 시작");
		
		Blog_User user = new Blog_User();
		model.addAttribute("user", user);
		
		logger.info("회원 가입 폼 종료");
		return "user/joinForm"; //JSP로 이동
	}
	
	

}
