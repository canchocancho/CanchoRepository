package lets.eat.cancho.post.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lets.eat.cancho.post.vo.Post;

@Repository
public class PostDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(PostDAO.class);
	
	@Autowired
	SqlSession session;
	
	//포스트 작성
	public int writePost(Post post){
		
		logger.info("포스트 작성 시작");
		
		PostMapper mapper = session.getMapper(PostMapper.class);
		
		int result = 0;
		
		try{
			result = mapper.writePost(post);
			
		} catch(Exception e){
			e.printStackTrace();
		}

		return result;
	}
	
	//포스트 목록
	public ArrayList<Post> postList(){
		
		logger.info("포스트 목록 불러오기");
		
		ArrayList<Post> list = new ArrayList<Post>();
		PostMapper mapper = session.getMapper(PostMapper.class);

		try{
			list = mapper.postList();
			
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}

}
