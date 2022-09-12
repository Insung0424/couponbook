package sol.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import sol.one.VO.BoardVO;
import sol.one.mapper.BoardMapper;


@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Autowired
	private final BoardMapper mapper;
	
	@Override
	public int insertBoard(BoardVO vo) {
		return mapper.insertBoard(vo);
	}

	@Override
	public BoardVO getBoard(int board_no) {
		return mapper.getBoard(board_no);
	}

	@Override
	public List<BoardVO> getBoardList() {
		return mapper.getBoardList();
	}

	@Override
	public int deleteBoard(int board_no) {
		return mapper.deleteBoard(board_no);
	}

	@Override
	public int updateBoard(int board_no) {
		return mapper.updateBoard(board_no);
	}

}
