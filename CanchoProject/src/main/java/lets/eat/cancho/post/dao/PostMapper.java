package lets.eat.cancho.post.dao;

import java.util.ArrayList;

import lets.eat.cancho.post.vo.Post;

public interface PostMapper {

	public int writePost(Post post);
	public ArrayList<Post> postList();
	public String readPost(int post_num);
}
