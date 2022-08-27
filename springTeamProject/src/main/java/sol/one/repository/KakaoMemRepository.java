package sol.one.repository;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sol.one.VO.KakaoDTO;

@Repository
public class KakaoMemRepository {

	//mapper 호출용 클래스 주입
	@Autowired
	private SqlSessionTemplate sql;
	
	// 회원 정보 저장
	public void kakaoInsert(HashMap<String, Object> userInfo) {
		sql.insert("Member.kakaoinsert", userInfo);
	}
	
	// 정보 확인
	public KakaoDTO findKakao(HashMap<String, Object> userInfo) {
		System.out.println("RNickname:"+userInfo.get("nickname"));
		System.out.println("REmail:"+userInfo.get("email"));
		
		return sql.selectOne("Memeber.findKakao", userInfo);
	}
	
	public KakaoDTO kakaoNumber(KakaoDTO userInfo) {
		return sql.selectOne("Member.kakaoNumber",userInfo);
	}

}
