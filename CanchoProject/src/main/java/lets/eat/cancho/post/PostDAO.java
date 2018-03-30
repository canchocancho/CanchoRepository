package lets.eat.cancho.post;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
