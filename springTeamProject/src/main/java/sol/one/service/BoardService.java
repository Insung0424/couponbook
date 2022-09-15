package sol.one.service;

import java.util.List;

import sol.one.VO.BoardVO;

public interface BoardService {
	
	public int insertBoard(BoardVO vo);
	
	public BoardVO getBoard(int board_no);
	
	public List<BoardVO> getBoardList();
	
	public int deleteBoard(int board_no);
	
	public int updateBoard(int board_no);
	
	public void modifyBoard(BoardVO board);

}
