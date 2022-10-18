package sol.one.mapper;

import java.util.HashMap;

import sol.one.VO.KakaoDTO;
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
	 * 관리자 페이지에서 사용, 회원 상세 조회
	 * @param email
	 * @return MemberVO
	 */
	public MemberVO adminGetMem(String email);
	
	public int count_report(String email);
	
	/**
	 * 메일 주소가 있으면 count 수를 리턴한다
	 * 편의상 String으로 반환받았는데 바꿔야하나?
	 * @param email
	 * @return int
	 */
	public int mailChk(String email);
	
	
	
	//카카오 추가 KakaoMapper 삭제하고 여기다 추가함
	public void kakaoInsert(HashMap<String, Object> userInfo);
	public MemberVO findKakao(HashMap<String, Object> userInfo);
	public MemberVO kakaoNumber(MemberVO userInfo);
	
	
}
