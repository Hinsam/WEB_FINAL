package javabean;

public class SubmitFormBean {
	private String id; //ID
	private String address; //주소
	private String phone; //번호
	private String date; //날짜
	private String feedback; //요청의 말
 
	
	//메뉴 [source]/[Generate Getter and Setters ...]를 이용 자동 생성
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
}