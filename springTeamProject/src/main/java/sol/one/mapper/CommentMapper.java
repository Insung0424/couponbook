package sol.one.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sol.one.VO.Comment2VO;
import sol.one.VO.CommentVO;

public interface CommentMapper {
	
	public int insert_co(CommentVO vo);
	
	public int insert_co_tab(CommentVO vo);
	
	public int tabGroupNoUp(CommentVO vo);
	
	public int countMyComment(int comment_no_level); //사용안함 아래꺼로 대체함
	public int[] getCommentNoLevel(@Param("product_id")int product_id,@Param("user_id")Long user_id);
	
	public List<Comment2VO> read(@Param("product_id")int product_id,@Param("user_id_1")Long user_id_1,@Param("user_id_2")Long user_id_2,@Param("comment_no_level")int comment_no_level);
	
	public List<Comment2VO> readAll(@Param("product_id")int product_id);
	
	public int delete(int comment_no);
	
	public int deleteAll(int product_id);
	
	public int update(CommentVO vo);
	
}
