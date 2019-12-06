package sist.com.vo;

public class PostDetailDTO {

	private int postno;
	private String email;
	private String postdate;
	private String contents;
	private String image;
	private String category;
	private int postlike;
	private String memberimage;

	public PostDetailDTO() {
		super();
	}

	public PostDetailDTO(int postno, String email, String postdate, String contents, String image, String category,
			int postlike, String memberimage) {
		super();
		this.postno = postno;
		this.email = email;
		this.postdate = postdate;
		this.contents = contents;
		this.image = image;
		this.category = category;
		this.postlike = postlike;
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

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPostlike() {
		return postlike;
	}

	public void setPostlike(int postlike) {
		this.postlike = postlike;
	}

	public String getMemberimage() {
		return memberimage;
	}

	public void setMemberimage(String memberimage) {
		this.memberimage = memberimage;
	}

	@Override
	public String toString() {
		return "PostDetailDTO [postno=" + postno + ", email=" + email + ", postdate=" + postdate + ", contents="
				+ contents + ", image=" + image + ", category=" + category + ", postlike=" + postlike + ", memberimage="
				+ memberimage + "]";
	}

}
