package sol.one.mapper;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import sol.one.VO.BoardVO;
import sol.one.VO.BoardlistVO;
import sol.one.VO.CommentVO;
import sol.one.VO.LikeVO;
import sol.one.VO.LikelistVO;
import sol.one.VO.MemberVO;
import sol.one.VO.ReportVO;
import sol.one.VO.T_tradeVO;
import sol.one.VO.tradelistVO;
import sol.one.controller.MypageController;

@Repository
@RequiredArgsConstructor
public class MypageMapperImpl implements MypageMapper{
	
	private static final Logger log = LoggerFactory.getLogger(MypageMapperImpl.class);
	
	
	@Resource(name = "sqlSession")
	SqlSession sqlSession;
	
	@Override
	public MemberVO login(MemberVO mem) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MypageMapper.login",mem);
	}

	@Override
	public MemberVO list_user_mypage(Long user_id) throws Exception {
	
		return sqlSession.selectOne("MypageMapper.list_user_mypage",user_id);
	}

	@Override
	public void update_info_mypage(MemberVO mem) throws Exception {
		sqlSession.update("MypageMapper.update_info_mypage", mem);
		
	}

	@Override
	public void delete_info_mypage(Long user_id) throws Exception {
		sqlSession.update("MypageMapper.delete_info_mypage",user_id);
		
	}
	@Override
	public void go_report(ReportVO report) throws Exception {
		sqlSession.insert("MypageMapper.go_report",report);
		
	}

	@Override
	public List<LikelistVO> list_like_mypage(Long user_id) throws Exception {
		
		return sqlSession.selectOne("MypageMapper.list_like_mypage",user_id);
	}

	@Override
	public List<tradelistVO> list_trade_mypage(@Param("user_id")Long user_id) throws Exception {

		return sqlSession.selectOne("MypageMapper.list_trade_mypage",user_id);
	}

	@Override
	public List<BoardlistVO> list_board_mypage(Long user_id) throws Exception {
	
		return sqlSession.selectList("MypageMapper.list_board_mypage",user_id);
	}

	@Override
	public List<CommentVO> list_comment_mypage(Long user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MypageMapper.list_comment_mypage",user_id);
	}

	@Override
	public List<ReportVO> list_report_mypage(Long user_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MypageMapper.list_report_mypage",user_id);
	}

	@Override
	public int check_password_mypage(MemberVO mem) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("MypageMapper.check_password_mypage",mem);
		
	}

}
