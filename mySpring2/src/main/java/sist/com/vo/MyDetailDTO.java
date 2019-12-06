package sist.com.vo;

public class MyDetailDTO {
	private int postno;
	private String email;
	private String contents;
	private String image;
	private String memberimage;

	public MyDetailDTO() {
		super();
	}

	public MyDetailDTO(int postno, String email, String contents, String image, String memberimage) {
		super();
		this.postno = postno;
		this.email = email;
		this.contents = contents;
		this.image = image;
		this.memberimage = memberimage;
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

	public String getMemberimage() {
		return memberimage;
	}

	public void setMemberimage(String memberimage) {
		this.memberimage = memberimage;
	}

	@Override
	public String toString() {
		return "MyDetailDTO [postno=" + postno + ", email=" + email + ", contents=" + contents + ", image=" + image
				+ ", memberimage=" + memberimage + "]";
	}

}
