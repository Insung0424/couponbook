package sol.one.service;

import java.util.List;

import sol.one.VO.replyVO;

public interface ReplyService {

	public int register(replyVO vo);
	public int register_tab(replyVO vo);
	public int upNumber(int product_id,int user_id,int comment_no_level);
	public List<replyVO> getComment(int product_id,int user_id_1,int user_id_2);
	public List<replyVO> getAllComment(int product_id);
	public int modify(replyVO vo);
	public int remove(int comment_no);
	public int removeAll(int product_id);
	
}
