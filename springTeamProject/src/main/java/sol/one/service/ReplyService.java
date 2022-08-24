package sol.one.service;

import java.util.List;

import sol.one.VO.replyVO;

public interface ReplyService {

	public int register(replyVO vo);
	public List<replyVO> getMyComment(int user_id);
	public int modify(String change_comment,replyVO vo);
	public int remove(replyVO vo);
	
}
