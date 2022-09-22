package sol.one.service;


import sol.one.VO.MemberVO;


public interface FindService {
	
	public String getIdnickname(String nickname);

	public String getIdphone(String phone);
	
	public int checkIdnNickname(MemberVO member);
	
	public int updateNewPassword(String password);
	
}
