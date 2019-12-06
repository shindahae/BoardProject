package sist.com.vo;

public class MemberVO {

	private String name;
	private String email;
	private String password;
	private String birth;
	private String gender;
	private int postnumber;
	private int follower;
	private int follow;
	private String introduce;
	private String image;

	public MemberVO() {
		super();
	}

	public MemberVO(String name, String email, String password, String birth, String gender, int postnumber,
			int follower, int follow, String introduce, String image) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.birth = birth;
		this.gender = gender;
		this.postnumber = postnumber;
		this.follower = follower;
		this.follow = follow;
		this.introduce = introduce;
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getPostnumber() {
		return postnumber;
	}

	public void setPostnumber(int postnumber) {
		this.postnumber = postnumber;
	}

	public int getFollower() {
		return follower;
	}

	public void setFollower(int follower) {
		this.follower = follower;
	}

	public int getFollow() {
		return follow;
	}

	public void setFollow(int follow) {
		this.follow = follow;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", email=" + email + ", password=" + password + ", birth=" + birth
				+ ", gender=" + gender + ", postnumber=" + postnumber + ", follower=" + follower + ", follow=" + follow
				+ ", introduce=" + introduce + ", image=" + image + "]";
	}

}
