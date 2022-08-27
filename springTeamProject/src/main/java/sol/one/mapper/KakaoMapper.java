package sol.one.mapper;

import java.util.HashMap;

import sol.one.VO.KakaoDTO;

public interface KakaoMapper {
	
	// 회원 정보 저장
	public void kakaoinsert(HashMap<String, Object> userInfo);
	
	// 정보 확인
	public KakaoDTO findkakao(HashMap<String, Object> userInfo);
	
	public KakaoDTO kakaoNumber(KakaoDTO userInfo);
	

}
