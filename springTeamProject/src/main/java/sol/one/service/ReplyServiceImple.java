package sol.one.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import sol.one.VO.replyVO;
import sol.one.mapper.ReplyMapper;

@Service("ReplyService")
@RequiredArgsConstructor
public class ReplyServiceImple implements ReplyService{

	private ReplyMapper mapper;
	
	@Override
	public int register(replyVO vo) {
		return mapper.insert_co(vo);
	}

	@Override
	public List<replyVO> getMyComment(int user_id) {
		return mapper.read(user_id);
	}

	@Override
	public int modify(String change_comment, replyVO vo) {
		return mapper.update(change_comment, vo);
	}

	@Override
	public int remove(replyVO vo) {
		return mapper.delete(vo);
	}

}
