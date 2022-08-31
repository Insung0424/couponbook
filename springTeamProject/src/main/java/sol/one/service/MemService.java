package sol.one.service;

import sol.one.VO.MemberVO;

public interface MemService  {
	
	//회원가입
	MemberVO registerMem(MemberVO member);
	
	/** 
	 * 회원 1명 조회하기 ,email이 기준
	 * 로그인 시 사용됨
	 * @param member
	 * @return
	 */
	MemberVO getMemById(MemberVO member);

	/**
	 * 이미 가입된 메일인지 확인용
	 * 입력받은 메일주소가 DB에 있으면 count 수를 반환한다
	 * 편의상 String으로 반환받음..
	 * @param email
	 * @return
	 */
	int mailChk(String email);
	

}
