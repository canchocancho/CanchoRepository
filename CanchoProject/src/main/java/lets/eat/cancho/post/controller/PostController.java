package lets.eat.cancho.post.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import lets.eat.cancho.HomeController;
import lets.eat.cancho.post.dao.PostDAO;
import lets.eat.cancho.post.vo.Post;

@Controller
@RequestMapping(value="post")
@SessionAttributes("post")
public class PostController {
	
	@Autowired
	PostDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="writePost", method=RequestMethod.GET)
	public String writePost(HttpSession session){
		logger.info("POST");
		
		return "post/postForm";
	}
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String saveData(String post_title, String hidden_data, String user_id, HttpSession session, Model model){
		
		logger.info("WRITE");
		
        Date date = new Date(); 
        SimpleDateFormat simpleDate = new SimpleDateFormat("_yyMMdd_hhmmss_");
        String finalDate = simpleDate.format(date);

		//String loginId = (String)session.getAttribute("loginId");	
        String loginId = user_id;
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
			logger.info("포스팅 실패");
			
			return "post/postForm";
		}
		
		logger.info("포스팅 종료");

		return "redirect:/";
	}
	
	@RequestMapping(value="postList", method=RequestMethod.GET)
	public String postList(HttpSession session, Model model){
		logger.info("POST LIST");
		
		ArrayList<Post> postList = dao.postList();
		model.addAttribute("postList", postList);
	
		return "post/postList";
	}
	
	@RequestMapping(value="readOnePost", method=RequestMethod.GET)
	public String readOnePost(HttpSession session, int post_num, Model model){
		logger.info("READ POST");
		
		//포스트 번호에 해당하는 파일명 가져오기(파일명을 직접 가져와도 되긴 하는데 그럼 너무 길어짐)
		String post_file = dao.readPost(post_num);
		String result = null;
		
		try {
			//파일에서 스트림을 통해 주르륵 읽어들인다
			BufferedReader fr = new BufferedReader(new FileReader(post_file));
			
			String line;

			while ((line = fr.readLine()) != null) {
				result = line;
			      }
			
			      fr.close();
			      } catch(Exception e) {
			    	  e.printStackTrace();
			      }
		System.out.println(result);
		model.addAttribute("postText", result);
		
		return "post/readPost";
	}

}
