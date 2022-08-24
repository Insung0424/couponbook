package sol.one.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sol.one.VO.replyVO;

public interface ReplyMapper {
	
	public int insert_co(replyVO vo);
	
	public List<replyVO> read(int user_id);
	
	public int delete(replyVO vo);
	
	public int update(@Param("change_comment") String change_comment,@Param("vo") replyVO vo);
	
}
