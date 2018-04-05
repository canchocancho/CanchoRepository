package lets.eat.cancho.user.dao;

import lets.eat.cancho.user.vo.Blog_User;

public interface UserMapper {
	
	//특정 회원 조회
	public Blog_User searchUserOne(String user_id);
	
	//회원등록
	public int joinUser(Blog_User user);
	
	//이메일 인증
	public int verifyUser(String user_id);

}
