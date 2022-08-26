package sol.one.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import sol.one.VO.replyVO;
import sol.one.mapper.ReplyMapper;

@Service("ReplyService")
@RequiredArgsConstructor
public class ReplyServiceImple implements ReplyService{

	private final ReplyMapper mapper;
	
	@Override
	public int register(replyVO vo) {
		return mapper.insert_co(vo);
	}

	@Override
	public List<replyVO> getMyComment(int user_id) {
		return mapper.read(user_id);
	}

	@Override
	public int modify(replyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int remove(int comment_no) {
		return mapper.delete(comment_no);
	}

	@Override
	public int removeAll(int product_id) {
		return mapper.deleteAll(product_id);
	}
	
}
