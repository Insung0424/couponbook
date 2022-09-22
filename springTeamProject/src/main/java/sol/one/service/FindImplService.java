package sol.one.service;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import sol.one.VO.MemberVO;
import sol.one.mapper.FindMapper;

@Service
@Log4j
@RequiredArgsConstructor
public class FindImplService implements FindService {
	
	private final FindMapper mapper;

	@Override
	public String getIdnickname(String nickname) {
		return mapper.getIdnickname(nickname);
	}

	@Override
	public String getIdphone(String phone) {
		return mapper.getIdphone(phone);
	}

	@Override
	public int checkIdnNickname(MemberVO member) {
		return mapper.checkIdnNickname(member);
	}

	@Override
	public int updateNewPassword(String password) {
		return mapper.updateNewPassword(password);
	}

}
