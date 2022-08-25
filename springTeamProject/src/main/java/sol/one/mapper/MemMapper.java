package sol.one.mapper;

import sol.one.VO.MemberVO;

public interface MemMapper {
	/**
	 * 회원가입: selectKey 사용 
	 * @param member
	 */
	public void joinMem(MemberVO member);
	
	/**
	 * 회원가입: 일반 insert문 사용 
	 * @param member
	 */
	public void addMem(MemberVO member);
	
	//회원 1명 정보 가져오기
	public MemberVO getMemById(MemberVO member);

	/**
	 * 메일 주소가 있으면 count 수를 리턴한다
	 * 편의상 String으로 반환받았는데 바꿔야하나?
	 * @param email
	 * @return int
	 */
	public int mailChk(String email);
}
