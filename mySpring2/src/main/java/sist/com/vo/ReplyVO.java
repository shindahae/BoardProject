package sist.com.vo;

public class ReplyVO {
private int no;
	private int postno;
	private String email;
	private String contents;
	private String date;
	public ReplyVO() {
		super();
	}
	public ReplyVO(int no, int postno, String email, String contents, String date) {
		super();
		this.no = no;
		this.postno = postno;
		this.email = email;
		this.contents = contents;
		this.date = date;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "ReplyVO [no=" + no + ", postno=" + postno + ", email=" + email + ", contents=" + contents + ", date="
				+ date + "]";
	}
	
	
	
}
