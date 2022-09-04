package sol.one.service;

import java.util.List;

import sol.one.VO.CommentVO;

public interface CommentService {

	public int register(CommentVO vo);
	public int register_tab(CommentVO vo);
	public int upNumber(CommentVO vo);
	public int countComment(int comment_no_level);
	public String getLevel(int product_id,int user_id);
	public List<CommentVO> getComment(int product_id,int user_id_1,int user_id_2);
	public List<CommentVO> getAllComment(int product_id);
	public int modify(CommentVO vo);
	public int remove(int comment_no);
	public int removeAll(int product_id);
	
}
