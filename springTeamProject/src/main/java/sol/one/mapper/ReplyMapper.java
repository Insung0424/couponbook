package sol.one.mapper;

import java.util.List;

import sol.one.VO.replyVO;

public interface ReplyMapper {
	
	public int insert_co(replyVO vo);
	
	public List<replyVO> read(int user_id);
	
	public int delete(int comment_no);
	
	public int deleteAll(int product_id);
	
	public int update(replyVO vo);
	
}
