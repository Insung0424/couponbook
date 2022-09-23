package sol.one.mapper;

import sol.one.VO.MemberVO;

public interface FindMapper {
	
	public String getIdnickname(String nickname);

	public String getIdphone(String phone);
	
	public int checkIdnNickname(MemberVO member);

	public int checkIdnPhone(MemberVO member);
	
	public int updateNewPassword(MemberVO member);

	public int updateNewPassword2(MemberVO member);
	
}
