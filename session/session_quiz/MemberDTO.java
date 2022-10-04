package session_quiz;
/*

 
SQL> CREATE TABLE session_quiz(
  2  id varchar2(10),
  3  pw varchar2(10),
  4  username varchar2(15),
  5  address varchar2(20),
  6  mobile varchar2(15)
  7  );

SQL> INSERT INTO session_quiz VALUES('admin', '1234', '관리자', '서울시', '010-1234-1234');
SQL> commit;

 */
public class MemberDTO {
	private String id;
	private String pw;
	private String confirm;
	private String userName;
	private String address;
	private String mobile;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
}
