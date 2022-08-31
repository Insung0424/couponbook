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
	public int register_tab(replyVO vo) {
		return mapper.insert_co_tab(vo);
	}

	@Override
	public List<replyVO> getComment(int product_id,int user_id_1,int user_id_2) {
		return mapper.read(product_id,user_id_1,user_id_2);
	}

	@Override
	public List<replyVO> getAllComment(int product_id) {
		return mapper.readAll(product_id);
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

	@Override
	public int upNumber(replyVO vo) {
		return mapper.tabGroupNoUp(vo);
	}

	@Override
	public int countComment(int comment_no_level) {
		return mapper.countMyComment(comment_no_level);
	}

	@Override
	public String getLevel(int product_id,int user_id) {
		return mapper.getCommentNoLevel(product_id,user_id);
	}

}
