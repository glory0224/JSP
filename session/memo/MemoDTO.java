package memo;

public class MemoDTO {
	
	private String id;
	private String email;
	private String memo;
	
	
	
	public MemoDTO() {
		super();
	}
	public MemoDTO(String id, String email, String memo) {
		super();
		this.id = id;
		this.email = email;
		this.memo = memo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	
	
}
