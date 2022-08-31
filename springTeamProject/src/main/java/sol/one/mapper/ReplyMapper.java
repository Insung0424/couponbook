package sol.one.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sol.one.VO.replyVO;

public interface ReplyMapper {
	
	public int insert_co(replyVO vo);
	
	public int insert_co_tab(replyVO vo);
	
	public int tabGroupNoUp(replyVO vo);
	
	public int countMyComment(int comment_no_level);
	
	public String getCommentNoLevel(@Param("product_id")int product_id,@Param("user_id")int user_id);
	
	public List<replyVO> read(@Param("product_id")int product_id,@Param("user_id_1")int user_id_1,@Param("user_id_2")int user_id_2);
	
	public List<replyVO> readAll(int product_id);
	
	public int delete(int comment_no);
	
	public int deleteAll(int product_id);
	
	public int update(replyVO vo);
	
}
