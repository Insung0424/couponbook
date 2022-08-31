package sol.one.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.MemberVO;
import sol.one.mapper.MemMapper;

@Service
@Log4j
@RequiredArgsConstructor
public class MemServiceImpl implements MemService {
	
	private final MemMapper mapper;

	@Override
	public MemberVO registerMem(MemberVO member) {
		// 회원 가입
		log.info("MemServiceImpl reg ------------");
		mapper.joinMem(member);
//		mapper.addMem(member);
		return member;
	}

	@Override
	public MemberVO getMemById(MemberVO member) {
		// 회원1명 정보 가져오기
		log.info("MemServiceImpl getMemById ------------");
		
		return mapper.getMemById(member);
	}

	@Override
	public int mailChk(String email) {
		// 메일주소 count 수 반환받기
		System.out.println("MS 37: "+ email);

		int cnt = mapper.mailChk(email);
		System.out.println("MS 40: "+ cnt);
		
		return cnt;
	}



}
