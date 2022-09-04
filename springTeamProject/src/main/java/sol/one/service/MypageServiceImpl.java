package sol.one.service;


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
import sol.one.mapper.MypageMapper;

@Repository
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {

	private static final Logger log = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	
	private final MypageMapper mapper;
	
	
	@Resource(name = "sqlSession")
	SqlSession sqlSession;
	

	//�׽�Ʈ�� �α���
	public UserVO login(UserVO user)throws Exception{
		return mapper.login(user);
	}
	
	@Override
	public void update_info_mypage(UserVO user) throws Exception {
		log.info("update_info_mypage");
		mapper.update_info_mypage(user);

	}

	@Override
	public UserVO list_user_mypage(int user_id) throws Exception {
		log.info("list_user_mypage");
		return mapper.list_user_mypage(user_id);
	}

	@Override
	public LikeVO list_like_mypage(int user_id) throws Exception {
		log.info("list_like_mypage");
		return mapper.list_like_mypage(user_id);
	}

	@Override
	public TradeVO list_trade_mypage(int user_id) throws Exception {
		log.info("list_trade_mypage");
		return mapper.list_trade_mypage(user_id);
	}

	@Override
	public BoardVO list_board_mypage(int user_id) throws Exception {
		log.info("list_board_mypage");
		return mapper.list_board_mypage(user_id);
	}

	@Override
	public CommentVO list_comment_mypage(int user_id) throws Exception {
		log.info("list_comment_mypage");
		return mapper.list_comment_mypage(user_id);
	}

	@Override
	public ReportVO list_report_mypage(int user_id) throws Exception {
		log.info("list_report_mypage");
		return mapper.list_report_mypage(user_id);
	}

	@Override
	public int check_password_mypage(UserVO user) throws Exception {
		return mapper.check_password_mypage(user);
		
	}

	@Override
	public void delete_info_mypage(int user_id) throws Exception {
		log.info("delete_info_mypage");
		mapper.delete_info_mypage(user_id);
		
	}
}
