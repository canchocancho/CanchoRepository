package lets.eat.cancho.post.vo;

public class Post {

	private int post_num;
	private String post_title;
	private String post_title_clean;
	private String post_file;
	private String user_id;
	private String post_date;
	
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_title_clean() {
		return post_title_clean;
	}
	public void setPost_title_clean(String post_title_clean) {
		this.post_title_clean = post_title_clean;
	}
	public String getPost_file() {
		return post_file;
	}
	public void setPost_file(String post_file) {
		this.post_file = post_file;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Post(int post_num, String post_title, String post_title_clean, String post_file, String user_id,
			String post_date) {
		super();
		this.post_num = post_num;
		this.post_title = post_title;
		this.post_title_clean = post_title_clean;
		this.post_file = post_file;
		this.user_id = user_id;
		this.post_date = post_date;
	}
	
	@Override
	public String toString() {
		return "Post [post_num=" + post_num + ", post_title=" + post_title + ", post_title_clean=" + post_title_clean
				+ ", post_file=" + post_file + ", user_id=" + user_id + ", post_date=" + post_date + "]";
	}

}
