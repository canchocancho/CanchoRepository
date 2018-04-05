package lets.eat.cancho.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lets.eat.cancho.user.vo.Blog_User;

@Repository
public class UserDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	
	//특정 회원 조회
	public Blog_User searchUserOne(String user_id){
		logger.info("특정 회원 조회 시작 - 다오");
			
		Blog_User user = null;
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
			
		try{
			user = mapper.searchUserOne(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		logger.info("특정 회원 조회 종료 - 다오");
		
		return user;
	}
	
	//회원 등록
	public int joinUser(Blog_User user) {
		logger.info("회원 등록 시작 - 다오");
		
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = 0;
		logger.info(user.toString());
		try {
			result = mapper.joinUser(user);
			logger.info("등록여부 : "  + result);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("회원 등록 종료 - 다오");
		
		return result;
	}
	
	//이메일 인증
	public int verifyUser(String user_id){
		logger.info("이메일 인증 시작 - 다오");
		
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		int result = 0;
		
		try {
			result = mapper.verifyUser(user_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("이메일 인증 종료 - 다오");
		
		return result;
	}

}
