package sist.com.vo;

public class ReplyDTO {
	private int postno;
	private String email;
	private String contents;
	private String image;
	public ReplyDTO() {
		super();
	}
	public ReplyDTO(int postno, String email, String contents, String image) {
		super();
		this.postno = postno;
		this.email = email;
		this.contents = contents;
		this.image = image;
	}
	public int getPostno() {
		return postno;
	}
	public void setPostno(int postno) {
		this.postno = postno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "ReplyDTO [postno=" + postno + ", email=" + email + ", contents=" + contents + ", image=" + image + "]";
	}
	
}
