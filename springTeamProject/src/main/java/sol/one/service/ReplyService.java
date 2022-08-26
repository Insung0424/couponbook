package sol.one.service;

import java.util.List;

import sol.one.VO.replyVO;

public interface ReplyService {

	public int register(replyVO vo);
	public List<replyVO> getMyComment(int user_id);
	public int modify(replyVO vo);
	public int remove(int comment_no);
	public int removeAll(int product_id);
	
}
