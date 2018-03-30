package lets.eat.cancho.post.controller;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lets.eat.cancho.HomeController;
import lets.eat.cancho.post.dao.PostDAO;
import lets.eat.cancho.post.vo.Post;

@Controller
public class PostController {
	
	@Autowired
	PostDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="writePost", method=RequestMethod.GET)
	public String writePost(HttpSession session){
		logger.info("POST");
		
		//일단은 로그인을 했다고 가정(아이디 : aaa)
		session.setAttribute("loginId", "aaa");
		
		return "post/postForm";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String saveData(String post_title, String hidden_data, HttpSession session, Model model){
		
		logger.info("WRITE");
		
        Date date = new Date(); 
        SimpleDateFormat simpleDate = new SimpleDateFormat("_yyMMdd_hhmmss_");
        String finalDate = simpleDate.format(date);

		String loginId = (String)session.getAttribute("loginId");	
        String fileName = "C:\\canchocancho\\"+loginId+finalDate+Math.random()+".txt";
        
        Post post = new Post();
        post.setPost_title(post_title);
        post.setPost_file(fileName);
        post.setUser_id(loginId);
        
        try{
            //BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
            BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, true));
             
            //파일 안에 문자열 쓰기
            fw.write(hidden_data);
            fw.flush();
 
            //객체 닫기
            fw.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
		int result = dao.writePost(post);
		
		if(result != 1){
			//등록실패
			model.addAttribute("errorMsg", "오류가 발생했습니다.");
			logger.info("글쓰기 실패");
			
			return "post/writePost";
		}
		
		logger.info("글쓰기 종료");

		return "../";
	}

}
