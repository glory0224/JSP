package session;

import java.util.ArrayList;

public class MemberDAO {
	// DataBase를 대신해서 데이터를 저장할 공간
	private static ArrayList<MemberDTO> members = new ArrayList<>();
	
	public void insert(MemberDTO member) {
		members.add(member);
	}
	
	public MemberDTO selectId(String id) {
		for(MemberDTO member : members) {
			if(member.getId().equals(id)) {
				return member;
			}
		}
		// 사용자가 매개변수로 전달한 아이디가 저장공간에 없다는 의미.
		return null;
	}
	public ArrayList<MemberDTO> list() {
		return members;
	}
	// 수정할 데이터를 받아서 ArrayList에 기존 데이터를 찾아 수정함.
	public void update(MemberDTO member) { 
		MemberDTO old = selectId(member.getId());
		int index = members.indexOf(old);
		members.set(index, member);
	}
}
