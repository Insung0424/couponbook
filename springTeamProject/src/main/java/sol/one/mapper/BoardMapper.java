package sol.one.mapper;

import java.util.List;

import sol.one.VO.BoardVO;

public interface BoardMapper {
	
	public int insertBoard(BoardVO vo);
	
	public BoardVO getBoard(int board_no);
	
	public List<BoardVO> getBoardList();
	
	public int deleteBoard(int board_no);
	
	public int updateBoard(int board_no);

}
