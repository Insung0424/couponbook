package sol.one.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import sol.one.VO.BoardVO;
import sol.one.VO.CommentVO;
import sol.one.VO.LikeVO;
import sol.one.VO.ReportVO;
import sol.one.VO.TradeVO;
import sol.one.VO.UserVO;
import sol.one.controller.MypageController;

@Repository
@RequiredArgsConstructor
public class MypageMapperImpl implements MypageMapper{
	
	private static final Logger log = LoggerFactory.getLogger(MypageMapperImpl.class);
	
	
	@Resource(name = "sqlSession")
	SqlSession sqlSession;
	
	@Override
	public UserVO login(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MypageMapper.login",user);
	}

	@Override
	public UserVO list_user_mypage(int user_id) throws Exception {
	
		return sqlSession.selectOne("MypageMapper.list_user_mypage",user_id);
	}

	@Override
	public void update_info_mypage(UserVO user) throws Exception {
		sqlSession.update("MypageMapper.update_info_mypage", user);
		
	}

	@Override
	public void delete_info_mypage(int user_id) throws Exception {
		sqlSession.update("MypageMapper.delete_info_mypage",user_id);
		
	}
	@Override
	public void go_report(ReportVO report) throws Exception {
		sqlSession.insert("MypageMapper.go_report",report);
		
	}

	@Override
	public List<LikeVO> list_like_mypage(int user_id) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.list_like_mypage",user_id);
	}

	@Override
	public List<TradeVO> list_trade_mypage(int user_id) throws Exception {

		return sqlSession.selectOne("MypageMapper.list_trade_mypage",user_id);
	}

	@Override
	public List<BoardVO> list_board_mypage(int user_id) throws Exception {
	
		return sqlSession.selectList("MypageMapper.list_board_mypage",user_id);
	}

	@Override
	public List<CommentVO> list_comment_mypage(int user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MypageMapper.list_comment_mypage",user_id);
	}

	@Override
	public List<ReportVO> list_report_mypage(int user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MypageMapper.list_report_mypage",user_id);
	}

	@Override
	public int check_password_mypage(UserVO user) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MypageMapper.check_password_mypage",user);
		
	}

}
