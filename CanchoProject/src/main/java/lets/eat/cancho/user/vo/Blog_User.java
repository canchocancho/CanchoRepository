package lets.eat.cancho.user.vo;

public class Blog_User {
	private String user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private String user_verify;
	
	public Blog_User() {
		super();
	}

	public Blog_User(String user_id, String user_name, String user_email, String user_password, String user_verify) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_verify = user_verify;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_verify() {
		return user_verify;
	}

	public void setUser_verify(String user_verify) {
		this.user_verify = user_verify;
	}

	@Override
	public String toString() {
		return "Blog_User [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_password=" + user_password + ", user_verify=" + user_verify + "]";
	}

}
