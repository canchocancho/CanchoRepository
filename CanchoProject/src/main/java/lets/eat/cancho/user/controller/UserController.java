package lets.eat.cancho.user.controller;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import lets.eat.cancho.user.dao.UserDAO;
import lets.eat.cancho.user.vo.Blog_User;

@Controller
@RequestMapping(value="user") //편의성 및 가독성을 위해 그룹화
@SessionAttributes("user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private JavaMailSender mailSender;
	
	@Autowired
	UserDAO dao;
	
	@RequestMapping(value="loginPage", method = RequestMethod.GET)
	public String loginPage(){
		logger.info("로그인 페이지 이동 시작");
		logger.info("로그인 페이지 이동 종료");
		return "user/loginPage";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(HttpSession session, Blog_User user, Model model){
		
		logger.info("로그인 시작");
		Blog_User vo = dao.searchUserOne(user.getUser_id());
		String userVerified = (user != null) ? vo.getUser_verify() : "N";
		
		// E-mail 인증까지 모두 마친 로그인
		if(vo != null && userVerified.equals("Y")) {
					
			logger.info("User Login Success");
					
			session.setAttribute("loginId", vo.getUser_id());	// 로그인 성공시 User ID를 Session에 저장
			session.setAttribute("loginName", vo.getUser_name()); 
		}
				
		// E-mail 인증이 되지 않은 로그인
		else if(vo != null && userVerified.equals("N")) {
			logger.info("User Login Fail - Email Verify Fail");
		} else {
			logger.info("User Login Fail");
		}
		
			return "redirect:/";
		}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		logger.info("로그아웃 시작");
		
		session.invalidate();
		
		logger.info("로그아웃 종료");
		return "redirect:/";
	}
	
	@RequestMapping(value="joinForm", method= RequestMethod.GET)
	public String joinForm(Model model){
		logger.info("회원 가입 폼 시작");
		
		Blog_User user = new Blog_User();
		model.addAttribute("user", user);
		
		logger.info("회원 가입 폼 종료");
		return "user/joinForm"; 
	}
	
	@ResponseBody
	@RequestMapping(value="idCheck", method=RequestMethod.GET)
	public boolean idCheck(String id){
		
		logger.info("아이디 중복 검사 시작");
		boolean flag = false;
		
		Blog_User user = dao.searchUserOne(id);
		
		logger.info("아이디 중복 검사 종료");

		if(user != null){
			return flag; 
		}else{
			flag = true;
			return flag;
		}
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(@ModelAttribute("user")Blog_User user, Model model) throws
		MessagingException, UnsupportedEncodingException {
		logger.info("회원 가입 시작");
		
		//관리자 계정
		String admin = "canchoad@gmail.com";
		
		//Server Address
		String serverAddress = "http://10.10.8.124:8888/cancho/";
		
		logger.info(user.toString());
		int result = dao.joinUser(user);
		
		if (result == 1) {
			// 인증을 위한 E-mail을 보내는 부분		
		    MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper 
		                      = new MimeMessageHelper(message, true, "UTF-8");
		 
		    messageHelper.setFrom(admin);  					// 보내는사람 (생략 시 정상작동을 안함)
		    messageHelper.setTo(user.getUser_email());     	// 받는사람 이메일
		    messageHelper.setSubject("[이메일 인증]"); 		// 메일제목(생략 가능)
		    messageHelper.setText(							// 메일 내용
		    		  new StringBuffer().append("메일인증 \n")
						.append("Cancho에 가입해주셔서 감사합니다. \n"
								+ serverAddress + "user/verify?user_id="
								+ user.getUser_id())
						.append("\n이메일 인증 확인").toString());	
			 try {
				 //메일 보내기
			      mailSender.send(message);
			 }
			 catch(MailException e){
			      e.printStackTrace();
			 }
		 
			logger.info("User Join Success");
		} 
		else {
			logger.info("User Join Fail");
			model.addAttribute("errorMsg", "회원가입 실패");
			return "user/joinForm";
		}
		return "redirect:joinComplete";
	}
	
	/*
	 * @comment			: 인증 받은 회원의 EmailVerify 속성을 'Y'로 변경한다.
	 * @param	userid	: E-mail 인증을 받은 회원의 ID
	 * @author			: 정보승
	 */
	@RequestMapping(value = "verify", method = RequestMethod.GET)
	public String verifySuccess(@RequestParam String user_id) {
		
		logger.info("E-mail Verify");
		logger.debug("userID : {}", user_id);
		
		int result = dao.verifyUser(user_id);
		
		if(result == 1) {
			logger.info("E-mail Verify Success");
		}
		else {
			logger.info("E-mail Verify Fail");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="joinComplete", method=RequestMethod.GET)
	public String joinComplete(SessionStatus session, 
			@ModelAttribute("user") Blog_User user, 
			Model model ){
		
		logger.info("회원 가입 성공 폼 이동 시작");
		
		model.addAttribute("id", user.getUser_id());
		session.setComplete();
		
		logger.info("회원 가입 성공 폼 이동 종료");
		return "user/joinComplete";
	}
	
}