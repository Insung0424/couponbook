package sol.one.service;

import sol.one.VO.KakaoDTO;

public interface KakaoInterface {
	
	public String getAccessToken(String authorize_code);
	public KakaoDTO getUserInfo(String access_Token);
	public KakaoDTO kakaoNumber(KakaoDTO userInfo);

}
