package sessionDB;
/*
SQL> CREATE TABLE sessionDB(
  2  id varchar2(10),
  3  pw varchar2(10),
  4  name varchar2(15),
  5  email varchar2(30)
  6  );
Table created.

SQL> commit;
Commit complete.

SQL> DROP TABLE sessionDB;
Table dropped.

 */
public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String email;
	
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
	
	
	
}
