package sol.one.service;


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
import sol.one.VO.CommentlistVO;
import sol.one.VO.LikeVO;
import sol.one.VO.LikelistVO;
import sol.one.VO.MemberVO;
import sol.one.VO.ReportVO;
import sol.one.VO.T_tradeVO;
import sol.one.VO.tradelistVO;
import sol.one.controller.MypageController;
import sol.one.mapper.MypageMapper;

@Repository
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {

	private static final Logger log = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	
	private final MypageMapper mapper;
	
	
	@Resource(name = "sqlSession")
	SqlSession sqlSession;
	

	//�׽�Ʈ�� �α���
	public MemberVO login(MemberVO mem)throws Exception{
		return mapper.login(mem);
	}
	
	@Override
	public void update_info_mypage(MemberVO mem) throws Exception {
		log.info("update_info_mypage");
		mapper.update_info_mypage(mem);

	}
	@Override
	public void go_report(ReportVO report) throws Exception {
		log.info("go_report");
		mapper.go_report(report);
		
	}

	@Override
	public MemberVO list_user_mypage(Long user_id) throws Exception {
		log.info("list_user_mypage");
		return mapper.list_user_mypage(user_id);
	}

	@Override
	public List<LikelistVO> list_like_mypage(Long user_id) throws Exception {
		log.info("list_like_mypage");
		return mapper.list_like_mypage(user_id);
	}

	@Override
	public List<tradelistVO> list_trade_mypage(@Param("user_id")Long user_id) throws Exception {
		log.info("list_trade_mypage");
		return mapper.list_trade_mypage(user_id);
	}

	@Override
	public List<BoardlistVO> list_board_mypage(Long user_id) throws Exception {
		log.info("list_board_mypage");
		return mapper.list_board_mypage(user_id);
	}

	@Override
	public List<CommentlistVO> list_comment_mypage(Long user_id) throws Exception {
		log.info("list_comment_mypage");
		return mapper.list_comment_mypage(user_id);
	}

	@Override
	public List<ReportVO> list_report_mypage(Long user_id) throws Exception {
		log.info("list_report_mypage");
		return mapper.list_report_mypage(user_id);
	}

	@Override
	public int check_password_mypage(MemberVO mem) throws Exception {
		return mapper.check_password_mypage(mem);
		
	}

	@Override
	public void delete_info_mypage(Long user_id) throws Exception {
		log.info("delete_info_mypage");
		mapper.delete_info_mypage(user_id);
		
	}
}
